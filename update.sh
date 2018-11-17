#!/usr/bin/env bash


RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

echo -e "step 2: ${GREEN}fix and attempt to correct a system with broken dependencies${NOCOLOR}"
sudo apt-get install -f

echo

echo -e "step 3: ${GREEN}update apt cache${NOCOLOR}"
sudo apt-get update

echo

echo -e "step 4: ${RED}upgrade packages${NOCOLOR}"
sudo apt-get upgrade

echo

echo -e "step 5: ${RED}distribution upgrade${NOCOLOR}"
sudo apt-get dist-upgrade

echo

echo -e "step 6: ${GREEN}remove unused packages${NOCOLOR}"
sudo apt-get --purge autoremove

echo

echo -e "step 7: ${GREEN}clean up${NOCOLOR}"
sudo apt-get autoclean

echo
