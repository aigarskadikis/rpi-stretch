#!/bin/sh

#update repositories and system
apt-get update -y && apt-get upgrade -y

#install arial and other windows fonts
apt-get install ttf-mscorefonts-installer -y && fc-cache -f -v

#install youtube downloader
apt-get install youtube-dl -y

#upgrade youtube downloader tools
pip install --upgrade youtube-dl

#clipboard manager
apt-get install parcellite -y

#photo editor
apt-get install gimp -y

#install audio player and audio plugins
apt-get install abraca xmms2-plugin-all -y

#install screenshot manager
apt-get install shutter -y

#install openbox desktop configuration utility
apt-get install obconf -y
#remove rounded corners
sed -i "s/<roundCorners>yes<\/roundCorners>/<roundCorners>no<\/roundCorners>/" /home/pi/.config/openbox/lxde-pi-rc.xml
sed -i "s/<animateIconify>yes<\/animateIconify>/<animateIconify>no<\/animateIconify>/" /home/pi/.config/openbox/lxde-pi-rc.xml

#prepare compilling tools to compile programs and stuff
apt-get install build-essential libx11-dev libgtk-3-dev wmctrl git -y

#remove black borders
sed -i "s/^.*disable_overscan=.*$/disable_overscan=1/" /boot/config.txt
grep "disable_overscan=" /boot/config.txt

#force video to hdmi
sed -i "s/^.*hdmi_force_hotplug=.*$/hdmi_force_hotplug=1/" /boot/config.txt
grep "hdmi_force_hotplug=" /boot/config.txt

sed -i "s/^.*hdmi_group=.*$/hdmi_group=1/" /boot/config.txt
grep "hdmi_group=" /boot/config.txt

#set hdmi resulution to full hd
sed -i "s/^.*hdmi_mode=.*$/hdmi_mode=16/" /boot/config.txt
grep "hdmi_mode=" /boot/config.txt

#set video size
grep "gpu_mem=" /boot/config.txt
if [ $? -eq 0 ]; then
sed -i "s/^.*gpu_mem=.*$/gpu_mem=128/" /boot/config.txt
else
echo "gpu_mem=128">> /boot/config.txt
fi

