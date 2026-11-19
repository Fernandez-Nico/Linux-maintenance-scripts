# 🛠️ Linux Maintenance Scripts

Colección de scripts en **Bash** diseñados para automatizar tareas básicas de administración, limpieza y copias de seguridad en sistemas Linux (basados en Debian/Ubuntu).

## 📋 Scripts incluidos

* **`backup.sh`**: Crea una copia de seguridad comprimida (`.tar.gz`) de un directorio específico añadiendo automáticamente la fecha y hora al nombre del archivo.
* **`limpieza.sh`**: Actualiza la lista de paquetes, elimina dependencias huérfanas y limpia la caché del sistema para liberar espacio en disco.
* **`info-sistema.sh`**: Muestra un resumen rápido en consola con el usuario activo, IP local, memoria RAM disponible y espacio en disco.

## 🚀 Instalación y uso

1. Clona este repositorio en tu máquina local:

```bash
git clone https://github.com/Fernandez-Nico/Linux-maintenance-scripts.git
```

2. Entra en la carpeta del proyecto:
   ```bash
   cd Linux-maintenance-scripts
   ```
 Dale permisos de ejecución a los scripts (esto es obligatorio para que Linux te deje abrirlos y ejecutarlos):
 ```bash
   chmod +x *.sh
 ```
Ejecuta el script que necesites:
 ```bash
./backup.sh
# Para el script de limpieza se requieren permisos de superusuario:
sudo ./limpieza.sh
```

**⚠️ Nota: Antes de ejecutar backup.sh por primera vez, abre el archivo y verifica que las rutas de ORIGEN y DESTINO coinciden con las carpetas de tu sistema.**

### ¿Qué hace exactamente `chmod +x *.sh`?
El comando **`chmod +x`** (*Change Mode + eXecutable*) le dice a Linux: *"Oye, convierte estos archivos en programas ejecutables"*. Por defecto, cuando descargas un archivo de texto con código, Linux solo te deja leerlo, pero con este comando le das el "permiso" para que funcione como un comando real. El asterisco (`*.sh`) significa *"aplícaselo a todos los archivos que terminen en .sh de golpe"*.
