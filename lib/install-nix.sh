#!/usr/bin/env bash
set -euo pipefail

scriptuser_created=no
scriptuser=nix-installer-user
if ! id "$scriptuser" &>/dev/null
  adduser --system "$scriptuser"
  scriptuser_created=yes
fi
sudo -u "$scriptuser" command1
sudo -u "$scriptuser" command2
sudo -u "$scriptuser" command3
if [ yes = "$scriptuser_created" ]; then
  userdel "$scriptuser"
fi

./install-nix-wrapped.sh
