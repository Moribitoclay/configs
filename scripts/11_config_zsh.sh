#!/usr/bin/env bash
set -euo pipefail

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_ZSHRC="${ROOT_DIR}/configs/zshrc"
SOURCE_ZSHRC_ROOT="${ROOT_DIR}/configs/zshrc"
SOURCE_P10K="${ROOT_DIR}/configs/p10k.zsh"

if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

cp "${SOURCE_ZSHRC}" "${HOME}/.zshrc"
cp "${SOURCE_P10K}" "${HOME}/.p10k.zsh"
${SUDO} cp "${SOURCE_ZSHRC_ROOT}" /root/.zshrc
${SUDO} cp "${SOURCE_P10K}" /root/.p10k.zsh

${SUDO} git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k