#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_COLOR="${ROOT_DIR}/configs/color.ini"
SOURCE_CONF="${ROOT_DIR}/configs/kitty.conf"
USER_DEST_DIR="${HOME}/.config/kitty"
ROOT_DEST_DIR="/root/.config/kitty"

if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

mkdir -p "${USER_DEST_DIR}"
cp "${SOURCE_COLOR}" "${USER_DEST_DIR}/color.ini"
cp "${SOURCE_CONF}" "${USER_DEST_DIR}/kitty.conf"

${SUDO} mkdir -p "${ROOT_DEST_DIR}"
${SUDO} cp "${SOURCE_COLOR}" "${ROOT_DEST_DIR}/color.ini"
${SUDO} cp "${SOURCE_CONF}" "${ROOT_DEST_DIR}/kitty.conf"
${SUDO} chown root:root "${ROOT_DEST_DIR}/color.ini" "${ROOT_DEST_DIR}/kitty.conf"
