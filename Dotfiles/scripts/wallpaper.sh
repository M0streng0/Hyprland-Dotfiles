#!/usr/bin/bash

# Check if the user provided an argument (image file)
if [ $# -ne 1 ]; then
    echo "Usage: wallpaper image.jpg"
    exit 1
fi

# Set the wallpaper using swww
swww img "\$1" --transition-fps 60 --transition-type wipe --transition-duration 2

# Get the absolute path of the image and create a symlink to it
image_path=$(readlink -f "\$1")
ln -sf "$image_path" ~/.config/wallpaper