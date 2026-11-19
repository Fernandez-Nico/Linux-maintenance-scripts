# Configuración de rutas (puedes adaptarlas a las carpetas que quieras respaldar)
ORIGEN="$HOME/Documentos"
DESTINO="$HOME/Backups"
FECHA=$(date +"%Y-%m-%d_%H-%M")
ARCHIVO="backup_$FECHA.tar.gz"

# Crear la carpeta de destino si no existe
mkdir -p "$DESTINO"

echo "Iniciando copia de seguridad de $ORIGEN..."

# Comprimir la carpeta en formato tar.gz
tar -czf "$DESTINO/$ARCHIVO" "$ORIGEN" 2>/dev/null

# Comprobar si el comando anterior salió bien
if [ $? -eq 0 ]; then
    echo "✅ Copia completada con éxito en: $DESTINO/$ARCHIVO"
else
    echo "❌ Hubo un error al crear la copia de seguridad."
fi
