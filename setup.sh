#!/usr/bin/env bash
# Activa modo estricto:
# -e  -> salir si un comando falla
# -u  -> error al usar variables no definidas
# pipefail -> falla una tuberia si falla cualquier comando de la cadena
set -euo pipefail

# Directorio donde vive este script (ruta absoluta).
# Permite llamar scripts hijos sin depender del directorio actual.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ejecuta un paso (script) mostrando su nombre por consola.
run_step() {
  # Ruta relativa del script de paso, por ejemplo: scripts/01_install_packages.sh
  local step_script="$1"
  echo "[+] Ejecutando: ${step_script}"
  # Ejecuta el script paso usando bash.
  bash "${SCRIPT_DIR}/${step_script}"
}

# Carga en STEPS todos los .sh dentro de /scripts y los ordena alfabeticamente.
# Esto permite controlar el orden usando prefijos 01_, 02_, 03_, etc.
mapfile -t STEPS < <(find "${SCRIPT_DIR}/scripts" -maxdepth 1 -type f -name "*.sh" | sort)

# Si no hay scripts de pasos, aborta con error para evitar una ejecucion vacia.
if [[ "${#STEPS[@]}" -eq 0 ]]; then
  echo "[-] No se encontraron scripts en ${SCRIPT_DIR}/scripts"
  exit 1
fi

# Recorre cada paso encontrado y lo ejecuta.
for step_path in "${STEPS[@]}"; do
  # Convierte la ruta absoluta a relativa respecto a SCRIPT_DIR.
  step_relative="${step_path#${SCRIPT_DIR}/}"
  run_step "${step_relative}"
done

# Mensaje final de estado.
echo "[+] Setup base completado."
