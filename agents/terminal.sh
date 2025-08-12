#!/bin/bash

# Agent to bring AI to the terminal
# Currently only supports GitHub Copilot

BASE_URL="https://openrouter.ai/api/v1/chat/completions"
AGENT_EXPERT_INSTRUCTIONS="You are an AI agent that can answer questions and provide information. You are an expert in various domains, including programming, console command line tools and libraries, and general engineering topic knowledge. Your responses should be concise, accurate, and always suggesting next steps."

query() {
    local query="$1"
    
    curl -s -X POST \
        -H "Authorization: Bearer $OPENROUTER_API_KEY" \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        -d "{
            \"model\": \"openai/gpt-oss-20b:free\",
            \"messages\": [
                {\"role\": \"system\", \"content\": \"$AGENT_EXPERT_INSTRUCTIONS\"},
                {\"role\": \"user\", \"content\": \"$query\"}
            ],
        }" \
        "$BASE_URL"
}

parse_response() {
    local response="$1"
    local error="Error: Failed to parse response"

    echo "$response" | jq -r '.choices[0].message.reasoning' 2>/dev/null || echo "$error"
    echo "$response" | jq -r '.choices[0].message.content' 2>/dev/null || echo "$error"
}

case "$1" in
    "--help" | "-h")
        echo "Usage:"
        echo "  $0 \"Your query here\"       - Query Copilot (requires quotes)"
        echo "  $0 --help                   - Show this help"
        exit 0
        ;;
    "")
        echo "Usage: $0 \"Your query here\""
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

echo "Querying with: $QUERY"
echo "Response:"
response=$(query "$QUERY")

if [ $? -eq 0 ]; then
    parse_response "$response"
else
    echo "Error: Failed to get response"
    exit 1
fi
