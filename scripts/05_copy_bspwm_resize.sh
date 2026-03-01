#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="${ROOT_DIR}/configs/bspwm_resize"
DEST_DIR="${HOME}/.config/bspwm/scripts"
DEST_FILE="${DEST_DIR}/bspwm_resize"

mkdir -p "${DEST_DIR}"
cp "${SOURCE_FILE}" "${DEST_FILE}"
chmod +x "${DEST_FILE}"