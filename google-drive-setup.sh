
#!/bin/bash


# install rclone
curl https://rclone.org/install.sh | sudo bash

# check if old config exists
ls ~/.config/rclone/rclone.conf

# create dir where place the files
mkdir -p /var/satellite/RadioAlise

# move to dir where the sync should happen
cd /var/satellite/RadioAlise

# list predefined profiles
rclone listremotes

# execute sync
rclone sync RadioAlise:RadioAlise .
