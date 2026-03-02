#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_COLOR="${ROOT_DIR}/configs/color.ini"
SOURCE_CONF="${ROOT_DIR}/configs/kitty.conf"
DEST_DIR="${HOME}/.config/kitty"

mkdir -p "${DEST_DIR}"
cp "${SOURCE_COLOR}" "${DEST_DIR}/color.ini"
cp "${SOURCE_CONF}" "${DEST_DIR}/kitty.conf"
