#!/bin/bash

set -e

echo "==================================="
echo "Installing RKE2 Cluster"
echo "==================================="

# 1.1. Install RKE2
echo "Installing RKE2..."
curl -sfL https://get.rke2.io | sh -

# 1.2. Enable RKE2 server service
echo "Enabling RKE2 server service..."
sudo systemctl enable rke2-server.service

# 1.3. Start RKE2 server service
echo "Starting RKE2 server service..."
sudo systemctl start rke2-server.service

# Wait for RKE2 to be ready
echo "Waiting for RKE2 to be ready..."
sleep 10

# 1.4. Export PATH in bashrc
echo "Adding RKE2 bin directory to PATH in ~/.bashrc..."
if ! grep -q "/var/lib/rancher/rke2/bin" ~/.bashrc; then
    echo 'export PATH=$PATH:/var/lib/rancher/rke2/bin/' >> ~/.bashrc
    echo "PATH updated in ~/.bashrc"
else
    echo "PATH already configured in ~/.bashrc"
fi

# 1.5. Export KUBECONFIG in bashrc
echo "Adding KUBECONFIG to ~/.bashrc..."
if ! grep -q "KUBECONFIG=/etc/rancher/rke2/rke2.yaml" ~/.bashrc; then
    echo 'export KUBECONFIG=/etc/rancher/rke2/rke2.yaml' >> ~/.bashrc
    echo "KUBECONFIG updated in ~/.bashrc"
else
    echo "KUBECONFIG already configured in ~/.bashrc"
fi

# Apply exports for current session
export PATH=$PATH:/var/lib/rancher/rke2/bin/
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml

echo "==================================="
echo "RKE2 installation completed!"
echo "==================================="

# 2. Run all.sh
echo ""
echo "Running all.sh..."
./all.sh

echo ""
echo "==================================="
echo "Setup complete!"
echo "==================================="
