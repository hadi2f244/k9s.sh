#!/bin/bash -e

function cleanup {
  echo "Removing kubectl"
  rm kubectl
}
trap cleanup SIGINT

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin
