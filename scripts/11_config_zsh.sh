#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_ZSHRC="${ROOT_DIR}/configs/zshrc"
SOURCE_P10K="${ROOT_DIR}/configs/p10k.zsh"

cp "${SOURCE_ZSHRC}" "${HOME}/.zshrc"
cp "${SOURCE_P10K}" "${HOME}/.p10k.zsh"
