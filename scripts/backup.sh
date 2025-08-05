#!/bin/bash

# 💾 Neovim Configuration Backup Script

set -e

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_color() {
    echo -e "${1}${2}${NC}"
}

print_color $BLUE "🗄️  Creando backup de configuración de Neovim..."

# Crear directorio de backups si no existe
BACKUP_DIR="$HOME/.config/nvim-backups"
mkdir -p "$BACKUP_DIR"

# Crear timestamp para el backup
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="nvim_backup_$TIMESTAMP"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

# Verificar si existe configuración
if [ ! -d "$HOME/.config/nvim" ]; then
    print_color $YELLOW "⚠️  No se encontró configuración de Neovim en ~/.config/nvim"
    exit 1
fi

# Crear backup
print_color $BLUE "📦 Creando backup: $BACKUP_NAME"
cp -r "$HOME/.config/nvim" "$BACKUP_PATH"

# Comprimir backup
print_color $BLUE "🗜️  Comprimiendo backup..."
cd "$BACKUP_DIR"
tar -czf "${BACKUP_NAME}.tar.gz" "$BACKUP_NAME"
rm -rf "$BACKUP_NAME"

# Información del backup
BACKUP_SIZE=$(du -h "${BACKUP_NAME}.tar.gz" | cut -f1)
print_color $GREEN "✅ Backup creado exitosamente!"
echo ""
echo "📍 Ubicación: $BACKUP_DIR/${BACKUP_NAME}.tar.gz"
echo "📏 Tamaño: $BACKUP_SIZE"
echo "🕒 Fecha: $(date)"
echo ""

# Listar backups existentes
print_color $BLUE "📋 Backups disponibles:"
ls -la "$BACKUP_DIR"/*.tar.gz 2>/dev/null | awk '{print "   " $9 " (" $5 " bytes) - " $6 " " $7 " " $8}' || echo "   No hay backups anteriores"

print_color $GREEN "💡 Para restaurar este backup, ejecuta:"
print_color $YELLOW "   ./scripts/restore.sh $BACKUP_NAME"