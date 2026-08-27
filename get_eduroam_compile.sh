#! /bin/bash

git clone https://github.com/geteduroam/linux-app.git

cd linux-app

make build-gui

sudo cp geteduroam-gui /usr/local/bin/

printf "[Desktop Entry]\nName=Geteduroam\nExec=geteduroam-gui\nTerminal=false\nType=Application\nCategories=Game;" > $HOME/.local/share/applications/geteduroam.desktop 
