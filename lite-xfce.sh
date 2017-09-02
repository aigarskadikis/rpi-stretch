#update repos
sudo apt-get update -y

#update system
sudo apt-get upgrade -y

#upgrade os
sudo apt-get dist-upgrade -y

#clean
sudo apt-get clean -y

#install xorg server. this is basic stuff if I want GUI
sudo apt-get install --no-install-recommends xserver-xorg -y

#startup, reboot, poweroff is an init. this is necesarry
sudo apt-get install --no-install-recommends xinit -y

#install xfce stuff. xfwm is also needed but the package is already included in dependencies  of xfce
sudo apt-get install xfce4 xfce4-terminal -y

#bring back raspiban standart configuration tool
sudo apt-get install rc-gui -y

#install git. since every automation hosts under github
sudo apt-get install git -y

#video player
sudo apt-get install omxplayer -y
cp omxplayer.desktop /usr/share/applications

#install chromium browser
sudo apt-get install chromium-browser -y

#install text redactor
sudo apt-get install geany -y

#install password manager
sudo apt-get install keepass2 -y

#install arial and other windows fonts
apt-get install ttf-mscorefonts-installer -y && fc-cache -f -v

#install youtube downloader
apt-get install youtube-dl -y

#upgrade youtube downloader tools
apt-get install python-pip -y
pip install --upgrade youtube-dl

#clipboard manager
apt-get install parcellite -y

#install screenshot manager and editor
apt-get install shutter -y

#for compiling other programs
#sudo apt-get install build-essential -y

