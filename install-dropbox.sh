#!/bin/bash

(
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

cd ~/bin && wget https://www.dropbox.com/download?dl=packages/dropbox.py -O dropbox.py
chmod +x dropbox.py

cd ~
.dropbox-dist/dropboxd
# Authorize by visiting the url
)

# Setup Dropbox service script
# http://www.jamescoyle.net/how-to/1147-setup-headless-dropbox-sync-client

sudo cp dropbox-service-script /etc/init.d/dropbox
sudo chmod +x /etc/init.d/dropbox
sudo update-rc.d dropbox defaults
