#!/bin/bash

# Remove "assets/repos.json" entry from "portfolio/pubspec.yaml"
sed -i.bak '/assets\/repos.json/d' 'portfolio/pubspec.yaml';
if [[ $? -ne 0 ]]; then exit 1; fi

rm 'portfolio/pubspec.yaml.bak';

# Remove the "repos.json" file as its debug only
find portfolio/assets -type f -name "repos.json" -delete;

# Inline source files by removing newlines and indentations, web only
find "portfolio/web" -type f \( -iname "*.html" -o -iname "*.js" -o -iname "*.css" -o -iname "*.json" \) -print | while read "file"; do TMP=$(mktemp "$file.XXXX"); cat "$file" | tr -d '\n\r' | tr -s '[:space:]' > "$TMP"; mv -f "$TMP" "$file"; done
