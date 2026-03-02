#!/usr/bin/env bash
set -euo pipefail

URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
WORK_DIR="$(mktemp -d)"
ZIP_FILE="${WORK_DIR}/Hack.zip"
EXTRACT_DIR="${WORK_DIR}/Hack"
FONT_DEST="/usr/share/fonts"

if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

mkdir -p "${EXTRACT_DIR}"
wget -O "${ZIP_FILE}" "${URL}"
unzip -q "${ZIP_FILE}" -d "${EXTRACT_DIR}"

find "${EXTRACT_DIR}" -type f -name "*.ttf" -exec ${SUDO} cp {} "${FONT_DEST}/" \;

rm -rf "${WORK_DIR}"
