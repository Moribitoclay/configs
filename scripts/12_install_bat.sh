#!/usr/bin/env bash
set -euo pipefail

TMP_DIR="$(mktemp -d)"
BAT_URL="https://github.com/sharkdp/bat/releases/download/v0.26.1/bat_0.26.1_amd64.deb"
BAT_DEB_FILE="${TMP_DIR}/bat_0.26.1_amd64.deb"
LSD_URL="https://github.com/lsd-rs/lsd/releases/download/v1.2.0/lsd_1.2.0_amd64.deb"
LSD_DEB_FILE="${TMP_DIR}/lsd_1.2.0_amd64.deb"

if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

wget -O "${BAT_DEB_FILE}" "${BAT_URL}"
${SUDO} dpkg -i "${BAT_DEB_FILE}"

wget -O "${LSD_DEB_FILE}" "${LSD_URL}"
${SUDO} dpkg -i "${LSD_DEB_FILE}"
