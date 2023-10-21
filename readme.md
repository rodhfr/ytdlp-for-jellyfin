# Description
This is a simple bash script to place youtube videos in folder with metadata and subtitles for playing with Jellyfin.
Files will be placed into a easily customizable folder with the same name as the youtube title, embeded automatic subs and json will be converted to nfo.

## Quick Run
You can already test running the bash script plus the youtube link
```bash
pipx install ytdl-nfo
pipx install yt-dlp
wget https://raw.githubusercontent.com/rodhfr/ytdlp-for-jellyfin/main/yt2jelly.sh
./yt2jelly.sh https://youtube.com/thevideoyouwanttodownload
```

## Installing
Clone the repository
```bash
git clone https://github.com/rodhfr/ytdlp-for-jellyfin.git
cd ./ytdlp-for-jellyfin
```

#### Install the requirements

```bash
pipx install package --pip-args -r requirements.txt
```

```bash
cd ./ytdlp-for-jellyfin
sudo chmod +x ./yt2jelly.sh
```
#### Copy to path 
```bash
sudo cp yt2jelly.sh /usr/bin/
sudo ln -s /usr/bin/yt2jelly.sh /usr/bin/yt2jelly
```

---

#### The default folder is `~/Videos/youtube-dl`
You can change the output folder in the first line of the script 
```bash
sudo nano /usr/bin/yt2jelly.sh
```

```bash
download_dir="$HOME/Videos/youtube-dl"
```
change `"$HOME/Videos/youtube-dl"` to any path you want.

![image](https://github.com/rodhfr/ytdlp-for-jellyfin/assets/83579016/2a83617a-4988-4e0e-ab9e-2bcd2dac89ac)

#### Uses the projects yt-dlp and ytdl-nfo



