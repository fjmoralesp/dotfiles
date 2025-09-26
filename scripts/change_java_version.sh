#!/bin/bash

# Java Alternatives Management Script
# This script removes existing Java symlinks from /etc/alternatives
# and creates new ones pointing to a specified Java installation
#
# Usage examples:
#   ./change_java_version.sh /home/francisco/.jvm/temurin23 23
#   ./change_java_version.sh /usr/lib/jvm/java-17-openjdk 17
#   ./change_java_version.sh /opt/java/jdk-21 21

set -e  # Exit on any error

# Check if script is run with correct arguments
if [ $# -ne 2 ]; then
    echo "Error: This script requires exactly 2 arguments."
    echo "Usage: $0 <java_home_path> <java_version>"
    echo "Example: $0 /home/francisco/.jvm/temurin23 23"
    exit 1
fi

JAVA_HOME="$1"
JAVA_VERSION="$2"
ALTERNATIVES_DIR="/etc/alternatives"

# Validate Java home directory exists
if [ ! -d "$JAVA_HOME" ]; then
    echo "Error: Java home directory '$JAVA_HOME' does not exist."
    exit 1
fi

# Validate we have sudo access
if ! sudo -n true 2>/dev/null; then
    echo "This script requires sudo privileges. You may be prompted for your password."
fi

echo "Starting Java alternatives management..."
echo "Java Home: $JAVA_HOME"
echo "Java Version: $JAVA_VERSION"
echo

# Define the base files to manage (version-specific ones will be found dynamically)
BASE_FILES_TO_REMOVE=(
    "java"
    "java.1.gz"
    "jre"
    "jcmd"
    "jcmd.1.gz"
)

# Find version-specific files dynamically
VERSION_SPECIFIC_FILES=()
if [ -d "$ALTERNATIVES_DIR" ]; then
    echo "Scanning for existing version-specific files..."
    # Find all jre_* files 
    while IFS= read -r -d '' file; do
        basename_file=$(basename "$file")
        # Skip the base "jre" file as it's already in BASE_FILES_TO_REMOVE
        if [[ "$basename_file" != "jre" && "$basename_file" == jre_* ]]; then
            VERSION_SPECIFIC_FILES+=("$basename_file")
            echo "Found: $basename_file"
        fi
    done < <(find "$ALTERNATIVES_DIR" -name "jre_*" -print0 2>/dev/null || true)
fi

FILES_TO_REMOVE=("${BASE_FILES_TO_REMOVE[@]}" "${VERSION_SPECIFIC_FILES[@]}")

echo "Files to be removed: ${FILES_TO_REMOVE[*]}"
echo

# Step 1: Remove existing symlinks
echo "=== Removing existing symlinks ==="
for file in "${FILES_TO_REMOVE[@]}"; do
    symlink_path="$ALTERNATIVES_DIR/$file"
    if [ -L "$symlink_path" ]; then
        echo "Removing: $symlink_path"
        sudo rm "$symlink_path"
    else
        echo "Not found (skipping): $symlink_path"
    fi
done
echo

# Step 2: Create new symlinks
echo "=== Creating new symlinks ==="

# java -> $JAVA_HOME/bin/java
if [ -f "$JAVA_HOME/bin/java" ]; then
    echo "Creating: java -> $JAVA_HOME/bin/java"
    sudo ln -s "$JAVA_HOME/bin/java" "$ALTERNATIVES_DIR/java"
else
    echo "Warning: $JAVA_HOME/bin/java not found, skipping java symlink"
fi

# java.1.gz -> $JAVA_HOME/man/man1/java.1 (or java.1.gz)
if [ -f "$JAVA_HOME/man/man1/java.1.gz" ]; then
    echo "Creating: java.1.gz -> $JAVA_HOME/man/man1/java.1.gz"
    sudo ln -s "$JAVA_HOME/man/man1/java.1.gz" "$ALTERNATIVES_DIR/java.1.gz"
elif [ -f "$JAVA_HOME/man/man1/java.1" ]; then
    echo "Creating: java.1.gz -> $JAVA_HOME/man/man1/java.1"
    sudo ln -s "$JAVA_HOME/man/man1/java.1" "$ALTERNATIVES_DIR/java.1.gz"
else
    echo "Warning: java man page not found in $JAVA_HOME/man/man1/, skipping java.1.gz symlink"
fi

# jcmd -> $JAVA_HOME/bin/jcmd
if [ -f "$JAVA_HOME/bin/jcmd" ]; then
    echo "Creating: jcmd -> $JAVA_HOME/bin/jcmd"
    sudo ln -s "$JAVA_HOME/bin/jcmd" "$ALTERNATIVES_DIR/jcmd"
else
    echo "Warning: $JAVA_HOME/bin/jcmd not found, skipping jcmd symlink"
fi

# jcmd.1.gz -> $JAVA_HOME/man/man1/jcmd.1 (or jcmd.1.gz)
if [ -f "$JAVA_HOME/man/man1/jcmd.1.gz" ]; then
    echo "Creating: jcmd.1.gz -> $JAVA_HOME/man/man1/jcmd.1.gz"
    sudo ln -s "$JAVA_HOME/man/man1/jcmd.1.gz" "$ALTERNATIVES_DIR/jcmd.1.gz"
elif [ -f "$JAVA_HOME/man/man1/jcmd.1" ]; then
    echo "Creating: jcmd.1.gz -> $JAVA_HOME/man/man1/jcmd.1"
    sudo ln -s "$JAVA_HOME/man/man1/jcmd.1" "$ALTERNATIVES_DIR/jcmd.1.gz"
else
    echo "Warning: jcmd man page not found in $JAVA_HOME/man/man1/, skipping jcmd.1.gz symlink"
fi

# jre -> $JAVA_HOME (assuming this is the JRE directory)
echo "Creating: jre -> $JAVA_HOME"
sudo ln -s "$JAVA_HOME" "$ALTERNATIVES_DIR/jre"

# jre_<version> -> $JAVA_HOME
echo "Creating: jre_$JAVA_VERSION -> $JAVA_HOME"
sudo ln -s "$JAVA_HOME" "$ALTERNATIVES_DIR/jre_$JAVA_VERSION"

# jre_<version>_openjdk -> $JAVA_HOME (if this is an OpenJDK installation)
if [[ "$JAVA_HOME" == *"openjdk"* ]] || [[ "$JAVA_HOME" == *"temurin"* ]] || [[ "$JAVA_HOME" == *"adoptium"* ]]; then
    echo "Creating: jre_${JAVA_VERSION}_openjdk -> $JAVA_HOME"
    sudo ln -s "$JAVA_HOME" "$ALTERNATIVES_DIR/jre_${JAVA_VERSION}_openjdk"
else
    echo "Note: Not creating jre_${JAVA_VERSION}_openjdk (installation doesn't appear to be OpenJDK-based)"
fi

echo
echo "=== Verification ==="
echo "Current Java alternatives:"
sudo ls -la "$ALTERNATIVES_DIR" | grep -E '(java|jre|jcmd)' | head -10

echo
echo "Java alternatives management completed successfully!"
echo
echo "To verify the installation, you can run:"
echo "  java -version"
echo "  which java"
echo "  ls -la /etc/alternatives | grep java"
