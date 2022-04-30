#! /bin/bash
echo "loop"

# FILE "Elton John - The Lockdown Sessions.flac" WAVE

work() {
    if [ $(cat "$1" | grep '^\s*FILE' | wc -l) == 1 ]; then
        flac=$(cat "$1" | grep -oP '^FILE "\K[^"]+')
        dir=$(dirname "$1")   
                
        shnsplit -f "$1" -o flac -d "$dir" -t "%n - %t" "$dir/$flac" -O never -P none

        rm -f "$dir/$flac"
        rm -f "$1"
    fi
}

find /data -name '*.cue' -print0 | while IFS= read -r -d '' file; do work "$file"; done