#!/bin/sh
# TOS wrapper: upstream start-docker.sh needs root (usermod/chown/su).
# The app itself only needs a writable data dir and node, so run it directly
# as uid 1000.
set -u
set -e
DATA_DIR="${TRILIUM_DATA_DIR:-/data}"
mkdir -p "$DATA_DIR"
cd /usr/src/app
exec node main.cjs
