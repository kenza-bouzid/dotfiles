#! /bin/bash

if ! command -v atuin 2>&1 >/dev/null
then
  curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
fi
