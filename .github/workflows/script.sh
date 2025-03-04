#!/bin/bash

function visit {
    local item
    for item in "$1"/*; do
        if [ -d "$item" ]; then visit "$item";
        elif [ -f "$item" ]; then minify "$item"; fi
    done
}
function minify {
    case "$1" in
        *.html | *.css | *.js | *.json)
            TMP_FILE=$(mktemp "$1.XXXXXX")
            tr -d '\n\r' < "$1" > "$TMP_FILE"
            mv -f "$TMP_FILE" "$1"
            ;;
    esac
}
visit "web";

# Remove "assets/repos.json" entry from "pubspec.yaml"
PUB_FILE='pubspec.yaml'
TMP_FILE=$(mktemp "$PUB_FILE.XXXXXX")
sed -i "$TMP_FILE" '/assets\/repos.json/d' "$PUB_FILE"
if [[ $? -eq 0 ]]; then rm "$TMP_FILE"; fi

# Remove repos.json if it exists
rm -f "assets/repos.json" 2>/dev/null
