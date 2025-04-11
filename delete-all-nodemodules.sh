#!/bin/bash

# Caminho base onde procurar (padrão: diretório atual)
BASE_DIR="${1:-.}"

echo "🔍 Procurando por pastas 'node_modules' dentro de: $BASE_DIR"
echo

# Encontra todas as pastas chamadas node_modules e remove
find "$BASE_DIR" -type d -name "node_modules" -prune -print -exec rm -rf {} \;

echo
echo "✅ Concluído! Todas as pastas node_modules foram removidas."
