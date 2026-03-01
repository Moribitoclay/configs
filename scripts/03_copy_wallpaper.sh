#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="${ROOT_DIR}/configs/wallpaper.jpg"
DEST_DIR="${HOME}/Desktop/claymore/Fondos"
DEST_FILE="${DEST_DIR}/Fondo.jpg"

mkdir -p "${DEST_DIR}"
cp "${SOURCE_FILE}" "${DEST_FILE}"
