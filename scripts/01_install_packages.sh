#!/usr/bin/env bash
# Modo estricto para detener el script ante errores reales.
set -euo pipefail

# Lista de paquetes base que queremos instalar en Parrot.
PACKAGES=(
  zsh
  zsh-autocomplete
  zsh-autosuggestions
  zsh-syntax-highlighting
  feh
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
  libconfig-dev
  libdbus-1-dev
  libegl-dev
  libev-dev
  libgl-dev
  libepoxy-dev
  libpcre2-dev
  libpixman-1-dev
  libx11-xcb-dev
  libxcb1-dev
  libxcb-composite0-dev
  libxcb-damage0-dev
  libxcb-glx0-dev
  libxcb-image0-dev
  libxcb-present-dev
  libxcb-randr0-dev
  libxcb-render0-dev
  libxcb-render-util0-dev
  libxcb-shape0-dev
  libxcb-util-dev
  libxcb-xfixes0-dev
  meson
  ninja-build
  uthash-dev
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
