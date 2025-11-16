#!/bin/bash

# Set variables
OSS_CAD_SUITE_URL="https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2025-11-16/oss-cad-suite-linux-x64-20251116.tgz"
OSS_CAD_SUITE_DIR="yosys-oss-cad-suite"
APY_CULA_REPO_URL="https://github.com/YosysHQ/apycula.git"
PYTHON_VENV_DIR="venv"

# Update package list and install required packages
# echo "Updating package list and installing required packages..."
# sudo apt update
# sudo apt install -y wget unzip python3-venv python3-pip git

# Download OSS Cad Suite
echo "Downloading OSS Cad Suite..."
wget -O $OSS_CAD_SUITE_DIR.tgz "$OSS_CAD_SUITE_URL"

# Unpack the downloaded file
echo "Unpacking OSS Cad Suite..."
tar xvf $OSS_CAD_SUITE_DIR.tgz
rm $OSS_CAD_SUITE_DIR.tgz

# Navigate to the newly created directory
cd "$OSS_CAD_SUITE_DIR" || { echo "Directory not found"; exit 1; }

# Clone the apycula repository
echo "Cloning the apycula repository..."
git clone "$APY_CULA_REPO_URL"

# Create a Python virtual environment
echo "Creating Python virtual environment..."
python3 -m venv "$PYTHON_VENV_DIR"

# Activate the virtual environment
source "$PYTHON_VENV_DIR/bin/activate"

# Install apycula within the virtual environment
echo "Installing apycula..."
pip install apycula

# Completion message
echo "Setup is complete. To activate the virtual environment, run:"
echo "source start_oss_toolchain.sh"
