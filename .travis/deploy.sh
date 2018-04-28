#!/bin/bash
# Decrypt the private key
openssl aes-256-cbc -K $encrypted_70673a476360_key -iv $encrypted_70673a476360_iv  -in id_rsa.enc -out .ssh/id_rsa -d
# Set the permission of the key
chmod 600 ~/.ssh/id_rsa
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/id_rsa
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config
# Set Git config
git config --global user.name "yapAE"
git config --global user.email yapi.ae@zhengheforum.org
# Clone the repository
git clone git@github.com:yapAE/yapAE.github.io.git .deploy_git
# Deploy to GitHub
npm run deploy
