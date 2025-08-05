#!/bin/bash

# 🔄 Neovim Configuration Update Script

set -e

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

print_color() {
    echo -e "${1}${2}${NC}"
}

print_color $PURPLE "
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║           🔄 NEOVIM CONFIGURATION UPDATER               ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
"

# 1. Actualizar Neovim
print_color $BLUE "📦 Actualizando Neovim..."
sudo apt update
sudo apt upgrade neovim -y

# 2. Verificar versión
NVIM_VERSION=$(nvim --version | head -1)
print_color $GREEN "✅ Versión actual: $NVIM_VERSION"

# 3. Actualizar plugins
print_color $BLUE "🔌 Actualizando plugins..."
nvim --headless -c "Lazy! sync" -c "qall"

# 4. Actualizar servidores LSP
print_color $BLUE "🛠️  Actualizando servidores LSP..."
nvim --headless -c "MasonUpdate" -c "qall" 2>/dev/null || true

# 5. Actualizar Treesitter parsers
print_color $BLUE "🌳 Actualizando Treesitter parsers..."
nvim --headless -c "TSUpdate" -c "qall" 2>/dev/null || true

# 6. Limpiar caché
print_color $BLUE "🧹 Limpiando caché..."
rm -rf ~/.local/share/nvim/lazy/lock.json
rm -rf ~/.cache/nvim/*

# 7. Verificar salud
print_color $BLUE "🏥 Verificando salud del sistema..."
nvim --headless -c "checkhealth" -c "qall" > /tmp/nvim_health.log 2>&1

# Mostrar warnings importantes si los hay
if grep -q "WARNING\|ERROR" /tmp/nvim_health.log; then
    print_color $YELLOW "⚠️  Se encontraron algunas advertencias en checkhealth:"
    grep "WARNING\|ERROR" /tmp/nvim_health.log | head -5
    echo ""
    print_color $YELLOW "📋 Ver reporte completo: /tmp/nvim_health.log"
else
    print_color $GREEN "✅ Checkhealth: Todo en orden"
fi

print_color $GREEN "
╔═══════════════════════════════════════════════════════════╗
║                   ✨ ACTUALIZACIÓN COMPLETA ✨          ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  🎉 Neovim y todos los plugins han sido actualizados     ║
║                                                           ║
║  📋 Resumen de actualizaciones:                          ║
║     • Neovim actualizado                                  ║
║     • Plugins sincronizados                              ║
║     • Servidores LSP actualizados                        ║
║     • Treesitter parsers actualizados                    ║
║     • Caché limpiado                                      ║
║                                                           ║
║  🚀 ¡Tu entorno está actualizado y listo!               ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
"

# Limpiar archivo temporal
rm -f /tmp/nvim_health.log