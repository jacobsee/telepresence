#!/usr/bin/env sh
# set -e
if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-telepresence}::$(id -u):0:${USER_NAME:-telepresence} user:${HOME}:/bin/bash" >> /etc/passwd
  fi
fi
/usr/sbin/sshd -e
exec env PYTHONPATH=/opt/app-root/src twistd --pidfile= -n -y ./forwarder.py
