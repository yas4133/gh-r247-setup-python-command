#!/usr/bin/env bash
set -euo pipefail
printf 'GH_R247_TRUSTED_CONSUMER_EXECUTED=true\n'
printf 'owned-canary\n' > GH_R247_EXECUTED
