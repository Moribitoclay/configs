#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SOURCE_CURRENT="${ROOT_DIR}/configs/polybar_current.ini"
SOURCE_LAUNCH="${ROOT_DIR}/configs/polybar_launch.sh"
SOURCE_ETHERNET="${ROOT_DIR}/configs/ethernet_status.sh"

POLYBAR_DIR="${HOME}/.config/polybar"
BSPWM_SCRIPTS_DIR="${HOME}/.config/bspwm/scripts"

mkdir -p "${POLYBAR_DIR}"
cp "${SOURCE_CURRENT}" "${POLYBAR_DIR}/current.ini"
cp "${SOURCE_LAUNCH}" "${POLYBAR_DIR}/launch.sh"
chmod +x "${POLYBAR_DIR}/launch.sh"

mkdir -p "${BSPWM_SCRIPTS_DIR}"
cp "${SOURCE_ETHERNET}" "${BSPWM_SCRIPTS_DIR}/ethernet_status.sh"
chmod +x "${BSPWM_SCRIPTS_DIR}/ethernet_status.sh"
