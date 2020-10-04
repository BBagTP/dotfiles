#!/bin/bash

for i in $(find * -maxdepth 0 -type d -print);
do
    case "$i" in
        "."|"./"|".git"|"./.git"|".git/")
            echo "Skipping '$i'"
        ;;
        *)
            read -p "Found role '$i' - do you want to install it? (y/n) [n] " install_bool
            if [ "$install_bool" == "y" ] || [ "$install_bool" == "Y" ]; then
                echo "Executing 'stow -t ~ $i'"
                stow -t ~ $i
            fi
        ;;
    esac
done
