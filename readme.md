# Description
This is a simple bash script to place youtube videos in folder with metadata and subtitles for playing with Jellyfin.
Files will be placed into a folder with the same name as the youtube title, embeded automatic subs and json will be converted to nfo.

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

```bash
cd ./ytdlp-for-jellyfin
sudo chmod +x ./yt2jelly.sh
```
You can already test running the bash script plus the youtube link
```bash
./yt2jelly.sh https://youtube.com/thevideoyouwanttodownload
```
And can copy to path to call within the terminal
sudo cp yt2jelly.sh /usr/bin/


The default folder is ~/Videos/youtube-dl

![image](https://github.com/rodhfr/ytdlp-for-jellyfin/assets/83579016/2a83617a-4988-4e0e-ab9e-2bcd2dac89ac)

#### Uses the projects yt-dlp and ytdl-nfo



