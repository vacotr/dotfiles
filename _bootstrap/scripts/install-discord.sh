#!/bin/bash
DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"

wget -O ~/Downloads/discord.deb $DISCORD_URL -q --show-progress
captain ~/Downloads/discord.deb
rm ~/Downloads/discord.deb
