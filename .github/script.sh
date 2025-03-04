#!/bin/bash

# Remove "assets/repos.json" entry from "pubspec.yaml"
sed -i ".bak" '/assets\/repos.json/d' 'pubspec.yaml';
if [[ $? -eq 0 ]]; then rm 'pubspec.yaml.bak'; else mv -f 'pubspec.yaml.bak' 'pubspec.yaml'; fi

# Remove the "repos.json" file as its debug only
find assets -type f -name "repos.json" -delete;

# Inline source files by removing newlines and indentations, web only
find "web" -type f \( -iname "*.html" -o -iname "*.js" -o -iname "*.css" -o -iname "*.json" \) -print | while read "file"; do TMP=$(mktemp "$file.XXXX"); cat "$file" | tr -d '\n\r' | tr -s '[:space:]' > "$TMP"; mv -f "$TMP" "$file"; done
