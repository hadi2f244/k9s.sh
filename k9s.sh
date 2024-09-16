#!/bin/bash 

download_link=$(curl -s https://api.github.com/repos/derailed/k9s/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep -i linux_amd6 | grep tar.gz)
wget -O k9s.tar.gz $download_link
tar -zxf k9s.tar.gz || true
sudo cp -r usr/bin/k9s /usr/bin
rm k9s.tar.gz
rm -r usr
