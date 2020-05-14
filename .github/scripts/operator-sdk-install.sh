#!/bin/bash
set -e

RELEASE_VERSION=${OPERATOR_SDK_VERSION}

# Download operator-sdk binary
curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu

# Install the binary
chmod +x operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu 
sudo mkdir -p /usr/local/bin/ 
sudo cp operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu /usr/local/bin/operator-sdk 
rm operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu