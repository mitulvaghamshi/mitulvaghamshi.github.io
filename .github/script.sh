#!/bin/bash

sed -i.bak '/assets\/repos.json/d' 'portfolio/pubspec.yaml';
if [[ $? -ne 0 ]]; then exit 1; fi
rm 'portfolio/pubspec.yaml.bak';
find portfolio/assets -type f -name "repos.json" -delete;
