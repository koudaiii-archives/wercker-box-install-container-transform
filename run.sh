#!/bin/bash
if [ ! -n "$WERCKER_INSTALL_AWS_CLI_KEY" ]; then
  error 'Please specify key property'
  exit 1
fi

if [ ! -n "$WERCKER_INSTALL_AWS_CLI_SECRET" ]; then
  error 'Please specify secret property'
  exit 1
fi

if [ ! -n "$WERCKER_INSTALL_AWS_CLI_REGION" ]; then
  error 'Please specify region property'
  exit 1
fi

echo 'Synchronizing References in apt-get...'
sudo apt-get update

pip install container-transform
pip install awscli

echo 'Synchronizing System Time...'
sudo ntpdate ntp.ubuntu.com

echo 'Configuring based on parameters...'
aws configure set aws_access_key_id $WERCKER_INSTALL_AWS_CLI_KEY
aws configure set aws_access_key_id $WERCKER_INSTALL_AWS_CLI_SECRET
aws configure set default.region $WERCKER_INSTALL_AWS_CLI_REGION
echo 'Done.'
