#!/bin/bash
# shellcheck disable=SC2162
# https://www.shellcheck.net/wiki/SC2162 read without -r will mangle backslashes.

set -euo pipefail
if [ -f /run/secrets/rhsm ]; then
  IFS=':' read user pass < /run/secrets/rhsm
  subscription-manager register --auto-attach --name=SYSTEMNAME --username="$user" --password="$pass"
fi
