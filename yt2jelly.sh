#!/bin/bash

download_dir="$HOME/Videos/youtube-dl"

c_working_dir() {
if [ ! -d "$download_dir" ]; then
    # If it doesn't exist, create it and then change to it
    mkdir -p "$download_dir"
    if [ $? -eq 0 ]; then
        cd "$download_dir"
        echo "Directory created and changed to $download_dir"
    else
        echo "Failed to create directory."
    fi
else
    # If it already exists, just change to it
    cd "$download_dir"
    echo "Directory already exists. Changed to $download_dir"
fi
}

ytdlp_func() {
    # Run the alias
    yt-dlp --ignore-config --sponsorblock-remove all --write-info-json --write-auto-sub --embed-subs --embed-thumbnail --paths "$download_dir" -f "137+251/299+251/135+251/bestvideo[height<=?1080][fps<=?60][vcodec!=?vp9]+bestaudio" "$@"
    
    # Crawl for the mp4 namefile
    local mkv_file
    mkv_file=$(find . -maxdepth 1 -type f -iname "*.mkv")
    echo " crawling for mkv"
    if [ -n "$mkv_file" ]; then
        local base_name
        base_name=$(basename "$mkv_file" .mkv)
        echo "mkv found"
        # Move to the same folder
        mkdir -p "$base_name"
        echo "creating dir"
        mv "$base_name".mkv "$base_name" && mv "$base_name".info.json "$base_name"
        echo "moving"
        if [ $? -eq 0 ]; then
            echo "Files moved successfully."

            # JSON to NFO and exclude JSON
            for json in "$base_name"/*.json; do
                if [ -f "$json" ]; then
                    ytdl-nfo "$json"
                    rm "$json"
                fi
            done
        fi
    fi
}

c_working_dir
ytdlp_func "$@"
