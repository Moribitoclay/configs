#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="${ROOT_DIR}/configs/sxhkdrc"
SXHKD_DIR="${HOME}/.config/sxhkd"
DEST_FILE="${SXHKD_DIR}/sxhkdrc"

mkdir -p "${SXHKD_DIR}"
cp "${SOURCE_FILE}" "${DEST_FILE}"
