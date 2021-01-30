#!/bin/bash
set -euo pipefail

chown -R zoom /home/zoom/.config
chown -R zoom:zoom /home/zoom/.ssh

usermod -a -G video zoom
chown :video /dev/video*

exec /usr/sbin/sshd -D
