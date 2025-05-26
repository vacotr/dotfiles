#!/bin/bash
PULSAR_URL=$(curl -sL https://api.github.com/repos/pulsar-edit/pulsar/releases/latest | jq -r '.assets[] | .browser_download_url' | grep 'amd64.deb')

wget -O ~/Downloads/pulsar-edit.deb $PULSAR_URL -q --show-progress
captain ~/Downloads/pulsar-edit.deb
rm ~/Downloads/pulsar-edit.deb
