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

#install chromium browser
sudo apt-get install chromium-browser -y

#for compiling other programs
sudo apt-get install build-essential -y

