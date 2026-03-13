#!/usr/bin/env fish

# Start recording
set output_file "recording-"(date +%Y%m%d-%H%M%S)".mp3"
echo "Recording to $output_file (Ctrl+C to stop)..."

ffmpeg -f pulse -i (pactl get-default-sink).monitor \
    -codec:a libmp3lame -qscale:a 2 $output_file
