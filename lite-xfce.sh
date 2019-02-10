#!/bin/bash

#apt-get update -y && apt-get install git -y && cd && git clone https://github.com/catonrug/rpi-stretch.git && cd rpi-stretch && ./lite-xfce.sh

#update repos
sudo apt-get update -y

#update system
sudo apt-get upgrade -y

#upgrade os
sudo apt-get dist-upgrade -y

#clean
sudo apt-get clean -y

#update repos
sudo apt-get update -y

#install xfce stuff. xfwm is also needed but the package is already included in dependencies  of xfce
apt -y install xfce4 xfce4-terminal

#allow thunar to generate video thumbnails
apt -y install tumbler-plugins-extra


sudo update-alternatives --config x-session-manager


#video player
sudo apt-get install omxplayer -y
#install option to select OMXPlayer from appliacitions.
#in this way I can create new file associations to mp4, mkv
cp omxplayer.desktop /usr/share/applications


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
mkdir -p /home/pi/Music
cd /home/pi/Music
youtube-dl -f140 https://www.youtube.com/watch?v=e82CHtDTaSk #C. Tangana - Mala Mujer
youtube-dl -f140 https://www.youtube.com/watch?v=_ZIAMhomyr0 #Nekfeu - On verra INSTRUMENTALE
youtube-dl -f140 https://www.youtube.com/watch?v=CWYJuy89QU0 #KAASI - Lucy Stone
youtube-dl -f140 https://www.youtube.com/watch?v=bnm2uYDld9w #Harmonia do samba - Escreveu não leu

#clipboard manager
apt-get install parcellite -y

#mail
apt-get install claws-mail -y

#configure automatic login
        if [ -e /etc/init.d/lightdm ]; then
          systemctl set-default graphical.target
          ln -fs /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
          sed /etc/lightdm/lightdm.conf -i -e "s/^autologin-user=.*/#autologin-user=/"
          disable_raspi_config_at_boot
        else
          whiptail --msgbox "Do 'sudo apt-get install lightdm' to allow configuration of boot to desktop" 20 60 2
          return 1
        fi


#remote desktop client
#apt-get install remmina -y

#prepare anyconnect
#apt-get install network-manager-openconnect -y
#mkdir /etc/vpnc
#mv vpnc-script /etc/vpnc/vpnc-script
#chmod u+x /etc/vpnc/vpnc-script
#use anyconnect vpn with
#sudo openconnect --script /etc/vpnc/vpnc-script <your_vpn_connection_address>

#audio editor
#apt-get install audacity -y

#extract archives like 7z, xz
apt-get install xarchiver -y
apt-get install xz-utils

#simple image viewer
apt-get install gpicview -y

#install screenshot manager and editor
apt-get install shutter -y

#screen recording software
#apt-get install gtk-recordmydesktop -y

#epub reader
apt-get install calibre -y

#firefox web browser
apt-get install iceweasel -y

#fdf reader
apt-get install xpdf -y

#kodi media player to play youtube on-the-fly
apt-get install kodi -y

#for compiling other programs
#sudo apt-get install build-essential -y

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
