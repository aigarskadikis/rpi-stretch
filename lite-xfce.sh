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

#allow thunar to generate video thumbnails
sudo apt-get install tumbler-plugins-extra

#bring back raspiban standart configuration tool
sudo apt-get install rc-gui -y

#install git. since every automation hosts under github
sudo apt-get install git -y

#video player
sudo apt-get install omxplayer -y
#install option to select OMXPlayer from appliacitions.
#in this way I can create new file associations to mp4, mkv
cp omxplayer.desktop /usr/share/applications

#install chromium browser
sudo apt-get install chromium-browser -y

#install netsurf web browser. very fast. by default it disables javascript
sudo apt-get install netsurf -y

#install text editor like notepad
sudo apt-get install geany -y

#install deluge thin client. server must be installed on other computer
sudo apt-get install deluge-gtk -y
#to download files locally
sudo apt-get install python-libtorrent  -y

#install password manager
sudo apt-get install keepass2 -y
#autotype for keepass2
sudo apt-get install xdotool -y

#install samba client so I can browse samba shares smb
apt-get install smbclient -y

#install audio player and audio plugins
apt-get install lxmusic xmms2-plugin-all -y

#install arial and other windows fonts
apt-get install ttf-mscorefonts-installer -y && fc-cache -f -v

#install youtube downloader
apt-get install youtube-dl -y

#upgrade youtube downloader tools
apt-get install python-pip -y
pip install --upgrade youtube-dl

#clipboard manager
apt-get install parcellite -y

#mail
apt-get install claws-mail -y

#remote desktop client
apt-get install remmina -y

#prepare anyconnect
apt-get install network-manager-openconnect -y
mkdir /etc/vpnc
mv vpnc-script /etc/vpnc/vpnc-script
chmod u+x /etc/vpnc/vpnc-script
#use anyconnect vpn with
#sudo openconnect --script /etc/vpnc/vpnc-script <your_vpn_connection_address>

#audio editor
apt-get install audacity -y

#extract archives like 7z, xz
apt-get install xarchiver -y
apt-get install xz-utils

#simple image viewer
apt-get install gpicview -y

#install screenshot manager and editor
apt-get install shutter -y

#for compiling other programs
#sudo apt-get install build-essential -y

