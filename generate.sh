#!/bin/bash

rm -rf ~/Pictures/all && mkdir -p ~/Pictures/all

images=$(ls -1 year*/* | grep -i -E "\.j.*g$" | sed "s|(|\\\\(|g;s|)|\\\\)|g;s| |\\\\ |g")
echo "$images"
printf %s "$images" | while IFS= read -r one
do {
ln -s "$(pwd)/$one" "$(pwd)/all/$(echo "$one" | sed "s/\//./g")"
} done

