#!/bin/bash
DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"

curl -L -o ~/Downloads/discord.deb $DISCORD_URL
captain ~/Downloads/discord.deb
rm ~/Downloads/discord.deb
