#!/bin/bash

# Recursively visit all items in the given directory
function visit {
    echo "> Visiting $1 directory..."
    local item
    for item in "$1"/*; do
        if [ -d "$item" ]; then # If it's a directory, visit its contents
            visit "$item"
        elif [ -f "$item" ]; then # Check the item if it's a regular file
            minify "$item"
        fi
    done
}

# Minify source files by removing unnecessary whitespace and newlines
function minify {
    case "$1" in
        *.html | *.css | *.js | *.json)
            # Use a temporary file in the same directory
            TMP_FILE=$(mktemp "$1.XXXXXX")
            tr -d '\n\r' < "$1" > "$TMP_FILE"
            mv -f "$TMP_FILE" "$1"
            echo ">>> Modified file: $1"
            ;;
    esac
}

# Visit all items in the "web" directory
visit "web"

# Remove the line containing "assets/repos.json" from pubspec.yaml
PUB_FILE='pubspec.yaml'
TMP_FILE=$(mktemp "$PUB_FILE.XXXXXX")
echo "Removing 'assets/repos.json' line from $PUB_FILE"
sed -i "$TMP_FILE" '/assets\/repos.json/d' "$PUB_FILE"
if [[ $? -eq 0 ]]; then
    echo "> Removing $TMP_FILE file..."
    rm "$TMP_FILE"
fi

# Remove repos.json if it exists
echo "Removing assets/repos.json if it exists..."
rm -f "assets/repos.json" 2>/dev/null

echo "Done."
