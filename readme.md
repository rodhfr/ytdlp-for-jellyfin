### Script Install
```bash
sudo apt install git && git clone https://github.com/rodhfr/ytdlp-for-jellyfin.git && cd ytdlp-for-jellyfin && sudo chmod +x ./setup.sh && sudo ./setup.sh
```

### Manual Install
```bash
git clone this repository
cd ytdlp-for-jellyfin
sudo apt install pip
pip3 install ./requirements.txt
mkdir ~/scripts
cp ytdlp_functions.sh ~/scripts/
cat appendtobashrc.txt >> ~/.bashrc
#maybe test in virtual python evironment
#python3 -m venv venv
#source venv/bin/activate
#pip install ./requirements.txt
```


