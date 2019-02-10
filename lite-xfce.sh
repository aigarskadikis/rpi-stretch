#!/bin/bash

# this is tested and works on the top of:
# http://director.downloads.raspberrypi.org/raspbian/images/raspbian-2018-11-15/2018-11-13-raspbian-stretch.zip

# to automatically setup
# cd && curl https://raw.githubusercontent.com/catonrug/rpi-stretch/master/lite-xfce.sh > install.sh && sudo chmod +x install.sh && time ./install.sh

# update repos
sudo apt -y update

# update system
sudo apt -y upgrade

# upgrade os
sudo apt -y dist-upgrade

# clean
sudo apt -y clean

# update repos
sudo apt -y update

# install xfce stuff
sudo apt -y install xfce4 xfce4-terminal tumbler-plugins-extra
# this will bring us:
# * window snapping feature
# * wallpaper changer
# * allow thunar to generate thumbnails videos and pics

# swithc default desktop to XFCE4
echo 6 | sudo update-alternatives --config x-session-manager

# video player
sudo apt -y install omxplayer
# install option to select OMXPlayer from appliacitions.
# in this way I can create new file associations to mp4, mkv
sudo cp omxplayer.desktop /usr/share/applications
# this only set integration on native XFCE desktop, not on pure openbox

# set time zone
sudo cp /usr/share/zoneinfo/Etc/GMT-2 /etc/localtime


#clipboard manager
sudo apt -y install parcellite

# epub reader
sudo apt -y install calibre

# install screenshot manager and editor
sudo apt -y install shutter

#extract archives like 7z, xz
sudo apt -y install xarchiver xz-utils

# install deluge thin client. server must be installed on other computer
sudo apt -y install deluge-gtk python-libtorrent

# install password manager
sudo apt -y install keepass2
# autotype for keepass2
sudo apt -y install xdotool

#install audio player and audio plugins
sudo apt -y install lxmusic xmms2-plugin-all

#install arial and other windows fonts
sudo apt -y install ttf-mscorefonts-installer && fc-cache -f -v

# install pip
sudo apt -y install python-pip

# firefox web browser
sudo apt -y install iceweasel

# pdf reader
sudo apt -y install xpdf

# kodi media player to play youtube on-the-fly
sudo apt -y install kodi
# download plugin for kodi
curl -L https://github.com/catonrug/xbmc-lattelecom.tv/archive/master.zip > ~/Downloads/xbmc-lattelecom.tv.zip

# install youtube doownloader
sudo pip install --upgrade youtube-dl
cd ~/Music
youtube-dl -f140 https://www.youtube.com/watch?v=e82CHtDTaSk #C. Tangana - Mala Mujer
youtube-dl -f140 https://www.youtube.com/watch?v=_ZIAMhomyr0 #Nekfeu - On verra INSTRUMENTALE
youtube-dl -f140 https://www.youtube.com/watch?v=CWYJuy89QU0 #KAASI - Lucy Stone
youtube-dl -f140 https://www.youtube.com/watch?v=bnm2uYDld9w #Harmonia do samba - Escreveu não leu

# resolution
sudo sed -i "s/^.*disable_overscan=.*$/disable_overscan=1/" /boot/config.txt
sudo sed -i "s/^.*hdmi_force_hotplug=.*$/hdmi_force_hotplug=1/" /boot/config.txt
sudo sed -i "s/^.*hdmi_group=.*$/hdmi_group=1/" /boot/config.txt


sudo su

# set 128MB RAM for graphics
echo "gpu_mem=128">> /boot/config.txt

# disable wifi
echo "dtoverlay=pi3-disable-wifi">> /boot/config.txt

# copy panel settings
# rm -rf /home/pi/.config #remove existing settings
# cd ~/rpi-stretch/home
# cp -R . /home/pi
# chown -R pi. /home/pi


# screen recording software
# apt install gtk-recordmydesktop -y

# 

poweroff
