#!/bin/bash

echo "=============================================="
echo "          INFORME DEL SISTEMA LINUX           "
echo "=============================================="
echo "👤 Usuario actual: $USER"
echo "🖥️ Hostname: $(hostname)"
echo "📅 Fecha y hora: $(date)"
echo "----------------------------------------------"
echo "🧠 Memoria RAM:"
free -h | awk 'NR==2{printf "   Total: %s | Usada: %s | Libre: %s\n", $2, $3, $4}'
echo "----------------------------------------------"
echo "💾 Espacio en disco (/):"
df -h / | awk 'NR==2{printf "   Total: %s | Usado: %s | Disponible: %s (%s)\n", $2, $3, $4, $5}'
echo "=============================================="
