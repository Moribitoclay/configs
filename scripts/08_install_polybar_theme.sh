#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/VaughnValle/blue-sky"
TMP_DIR="$(mktemp -d)"
REPO_DIR="${TMP_DIR}/blue-sky"
SOURCE_DIR="${REPO_DIR}/polybar"
DEST_DIR="${HOME}/.config/polybar"
FONT_SOURCE_DIR="${SOURCE_DIR}/fonts"
FONT_DEST_DIR="/usr/share/fonts/truetype"

if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

git clone "${REPO_URL}" "${REPO_DIR}"
mkdir -p "${DEST_DIR}"
cp -r "${SOURCE_DIR}/." "${DEST_DIR}/"

${SUDO} mkdir -p "${FONT_DEST_DIR}"
${SUDO} cp -r "${FONT_SOURCE_DIR}/." "${FONT_DEST_DIR}/"
${SUDO} fc-cache -v

rm -rf "${TMP_DIR}"
