#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="${ROOT_DIR}/configs/bspwmrc"
DEST_DIR="${HOME}/.config/bspwm"
DEST_FILE="${DEST_DIR}/bspwmrc"

mkdir -p "${DEST_DIR}"
cp "${SOURCE_FILE}" "${DEST_FILE}"
