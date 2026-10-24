#!/usr/bin/env bash
#
# new-writeup.sh: start a new HTB machine writeup from the template.
#
# Usage:   ./scripts/new-writeup.sh <MachineName> <linux|windows>
# Example: ./scripts/new-writeup.sh Blue windows
#
# Creates htb/machines/<os>/<machinename>.md with the title and OS filled in.

set -euo pipefail

# ── Arguments ────────────────────────────────────────────────
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <MachineName> <linux|windows>" >&2
  exit 1
fi

NAME="$1"
OS_INPUT="$(echo "$2" | tr '[:upper:]' '[:lower:]')"

if [[ "$OS_INPUT" != "linux" && "$OS_INPUT" != "windows" ]]; then
  echo "Error: OS must be 'linux' or 'windows' (got '$2')." >&2
  exit 1
fi

# ── Paths (relative to the repo root, wherever the script is run from) ──
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE="$REPO_ROOT/templates/htb-machine-template.md"
DEST_DIR="$REPO_ROOT/htb/machines/$OS_INPUT"
FILE_NAME="$(echo "$NAME" | tr '[:upper:]' '[:lower:]').md"
DEST="$DEST_DIR/$FILE_NAME"

if [[ ! -f "$TEMPLATE" ]]; then
  echo "Error: template not found at $TEMPLATE" >&2
  exit 1
fi

if [[ -e "$DEST" ]]; then
  echo "Error: $DEST already exists, refusing to overwrite." >&2
  exit 1
fi

# ── Capitalised OS label for display (linux -> Linux) ────────
OS_LABEL="$(echo "${OS_INPUT:0:1}" | tr '[:lower:]' '[:upper:]')${OS_INPUT:1}"

# ── Copy template and fill in the placeholders ───────────────
mkdir -p "$DEST_DIR"
sed -e "s/{{MACHINE_NAME}}/$NAME/g" \
    -e "s/{{OS}}/$OS_LABEL/g" \
    "$TEMPLATE" > "$DEST"

echo "Created: ${DEST#"$REPO_ROOT"/}"
echo "Reminder: publish only once the machine is RETIRED."
