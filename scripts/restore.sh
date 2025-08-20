#!/bin/bash

# 🔄 Neovim Configuration Restore Script

set -e

# Colores
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_color() {
    echo -e "${1}${2}${NC}"
}

print_color $BLUE "🔄 Script de restauración de configuración de Neovim"

# Verificar parámetro
if [ $# -eq 0 ]; then
    print_color $YELLOW "📋 Uso: ./restore.sh <nombre_backup>"
    echo ""
    print_color $BLUE "🗂️  Backups disponibles:"
    
    BACKUP_DIR="$HOME/.config/nvim-backups"
    if [ -d "$BACKUP_DIR" ]; then
        ls -la "$BACKUP_DIR"/*.tar.gz 2>/dev/null | awk '{
            split($9, path, "/")
            filename = path[length(path)]
            gsub(/nvim_backup_/, "", filename)
            gsub(/\.tar\.gz/, "", filename)
            print "   " filename " (" $5 " bytes) - " $6 " " $7 " " $8
        }' || print_color $RED "❌ No hay backups disponibles"
    else
        print_color $RED "❌ No se encontró directorio de backups"
    fi
    exit 1
fi

BACKUP_NAME="$1"
BACKUP_DIR="$HOME/.config/nvim-backups"
BACKUP_FILE="$BACKUP_DIR/nvim_backup_${BACKUP_NAME}.tar.gz"

# Verificar que existe el backup
if [ ! -f "$BACKUP_FILE" ]; then
    print_color $RED "❌ Backup no encontrado: $BACKUP_FILE"
    exit 1
fi

print_color $BLUE "📦 Restaurando desde: nvim_backup_${BACKUP_NAME}.tar.gz"

# Crear backup de configuración actual antes de restaurar
if [ -d "$HOME/.config/nvim" ]; then
    print_color $YELLOW "⚠️  Configuración actual encontrada. Creando backup de seguridad..."
    CURRENT_BACKUP="nvim_backup_before_restore_$(date +%Y%m%d_%H%M%S)"
    cp -r "$HOME/.config/nvim" "$BACKUP_DIR/$CURRENT_BACKUP"
    cd "$BACKUP_DIR"
    tar -czf "${CURRENT_BACKUP}.tar.gz" "$CURRENT_BACKUP"
    rm -rf "$CURRENT_BACKUP"
    print_color $GREEN "✅ Backup de seguridad creado: ${CURRENT_BACKUP}.tar.gz"
fi

# Eliminar configuración actual
print_color $BLUE "🗑️  Eliminando configuración actual..."
rm -rf "$HOME/.config/nvim"

# Extraer backup
print_color $BLUE "📂 Extrayendo backup..."
cd "$BACKUP_DIR"
tar -xzf "nvim_backup_${BACKUP_NAME}.tar.gz"

# Mover a ubicación correcta
print_color $BLUE "📁 Restaurando configuración..."
mv "$BACKUP_DIR/nvim_backup_${BACKUP_NAME}" "$HOME/.config/nvim"

# Verificar restauración
if [ -d "$HOME/.config/nvim" ] && [ -f "$HOME/.config/nvim/init.lua" ]; then
    print_color $GREEN "✅ Configuración restaurada exitosamente!"
    
    # Información del backup restaurado
    BACKUP_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    BACKUP_DATE=$(stat -c %y "$BACKUP_FILE" | cut -d' ' -f1)
    
    echo ""
    print_color $BLUE "📊 Información del backup restaurado:"
    echo "   📦 Archivo: nvim_backup_${BACKUP_NAME}.tar.gz"
    echo "   📏 Tamaño: $BACKUP_SIZE"
    echo "   📅 Fecha: $BACKUP_DATE"
    echo ""
    
    print_color $GREEN "🚀 ¡Neovim está listo para usar!"
    print_color $YELLOW "💡 Ejecuta 'nvim' para verificar que todo funciona correctamente"
else
    print_color $RED "❌ Error en la restauración. Verificar manualmente."
    exit 1
fi