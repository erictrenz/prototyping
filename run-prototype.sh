#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${1:-8000}"
FILE="loan-use-hub.html"

if [[ ! -f "$ROOT_DIR/$FILE" ]]; then
  echo "Error: $FILE was not found in $ROOT_DIR" >&2
  exit 1
fi

echo "Serving prototype from: $ROOT_DIR"
echo "URL: http://localhost:${PORT}/${FILE}"
echo "Press Ctrl+C to stop."

cd "$ROOT_DIR"
python3 -m http.server "$PORT"
