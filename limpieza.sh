
#!/bin/bash

# Comprobar si el usuario es root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Por favor, ejecuta este script con permisos de superusuario (sudo ./limpieza.sh)"
    exit 1
fi

echo "=============================================="
echo "🧹 INICIANDO TAREAS DE LIMPIEZA Y MANTENIMIENTO"
echo "=============================================="

# Detectar el gestor de paquetes disponible
if command -v apt >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt"
elif command -v dnf >/dev/null 2>&1; then
    PACKAGE_MANAGER="dnf"
else
    echo "❌ No se ha encontrado un gestor de paquetes compatible (apt o dnf)."
    exit 1
fi

echo "📦 Gestor de paquetes detectado: $PACKAGE_MANAGER"

# Ejecutar tareas según el gestor de paquetes
case "$PACKAGE_MANAGER" in

    apt)
        # 1. Actualizar listas de paquetes
        echo "📦 Actualizando listas de paquetes..."
        apt update -y

        # 2. Eliminar dependencias innecesarias
        echo "🗑️ Eliminando dependencias huérfanas..."
        apt autoremove -y

        # 3. Limpiar paquetes descargados y caché
        echo "🧽 Limpiando caché de paquetes..."
        apt autoclean -y
        apt clean
        ;;

    dnf)
        # 1. Actualizar metadatos de paquetes
        echo "📦 Actualizando metadatos de paquetes..."
        dnf makecache

        # 2. Eliminar dependencias innecesarias
        echo "🗑️ Eliminando dependencias innecesarias..."
        dnf autoremove -y

        # 3. Limpiar caché de paquetes
        echo "🧽 Limpiando caché de paquetes..."
        dnf clean all
        ;;

esac

echo "=============================================="
echo "✅ ¡Limpieza del sistema completada con éxito!"
echo "=============================================="
