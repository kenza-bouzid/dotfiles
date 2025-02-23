#! /bin/bash

if ! command -v mise 2>&1 >/dev/null
then
  curl https://mise.run | sh
fi
