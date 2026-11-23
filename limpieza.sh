#!/bin/bash

# Comprobar si el usuario es root (necesario para actualizar paquetes y limpiar caché)
if [ "$EUID" -ne 0 ]; then
    echo "❌ Por favor, ejecuta este script con permisos de superusuario (sudo ./limpieza.sh)"
    exit 1
fi

echo "=============================================="
echo "🧹 INICIANDO TAREAS DE LIMPIEZA Y MANTENIMIENTO"
echo "=============================================="

# 1. Actualizar la lista de paquetes
echo "📦 Actualizando listas de paquetes..."
apt update -y

# 2. Limpiar paquetes huérfanos y dependencias innecesarias
echo "🗑️ Eliminando dependencias huérfanas y paquetes innecesarios..."
apt autoremove -y
apt autoclean -y

# 3. Limpiar la caché de apt para liberar espacio en disco
echo "🧽 Limpiando caché local de paquetes..."
apt clean -y

echo "=============================================="
echo "✅ ¡Limpieza del sistema completada con éxito!"
echo "=============================================="
