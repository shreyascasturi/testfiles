#!/bin/bash

## install git and wget if not done already
sudo apt install git wget

## install i3
sudo apt install i3

## install telegram.
wget -O telegram.tar.xz https://updates.tdesktop.com/tlinux/tsetup.1.8.0.tar.xz
sudo tar -xf telegram.tar.xz -C /opt/
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop

## installing slack.
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.1-amd64.deb
sudo apt install ./slack-desktop-*.deb

## check to verify slack will update.
cat /etc/apt/sources.list.d/slack.list

## install discord
sudo apt update
sudo apt install gdebi-core ## gdebi is necessary for a wget-sourced Discord installation.
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ~/discord.deb

## install spotify, i'm too lazy to do this the old fashioned way.
snap install spotify # remind myself to read up on snap v. apt.
