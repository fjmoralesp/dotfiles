#!/bin/bash

# Agent to bring AI to the terminal
# Currently only supports GitHub Copilot

CLIENT_ID=""
DEVICE_CODE_URL="https://github.com/login/device/code"
ACCESS_TOKEN_URL="https://github.com/login/oauth/access_token"
COPILOT_API_KEY_URL="https://api.github.com/copilot_internal/v2/token"
USER_AGENT="GitHubCopilotChat/0.26.7"
TOKEN_FILE="$HOME/.copilot_tokens.json"

get_device_code() {
    curl -s -X POST "$DEVICE_CODE_URL" \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "User-Agent: $USER_AGENT" \
        -d '{
            "client_id": "'$CLIENT_ID'",
            "scope": "read:user"
        }'
}

poll_for_token() {
    local device_code="$1"
    local interval="$2"
    
    while true; do
        sleep "$interval"
        
        local response=$(curl -s -X POST "$ACCESS_TOKEN_URL" \
            -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "User-Agent: $USER_AGENT" \
            -d '{
                "client_id": "'$CLIENT_ID'",
                "device_code": "'$device_code'",
                "grant_type": "urn:ietf:params:oauth:grant-type:device_code"
            }')
        
        local access_token=$(echo "$response" | jq -r '.access_token // empty')
        local error=$(echo "$response" | jq -r '.error // empty')
        
        if [ -n "$access_token" ] && [ "$access_token" != "null" ]; then
            echo "$access_token"
            return 0
        elif [ "$error" = "authorization_pending" ]; then
            echo "Waiting for authorization..." >&2
            continue
        elif [ -n "$error" ]; then
            echo "Error: $error" >&2
            return 1
        fi
    done
}

get_copilot_token() {
    local github_token="$1"
    
    curl -s "$COPILOT_API_KEY_URL" \
        -H "Accept: application/json" \
        -H "Authorization: Bearer $github_token" \
        -H "User-Agent: $USER_AGENT" \
        -H "Editor-Version: vscode/1.99.3" \
        -H "Editor-Plugin-Version: copilot-chat/0.26.7" \
        -H "Copilot-Integration-Id: vscode-chat"
}

authenticate() {
    echo "Starting GitHub Copilot authentication..."
    
    local device_response=$(get_device_code)

    if [ $? -ne 0 ]; then
        echo "Error: Failed to get device code"
        exit 1
    fi
    
    local device_code=$(echo "$device_response" | jq -r '.device_code')
    local user_code=$(echo "$device_response" | jq -r '.user_code')
    local verification_uri=$(echo "$device_response" | jq -r '.verification_uri')
    local interval=$(echo "$device_response" | jq -r '.interval // 5')
    
    echo
    echo "Please visit: $verification_uri"
    echo "Enter code: $user_code"
    echo
    echo "Waiting for authorization..."
    
    local github_token=$(poll_for_token "$device_code" "$interval")
    
    if [ $? -ne 0 ]; then
        echo "Authentication failed"
        exit 1
    fi
    
    echo "Getting Copilot API token..."

    echo "$github_token"
    
    local copilot_response=$(get_copilot_token "$github_token")

    echo "$copilot_response"

    local copilot_token=$(echo "$copilot_response" | jq -r '.token')
    local expires_at=$(echo "$copilot_response" | jq -r '.expires_at')
    
    if [ "$copilot_token" = "null" ] || [ -z "$copilot_token" ]; then
        echo "Error: Failed to get Copilot token"
        exit 1
    fi
    
    local token_data=$(jq -n \
        --arg github_token "$github_token" \
        --arg copilot_token "$copilot_token" \
        --arg expires_at "$expires_at" \
        '{
            "github_token": $github_token,
            "copilot_token": $copilot_token,
            "expires_at": ($expires_at | tonumber)
        }')
    
    echo "$token_data" > "$TOKEN_FILE"
    chmod 600 "$TOKEN_FILE"
    
    echo "Authentication successful! Tokens saved to $TOKEN_FILE"
}

get_valid_token() {
    if [ ! -f "$TOKEN_FILE" ]; then
        echo "No token file found. Please authenticate first." >&2
        return 1
    fi
    
    local token_data=$(cat "$TOKEN_FILE")
    local copilot_token=$(echo "$token_data" | jq -r '.copilot_token')
    local expires_at=$(echo "$token_data" | jq -r '.expires_at')
    local current_time=$(date +%s)
    
    if [ "$expires_at" -lt $((current_time + 300)) ]; then
        echo "Token expired. Refreshing..." >&2
        
        local github_token=$(echo "$token_data" | jq -r '.github_token')
        local copilot_response=$(get_copilot_token "$github_token")
        local new_copilot_token=$(echo "$copilot_response" | jq -r '.token')
        local new_expires_at=$(echo "$copilot_response" | jq -r '.expires_at')
        
        if [ "$new_copilot_token" = "null" ] || [ -z "$new_copilot_token" ]; then
            echo "Error: Failed to refresh token. Please re-authenticate." >&2
            return 1
        fi
        
        local updated_data=$(echo "$token_data" | jq \
            --arg copilot_token "$new_copilot_token" \
            --arg expires_at "$new_expires_at" \
            '.copilot_token = $copilot_token | .expires_at = ($expires_at | tonumber)')
        
        echo "$updated_data" > "$TOKEN_FILE"
        copilot_token="$new_copilot_token"
    fi
    
    echo "$copilot_token"
}

query_copilot() {
    local query="$1"
    local token="$2"
    
    curl -s -X POST \
        -H "Authorization: Bearer $token" \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        -H "User-Agent: $USER_AGENT" \
        -H "Editor-Version: vscode/1.99.3" \
        -H "Editor-Plugin-Version: copilot-chat/0.26.7" \
        -H "Copilot-Integration-Id: vscode-chat" \
        -d "{
            \"messages\": [
                {\"role\": \"user\", \"content\": \"$query\"}
            ],
            \"model\": \"gpt-4\",
            \"temperature\": 0.7,
            \"max_tokens\": 1000
        }" \
        https://api.githubcopilot.com/chat/completions
}

case "$1" in
    "--auth" | "-a")
        authenticate
        exit 0
        ;;
    "--help" | "-h")
        echo "Usage:"
        echo "  $0 --auth                    - Authenticate with GitHub Copilot"
        echo "  $0 --prompt <text>           - Query Copilot without quotes (all args after --prompt)"
        echo "  $0 \"Your query here\"       - Query Copilot (requires quotes)"
        echo "  $0 --help                   - Show this help"
        exit 0
        ;;
    "")
        echo "Usage: $0 \"Your query here\" or $0 --auth"
        echo "Use '$0 --help' for more information"
        exit 1
        ;;
    *)
        QUERY="$1"
        ;;
esac

if [ -z "$QUERY" ]; then
    echo "Error: No query provided"
    exit 1
fi

TOKEN=$(get_valid_token)
if [ $? -ne 0 ]; then
    echo "Please authenticate first: $0 --auth"
    exit 1
fi

echo "Querying Copilot with: $QUERY"
echo "Response:"
response=$(query_copilot "$QUERY" "$TOKEN")

if [ $? -eq 0 ]; then
    echo "$response" | jq -r '.choices[0].message.content' 2>/dev/null || echo "Error: Failed to parse response"
else
    echo "Error: Failed to get response from Copilot"
    exit 1
fi
