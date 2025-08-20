#!/bin/bash

# 🗑️ Neovim Configuration Uninstaller

set -e

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_color() {
    echo -e "${1}${2}${NC}"
}

print_color $RED "
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║           🗑️  NEOVIM CONFIGURATION UNINSTALLER          ║
║                                                           ║
║    ⚠️  ADVERTENCIA: Esto eliminará toda la configuración ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
"

# Confirmación
print_color $YELLOW "¿Estás seguro de que quieres desinstalar la configuración de Neovim? (y/N): "
read -r response

if [[ ! "$response" =~ ^[Yy]$ ]]; then
    print_color $BLUE "❌ Desinstalación cancelada"
    exit 0
fi

print_color $YELLOW "¿También quieres desinstalar Neovim completamente? (y/N): "
read -r uninstall_nvim

# Crear backup antes de eliminar
print_color $BLUE "💾 Creando backup final antes de eliminar..."
if [ -d "$HOME/.config/nvim" ]; then
    BACKUP_DIR="$HOME/.config/nvim-backups"
    mkdir -p "$BACKUP_DIR"
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    FINAL_BACKUP="nvim_backup_final_$TIMESTAMP"
    
    cp -r "$HOME/.config/nvim" "$BACKUP_DIR/$FINAL_BACKUP"
    cd "$BACKUP_DIR"
    tar -czf "${FINAL_BACKUP}.tar.gz" "$FINAL_BACKUP"
    rm -rf "$FINAL_BACKUP"
    
    print_color $GREEN "✅ Backup final creado: ${FINAL_BACKUP}.tar.gz"
fi

# Eliminar configuración
print_color $BLUE "🗑️  Eliminando configuración de Neovim..."
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.local/share/nvim"
rm -rf "$HOME/.local/state/nvim"
rm -rf "$HOME/.cache/nvim"
rm -rf "$HOME/.vim/undodir"

print_color $GREEN "✅ Configuración de Neovim eliminada"

# Desinstalar Neovim si se solicitó
if [[ "$uninstall_nvim" =~ ^[Yy]$ ]]; then
    print_color $BLUE "🗑️  Desinstalando Neovim..."
    sudo apt remove neovim -y
    sudo apt autoremove -y
    
    # Eliminar PPA
    print_color $BLUE "🗑️  Eliminando repositorio PPA..."
    sudo add-apt-repository --remove ppa:neovim-ppa/unstable -y
    
    print_color $GREEN "✅ Neovim desinstalado completamente"
fi

# Opcional: eliminar dependencias de desarrollo
print_color $YELLOW "¿Quieres eliminar las dependencias de desarrollo instaladas? (y/N): "
read -r remove_deps

if [[ "$remove_deps" =~ ^[Yy]$ ]]; then
    print_color $BLUE "🗑️  Eliminando dependencias de desarrollo..."
    sudo apt remove build-essential cmake nodejs npm ripgrep fd-find -y
    sudo apt autoremove -y
    print_color $GREEN "✅ Dependencias eliminadas"
fi

print_color $GREEN "
╔═══════════════════════════════════════════════════════════╗
║                   ✅ DESINSTALACIÓN COMPLETA             ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  🗑️  Configuración de Neovim eliminada                   ║
║  💾 Backup final guardado en ~/.config/nvim-backups      ║
║                                                           ║
║  📋 Para reinstalar en el futuro:                        ║
║     git clone <repositorio>                               ║
║     cd neovim-config                                      ║
║     ./install.sh                                          ║
║                                                           ║
║  🔄 Para restaurar configuración previa:                 ║
║     ./scripts/restore.sh <nombre_backup>                 ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
"

print_color $BLUE "¡Gracias por usar nuestra configuración de Neovim! 👋"