#! /bin/bash

if ! command -v zsh 2>&1 >/dev/null
then
  sudo apt-get update
  sudo apt-get install -y zsh
fi

# Changing the shell might not work on the sandbox
if sudo chsh -s /bin/zsh $USER; then
  echo "Default shell changed to zsh successfully."
else
  echo "Failed to change default shell. Adding fallback to ~/.bash_profile."
  echo 'exec zsh' >> ~/.bash_profile
fi
