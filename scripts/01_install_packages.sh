#!/usr/bin/env bash
# Modo estricto para detener el script ante errores reales.
set -euo pipefail

# Lista de paquetes base que queremos instalar en Parrot.
PACKAGES=(
  bspwm
  kitty
  sxhkd
  polybar
  picom
  rofi
  build-essential
  git
  vim
  libxcb1-dev
  libxcb-util0-dev
  libxcb-ewmh-dev
  libxcb-randr0-dev
  libxcb-icccm4-dev
  libxcb-keysyms1-dev
  libxcb-xinerama0-dev
  libasound2-dev
  libxcb-xtest0-dev
  libxcb-shape0-dev
)

# Si no somos root, usaremos sudo para ejecutar apt.
# Si ya somos root, no hace falta prefijo.
if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

# Actualiza el indice local de paquetes disponibles.
echo "[+] Actualizando indices de paquetes..."
${SUDO} apt update

# Instala todos los paquetes listados en el array PACKAGES.
# -y acepta automaticamente las confirmaciones.
echo "[+] Instalando paquetes: ${PACKAGES[*]}"
${SUDO} apt install -y "${PACKAGES[@]}"

# Mensaje final de estado.
echo "[+] Instalacion de paquetes completada."
