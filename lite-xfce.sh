#!/bin/bash

# this is tested and works on the top of:
# http://director.downloads.raspberrypi.org/raspbian/images/raspbian-2018-11-15/2018-11-13-raspbian-stretch.zip

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

#clipboard manager
sudo apt -y install parcellite

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
sudo apt install ttf-mscorefonts-installer -y && fc-cache -f -v

# install pip
sudo apt -y install python-pip

# install youtube doownloader
sudo pip install --upgrade youtube-dl
cd ~/Music
youtube-dl -f140 https://www.youtube.com/watch?v=e82CHtDTaSk #C. Tangana - Mala Mujer
youtube-dl -f140 https://www.youtube.com/watch?v=_ZIAMhomyr0 #Nekfeu - On verra INSTRUMENTALE
youtube-dl -f140 https://www.youtube.com/watch?v=CWYJuy89QU0 #KAASI - Lucy Stone
youtube-dl -f140 https://www.youtube.com/watch?v=bnm2uYDld9w #Harmonia do samba - Escreveu não leu


#install screenshot manager and editor
apt install shutter -y

#screen recording software
#apt install gtk-recordmydesktop -y

#epub reader
apt install calibre -y

#firefox web browser
apt install iceweasel -y

#fdf reader
apt install xpdf -y

#kodi media player to play youtube on-the-fly
apt install kodi -y

#for compiling other programs
#sudo apt install build-essential -y

cat > /usr/bin/repo_update << EOF
#!/bin/bash
git add .
git commit -m next
git push origin master
EOF
chmod +x /usr/bin/repo_update

#renew one youtube channel based on directory name like 'md.twins,mauroreyesbest' or 'marlon.alves,UCkOfNQYegVUzsADNNZNOH2g'
cat > /usr/bin/renew-youtube-channel << EOF
#!/bin/bash
youtube-dl -i --download-archive archive.log https://www.youtube.com/{channel,user}/\$(pwd|sed "s/^.*,//g")/videos
EOF
chmod +x /usr/bin/renew-youtube-channel

#renew all channels. this command are supposed to run in ~/Videos dir
cat > /usr/bin/renew-all-channels << EOF
#!/bin/bash
dirs=\$(ls -1 | grep "," | sed -e '\$aanother')
echo "\$dirs"
printf %s "\$dirs" | while IFS= read -r one
do {
echo \$one
cd \$one
renew-youtube-channel
cd ..
} done
EOF
chmod +x /usr/bin/renew-all-channels

#resolution
sed -i "s/^.*disable_overscan=.*$/disable_overscan=1/" /boot/config.txt
sed -i "s/^.*hdmi_force_hotplug=.*$/hdmi_force_hotplug=1/" /boot/config.txt
sed -i "s/^.*hdmi_group=.*$/hdmi_group=1/" /boot/config.txt

#set 128MB RAM for graphics
echo "gpu_mem=128">> /boot/config.txt

#disable wifi
echo "dtoverlay=pi3-disable-wifi">> /boot/config.txt

#copy panel settings
#rm -rf /home/pi/.config #remove existing settings
cd ~/rpi-stretch/home
cp -R . /home/pi
chown -R pi. /home/pi

reboot
