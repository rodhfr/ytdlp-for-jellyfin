# Description
The files will be placed into a folder with the same name as the youtube title, embeded autoamtic subs and json into nfo.

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
./yt2jelly.sh https://youtube.com/thevideoyouwanttodownload

The default folder is ~/Videos/youtube-dl

![image](https://github.com/rodhfr/ytdlp-for-jellyfin/assets/83579016/2a83617a-4988-4e0e-ab9e-2bcd2dac89ac)





