#!/bin/bash
# Usage: sudo ./start-paperclip.sh [onboard|run]   (default: run)
# Starts Paperclip as a non-root user. Needed when your shell is root
# (Docker, cloud containers): the embedded Postgres refuses to run as root.
set -euo pipefail

PC_USER="${PC_USER:-pcuser}"
CMD="${1:-run}"

id "$PC_USER" >/dev/null 2>&1 || useradd -m -s /bin/bash "$PC_USER"
HOME_DIR="$(getent passwd "$PC_USER" | cut -d: -f6)"

# Behind a TLS-intercepting proxy, the non-root user needs a readable CA.
CA_ARGS=""
if [ -n "${NODE_EXTRA_CA_CERTS:-}" ] && [ -f "$NODE_EXTRA_CA_CERTS" ]; then
  cp "$NODE_EXTRA_CA_CERTS" "$HOME_DIR/ca.crt"
  chown "$PC_USER" "$HOME_DIR/ca.crt"
  CA_ARGS="NODE_EXTRA_CA_CERTS=$HOME_DIR/ca.crt npm_config_cafile=$HOME_DIR/ca.crt"
fi

NODE_DIR="$(dirname "$(command -v node)")"
su -s /bin/bash "$PC_USER" -c "cd ~ && env PATH=$NODE_DIR:/usr/local/bin:/usr/bin:/bin \
  HTTPS_PROXY='${HTTPS_PROXY:-}' https_proxy='${HTTPS_PROXY:-}' \
  npm_config_https_proxy='${HTTPS_PROXY:-}' NO_PROXY='${NO_PROXY:-}' \
  $CA_ARGS nohup npx -y paperclipai $CMD > ~/paperclip.log 2>&1 &"

echo "Starting Paperclip ($CMD) as $PC_USER. Log: $HOME_DIR/paperclip.log"
echo "UI: http://127.0.0.1:3100   Health: curl http://127.0.0.1:3100/api/health"
