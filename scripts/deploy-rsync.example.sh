#!/usr/bin/env bash
# Příklad: zkopírujte na deploy-rsync.sh, upravte cíl a spouštějte po `hugo`.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
hugo --gc --minify
# rsync -avz --delete public/ user@server:/cesta/k/html/
