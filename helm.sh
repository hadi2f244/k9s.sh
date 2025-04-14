#!/bin/bash -e

function cleanup {
  echo "Removing get_helm.sh"
  rm get_helm.sh
}
trap cleanup EXIT

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

