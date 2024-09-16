#!/bin/bash 

download_link=$(curl -s https://api.github.com/repos/derailed/k9s/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep -i linux_amd6 | grep k9s_linux_amd64.deb)
wget $download_link
# sudo apt install -y ./k9s_linux_amd64.deb
# rm k9s_linux_amd64.deb
