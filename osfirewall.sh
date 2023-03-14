#!/bin/bash

# Check if the OS is Windows
if [[ "$(uname -s)" == "CYGWIN"* || "$(uname -s)" == "MINGW"* || "$(uname -s)" == "MSYS"* ]]; then
  netsh firewall show state

# Check if the OS is macOS
elif [[ "$(uname -s)" == "Darwin" ]]; then
  sudo pfctl -s rules

# Check if the OS is Ubuntu, Debian or CentOS
elif [[ "$(cat /etc/*-release | grep -oP '(?<=^ID=).+' | tr -d '"' | tr '[:upper:]' '[:lower:]')" == "ubuntu" || "$(cat /etc/*-release | grep -oP '(?<=^ID=).+' | tr -d '"' | tr '[:upper:]' '[:lower:]')" == "debian" || "$(cat /etc/*-release | grep -oP '(?<=^ID=).+' | tr -d '"' | tr '[:upper:]' '[:lower:]')" == "centos" ]]; then
  sudo iptables -L -n || sudo ufw status

# If the OS is not recognized, exit the script with an error message
else
  echo "Unsupported operating system"
  exit 1
fi

