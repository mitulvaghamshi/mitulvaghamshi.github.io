#!/bin/bash

# Visit all directories and files.
function visit {
    for item in $1; do
        if [ -d $item ]; then
            visit "$item/*";
        fi
        minify $item;
    done
}

# If file is html or json, remove new-lines.
function minify {
    case $1 in *.html | *.json)
        cat $1 | while read line; do echo -n "$line" >> temp.bak; done
        mv -f temp.bak $1;
        ;;
    esac
}

echo "Minify web sources...";
visit "web/*";

echo "Remove pubspec asset: repos.json";
cp pubspec.yaml temp.yaml;
sed '/assets\/repos.json/d' temp.yaml > pubspec.yaml;

echo "Remove file: repos.json";
if [[ $? -eq 0 ]]; then
    rm temp.yaml;
    rm assets/repos.json;
else
     mv -f temp.yaml pubspec.yaml;
fi
