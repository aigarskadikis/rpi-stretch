#!/bin/bash
source=/home/pi/Pictures
destination=/usr/share/backgrounds
sudo rm -rf "$destination" && sudo mkdir -p "$destination"
images=$(find $source | grep -i -E "\.j.*g$")
echo "$images"
printf %s "$images" | while IFS= read -r one
do {
sudo ln -s "$one" "$destination/$(echo "$one" | sed "s|$source\/||;s/\//./g")"
} done
