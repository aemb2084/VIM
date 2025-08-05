# 📋 Changelog

Todos los cambios notables de este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-01-XX

### ✨ Agregado
- **Configuración inicial completa** de Neovim 0.12+
- **LSP moderno** con Mason para gestión automática
- **Autocompletado inteligente** con nvim-cmp y snippets
- **Tema Catppuccin** con integración completa
- **Dashboard de inicio** con accesos rápidos
- **Terminal flotante** integrado con ToggleTerm
- **Git integration** avanzada con Gitsigns
- **Explorador de archivos** moderno con nvim-tree
- **Búsqueda fuzzy** potenciada con Telescope + FZF
- **Syntax highlighting** avanzado con Treesitter
- **Navegación rápida** con Leap.nvim
- **Comentarios contextuales** inteligentes
- **Auto pairs** con integración Treesitter
- **Which-key** para ayuda de atajos
- **Indentación visual** con líneas guía

### 🛠️ Herramientas y Scripts
- **Script de instalación automática** (`install.sh`)
- **Sistema de backup/restore** (`scripts/backup.sh`, `scripts/restore.sh`)
- **Actualizador automático** (`scripts/update.sh`)
- **Desinstalador completo** (`uninstall.sh`)

### 📚 Documentación
- **README completo** con guía de instalación
- **Guía de keymaps** detallada
- **Documentación de plugins** y personalización
- **Solución de problemas** comunes

### 🔧 Servidores LSP Incluidos
- **lua_ls** - Lua Language Server
- **pyright** - Python
- **ts_ls** - TypeScript/JavaScript
- **html** - HTML
- **cssls** - CSS
- **jsonls** - JSON

### 🎯 Keymaps Principales
- `<Space>` como leader key
- `<Space>e` - Toggle explorador de archivos
- `<Space>ff` - Buscar archivos
- `<Space>fw` - Buscar contenido
- `gcc` - Comentar/descomentar
- `Ctrl+\` - Terminal flotante
- `gd` - Ir a definición
- `<Space>ca` - Acciones de código
- `]c/[c` - Navegación de hunks git

### 🎨 Características de UI
- **Colores modernos** con Catppuccin Mocha
- **Iconos** en explorador y lualine
- **Línea de estado** informativa
- **Indicadores git** en tiempo real
- **Preview de hunks** y blame
- **Dashboard personalizable**

### ⚡ Rendimiento
- **Lazy loading** de plugins
- **Configuración optimizada** para startup rápido
- **Caché inteligente** de Treesitter
- **Búsqueda nativa** con FZF

### 🔐 Compatibilidad
- **Ubuntu 20.04+** y Debian 11+
- **Neovim 0.10+** (optimizado para 0.12+)
- **Node.js 18+** para servidores LSP
- **Python 3.8+** para herramientas

### 📦 Plugins Base
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Gestor de plugins
- [catppuccin](https://github.com/catppuccin/nvim) - Tema de colores
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP installer
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP config
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocompletado
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File explorer

## [Unreleased]

### 🚧 En Desarrollo
- Soporte para más lenguajes de programación
- Integración con Docker
- Configuración para desarrollo web avanzado
- Plantillas de snippets personalizadas
- Temas adicionales

### 💡 Planificado
- Configuración para desarrollo móvil
- Integración con bases de datos
- Soporte para contenedores
- Configuración para DevOps
- Templates de proyecto

---

## Tipos de Cambios

- **✨ Agregado** - para nuevas características
- **🔄 Cambiado** - para cambios en funcionalidad existente
- **⚠️ Deprecated** - para características que serán removidas
- **🗑️ Removido** - para características removidas
- **🐛 Arreglado** - para corrección de bugs
- **🔐 Seguridad** - para mejoras relacionadas con seguridad