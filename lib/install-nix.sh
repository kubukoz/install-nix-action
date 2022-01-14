#!/usr/bin/env bash
set -euo pipefail

scriptuser_created=no
scriptuser=nix-installer-user

if ! id "$scriptuser" &>/dev/null
  adduser --system "$scriptuser"
  scriptuser_created=yes
fi

sudo -u "$scriptuser" ./install-nix-wrapped.sh
if [ yes = "$scriptuser_created" ]; then
  userdel "$scriptuser"
fi
