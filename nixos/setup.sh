#!/bin/sh
set -e

sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup
sudo cp configuration.nix /etc/nixos/
sudo chown root:root /etc/nixos/configuration.nix
