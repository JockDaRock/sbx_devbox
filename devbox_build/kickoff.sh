#! /bin/bash

# Basic Setup Process for DevBox

# Install Pip for Default Python
echo "Installing Python pip"
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
echo ""

# Install Ansible
echo "Installing Ansible"
pip install ansible
echo ""

# Install needed utilities
echo "Installing git and sshpass for deployment"
yum install -y git sshpass
echo ""

# Create base directories
echo "Creating base directories for projects."
mkdir coding
echo

# Clone Sandbox Repo
echo "Cloning Sandbox Repo"
cd coding
git clone https://github.com/DevNetSandbox/sbx_devbox
cd sbx_devbox
git pull
echo ""

# Run Playbook
echo "Running DevBox Setup Playbook"
cd devbox_build
ansible-playbook -i hosts devbox.yml
echo ""

# Run IOx Client install
echo "Running Setup ioxlcient"
mkdir /ioxclient
cd /ioxclient
curl -O https://pubhub-prod.s3-us-west-2.amazonaws.com/media/iox-docs/docs/artifacts/ioxclient/ioxclient-v1.4.0.0/ioxclient_1.4.0.0_linux_amd64.tar.gz
tar -zxf ioxclient_1.4.0.0_linux_amd64.tar.gz
cd ioxclient_1.4.0.0_linux_amd64
chmod +x ioxclient
cp ioxclient /usr/local/bin/ioxclient

# Done
echo "Done!"
