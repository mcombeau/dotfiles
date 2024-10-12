#!/bin/bash

if [ ! -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  echo "Installing Brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Brew already installed, skipping."
fi
