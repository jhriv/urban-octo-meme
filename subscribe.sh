#!/bin/bash
# shellcheck disable=SC1091
# https://www.shellcheck.net/wiki/SC1091 Not following: /run/secrets/rhsm was not specified as input

set -euo pipefail
if [ -f /run/secrets/rhsm ]; then
  source /run/secrets/rhsm
  subscription-manager register --org="$ORG" --activationkey="$KEY"
fi
