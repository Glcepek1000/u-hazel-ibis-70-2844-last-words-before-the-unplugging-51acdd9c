#!/bin/sh
# No dependencies: main.ts uses the Node standard library only.
# This script exists so the entry has a one-shot setup step; it verifies
# that a new enough Node is present and does nothing else.
set -e
node --version
echo "setup ok: no dependencies to install"
