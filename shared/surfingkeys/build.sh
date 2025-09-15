#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
CONFIG_FILE="$SCRIPT_DIR/.surfingkeys.js"

# Detect JS files safely
JS_FILES=("$SRC_DIR"/*.js)
if [[ ! -e "${JS_FILES[0]}" ]]; then
    JS_FILES=()
fi

printf '  %s\n' "$SRC_DIR"/*.js
cat "$SRC_DIR"/*.js >"$CONFIG_FILE"
