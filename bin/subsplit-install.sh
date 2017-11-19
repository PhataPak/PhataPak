#!/usr/bin/env bash

mkdir ~/git-subsplit
cd ~/git-subsplit
wget https://github.com/dflydev/git-subsplit/archive/master.zip
unzip master
cd git-subsplit-master
sh install.sh;
cd ~
rm -r git-subsplit