#! /bin/bash
set -e

argument=$1

Desktop_Location_File=$HOME/.local/share/applications/geteduroam.desktop
Binary_Location_File=/usr/local/bin/geteduroam-gui
Binary_Location=/usr/local/bin/

if [ "$argument" = "-R" ]; then
    echo "Removing geteduroam"

    if [ -f $Desktop_Location_File ]; then
        echo "Removing .desktop file"
        rm .local/share/applications/geteduroam.desktop
    
    else
        echo ".desktop file not found!"

    fi

    if [ -f $Binary_Location_File ]; then
        echo "Removing binary"
        sudo rm /usr/local/bin/geteduroam-gui 

    else
        echo "Binary not found"

    fi

else
    echo "Installing geteduroam"

    git clone https://github.com/geteduroam/linux-app.git

    cd linux-app

    make build-gui

    sudo cp geteduroam-gui $Binary_Location

    printf "[Desktop Entry]\nName=Geteduroam\nExec=geteduroam-gui\nTerminal=false\nType=Application\nCategories=Internet;" > $Desktop_Location_File 

    cd
    sudo rm -r linux-app/

fi
