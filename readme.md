# Description
The files will be placed into a folder with the same name as the youtube title, vtt into srt and json into nfo.

## Setup
Clone the repository
```bash
git clone https://github.com/rodhfr/ytdlp-for-jellyfin.git
```

Install the requirements

```bash
pipx install ytdl-nfo
pipx install yt-dlp
```

Edit your bash or zsh

```bash
nano ~/.bashrc
```

Append to your current file:
```bash
ytdlp_func() {

    # Run the alias
    yt-dlp --ignore-config --sponsorblock-remove all --write-info-json --write-auto-sub -f "-f 137+251/299+251" "$@"
    
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

alias ytdlp='ytdlp_func' 
```
Update bashrc or zshrc
```bash
source ~/.bashrc
```

## Easy run
The alias is `ytdlp`, so you can just

```bash
ytdlp https://www.youtube.com/watch?v=jNQXAC9IVRw&pp=ygUPb2xkZXN0IHl0IHZpZGVv
```

The files will be placed into a folder with the same name as the youtube title, vtt into srt and json into nfo.

![image](https://github.com/rodhfr/ytdlp-for-jellyfin/assets/83579016/2a83617a-4988-4e0e-ab9e-2bcd2dac89ac)





