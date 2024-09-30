#!/usr/bin/bash

# Show help if user asks for it
if [ "\$1" = "-h" ] || [ "\$1" = "--help" ]; then
    echo "Usage: mp4togif input.mp4 [fps]"
    exit 1
fi

# Check if the user provided at least one argument (input file)
if [ $# -lt 1 ]; then
    echo "Usage: mp4togif input.mp4 [fps]"
    exit 1
fi

input_file="\$1"
fps=${2:-10}  # Default FPS to 10 if not provided
output_file="$(dirname "$input_file")/$(basename "$input_file" .mp4).gif"

# Convert the MP4 to GIF using ffmpeg
ffmpeg -i "$input_file" -vf "fps=$fps,scale=1920:-1:flags=lanczos" -c:v gif "$output_file"