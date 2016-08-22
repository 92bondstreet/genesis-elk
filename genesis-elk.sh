#!/bin/bash

## Custom echo
red='\033[0;31m'
yellow='\033[0;33m'
green='\033[0;32m'

## Color-echo.
#  Reset text attributes to normal + without clearing screen.
alias Reset="tput sgr0"
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

# Display header
header() {
  cecho "------------------------------------------------------------------------------" $yellow
  cecho "$*" $yellow
  cecho "------------------------------------------------------------------------------" $yellow

}

# Who are you?
if [ "$(id -u)" != "0" ]; then
  cecho "Genesis is for ROOT" $red
  cecho "❯ su" $red
  exit 1
fi

header "Install ELK stack"
docker-compose up
cecho "ELK stack done" $green
cecho "Please wait few seconds before to call elk url" $yellow
