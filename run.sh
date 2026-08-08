#!/bin/bash

# Detect environment
if [ -n "$TERMUX_VERSION" ]; then
    echo "Termux environment detected."
    INSTALL_SCRIPT="./termux-install.sh"
    RUN_SCRIPT="./run-portal.sh"
elif [ -f /etc/debian_version ]; then
    echo "Debian-based environment detected."
    INSTALL_SCRIPT="./debian-install.sh"
    RUN_SCRIPT="./run-debian.sh"
else
    echo "Unknown environment. Defaulting to Debian scripts."
    INSTALL_SCRIPT="./debian-install.sh"
    RUN_SCRIPT="./run-debian.sh"
fi

# Run installation
echo "Running installation script: $INSTALL_SCRIPT"
if [ -f "$INSTALL_SCRIPT" ]; then
    bash "$INSTALL_SCRIPT"
else
    echo "Error: $INSTALL_SCRIPT not found!"
    exit 1
fi

# Run the app
echo "Running application script: $RUN_SCRIPT"
if [ -f "$RUN_SCRIPT" ]; then
    bash "$RUN_SCRIPT"
else
    echo "Error: $RUN_SCRIPT not found!"
    exit 1
fi
