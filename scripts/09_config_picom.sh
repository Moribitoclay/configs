#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_FILE="${ROOT_DIR}/configs/picom.conf"
DEST_DIR="${HOME}/.condig/picom"
DEST_FILE="${DEST_DIR}/picom.conf"

mkdir -p "${DEST_DIR}"
cp -f "${SOURCE_FILE}" "${DEST_FILE}"
