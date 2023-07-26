
ytdlp_h264='yt-dlp --write-info-json --write-sub --write-auto-sub -f "bestvideo[ext=mp4]+bestaudio[ext=opus]/best"'

ytdlp_func() {

    # Run the alias
    ytdlp_h264 "$@"
    
    # crawl for the mp4 namefile
    local mp4_file
    mp4_file=$(find . -maxdepth 1 -type f -iname "*.mp4")
     
    if [ -n "$mp4_file" ]; then
        local base_name
        base_name=$(basename "$mp4_file" .mp4)

        # mv to the same folder
        mkdir -p "$base_name"
        mv "$base_name".mp4 "$base_name" && mv "$base_name".en.vtt "$base_name" && mv "$base_name".info.json "$base_name"
        if [ $? -eq 0 ]; then
            echo "Files moved successfully."
            
            # vtt to srt
            for vtt in "$base_name"/*.vtt; do
                if [ -f "$vtt" ]; then
                    vtt_to_srt "$vtt" > "${vtt%.vtt}.srt"
                    rm "$vtt"
                fi
            done
            
            # json to nfo and exclude json
            for json in "$base_name"/*.json; do
                if [ -f "$json" ]; then
                    ytdl-nfo "$json"
                    rm "$json"
                fi
            done   
        fi
        
    fi

}
