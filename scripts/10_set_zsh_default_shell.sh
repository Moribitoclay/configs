#!/usr/bin/env bash
set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

ZSH_PATH="$(command -v zsh)"
TARGET_USER="${SUDO_USER:-${USER}}"

${SUDO} usermod --shell "${ZSH_PATH}" "${TARGET_USER}"
${SUDO} usermod --shell "${ZSH_PATH}" root
