#!/bin/bash

# 🚀 Neovim Modern Configuration Installer
# Autor: Configuración desarrollada con Claude
# Versión: 1.0

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Función para imprimir con colores
print_color() {
    echo -e "${1}${2}${NC}"
}

# Función para mostrar progreso
show_progress() {
    print_color $BLUE "📋 $1"
}

# Función para mostrar éxito
show_success() {
    print_color $GREEN "✅ $1"
}

# Función para mostrar error
show_error() {
    print_color $RED "❌ $1"
}

# Función para mostrar advertencia
show_warning() {
    print_color $YELLOW "⚠️  $1"
}

# Banner
print_color $PURPLE "
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║        🚀 NEOVIM MODERN CONFIGURATION INSTALLER         ║
║                                                           ║
║    Instalación automática de Neovim 0.12+ con plugins   ║
║    modernos, LSP, autocompletado y mucho más!           ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
"

# Verificar si es Ubuntu/Debian
if ! command -v apt &> /dev/null; then
    show_error "Este script está diseñado para Ubuntu/Debian"
    exit 1
fi

# Verificar permisos sudo
if ! sudo -v &> /dev/null; then
    show_error "Se requieren permisos sudo para continuar"
    exit 1
fi

show_progress "Iniciando instalación de Neovim moderno..."

# 1. Actualizar repositorios y agregar PPA de Neovim
show_progress "Agregando repositorio oficial de Neovim..."
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update

# 2. Instalar dependencias necesarias
show_progress "Instalando dependencias del sistema..."
sudo apt install -y \
    neovim \
    build-essential \
    cmake \
    unzip \
    curl \
    git \
    python3-pip \
    nodejs \
    npm \
    ripgrep \
    fd-find

# 3. Instalar herramientas de desarrollo adicionales
show_progress "Instalando herramientas de desarrollo..."
# Instalar Node.js LTS si no está actualizado
if ! node --version | grep -q "v2[0-9]"; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# 4. Crear backup de configuración existente
if [ -d "$HOME/.config/nvim" ]; then
    show_warning "Configuración existente encontrada. Creando backup..."
    BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    mv "$HOME/.config/nvim" "$BACKUP_DIR"
    show_success "Backup creado en: $BACKUP_DIR"
fi

# 5. Crear estructura de directorios
show_progress "Creando estructura de configuración..."
mkdir -p "$HOME/.config/nvim/lua/config"
mkdir -p "$HOME/.vim/undodir"

# 6. Copiar archivos de configuración
show_progress "Copiando archivos de configuración..."

# Copiar configuraciones desde el repositorio
cp -r config/nvim/* "$HOME/.config/nvim/"

# 7. Verificar instalación
show_progress "Verificando instalación..."
if nvim --version | grep -q "NVIM v0.1[0-9]"; then
    show_success "Neovim actualizado correctamente: $(nvim --version | head -1)"
else
    show_error "Error en la instalación de Neovim"
    exit 1
fi

# 8. Instalar plugins (primera ejecución)
show_progress "Instalando plugins de Neovim..."
nvim --headless -c "lua require('lazy').sync()" -c "qall"

# 9. Instalar servidores LSP
show_progress "Instalando servidores LSP..."
nvim --headless -c "MasonInstallAll" -c "qall" 2>/dev/null || true

show_success "¡Instalación completada exitosamente!"

print_color $CYAN "
╔═══════════════════════════════════════════════════════════╗
║                    ✨ INSTALACIÓN COMPLETA ✨           ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  🎉 Neovim está listo para usar con:                     ║
║                                                           ║
║  • LSP para Lua, Python, TypeScript, HTML, CSS           ║
║  • Autocompletado inteligente con snippets               ║
║  • Explorador de archivos y búsqueda fuzzy               ║
║  • Git integration y terminal flotante                   ║
║  • Dashboard de inicio y temas modernos                  ║
║                                                           ║
║  📖 Comandos principales:                                ║
║     <Space>ff  - Buscar archivos                         ║
║     <Space>e   - Explorador de archivos                  ║
║     gcc        - Comentar línea                          ║
║     <Ctrl+\\>   - Terminal flotante                       ║
║                                                           ║
║  🚀 ¡Ejecuta 'nvim' para comenzar!                       ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
"

# Mostrar información adicional
echo ""
show_progress "Información adicional:"
echo "• Configuración ubicada en: ~/.config/nvim"
echo "• Para personalizar: edita ~/.config/nvim/lua/config/"
echo "• Documentación: https://neovim.io/doc/"
echo "• Para desinstalar: ejecuta ./uninstall.sh"
echo ""
show_success "¡Disfruta tu nuevo entorno de desarrollo!"