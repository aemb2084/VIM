# 🚀 Neovim Modern Configuration

Una configuración moderna y completa de Neovim 0.12+ con LSP, autocompletado, plugins esenciales y mucho más.

[![Neovim](https://img.shields.io/badge/Neovim-0.12+-green.svg)](https://neovim.io/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Linux-orange.svg)](https://ubuntu.com/)

## ✨ Características

### 🔧 LSP y Desarrollo
- **Mason** - Instalador automático de servidores LSP
- **LSP completo** para Lua, Python, TypeScript/JavaScript, HTML, CSS, JSON
- **Autocompletado inteligente** con nvim-cmp y snippets
- **Formateo automático** de código
- **Diagnósticos en tiempo real**
- **Go to definition, references, rename** y más

### 🎨 Interfaz y UX
- **Tema Catppuccin Mocha** - Oscuro y moderno
- **Dashboard de inicio** con accesos rápidos
- **Lualine** - Barra de estado elegante
- **Nvim-tree** - Explorador de archivos con iconos
- **Telescope** - Búsqueda fuzzy ultrarrápida
- **Which-key** - Ayuda contextual de atajos
- **Indentación visual** con líneas guía

### 🔍 Búsqueda y Navegación
- **Telescope** con extensión FZF nativa
- **Leap.nvim** - Navegación rápida con 2 caracteres
- **Búsqueda de archivos, contenido, buffers, historial**
- **Grep en vivo** con ripgrep

### 📝 Edición Avanzada
- **Treesitter** - Syntax highlighting inteligente
- **Auto pairs** con integración Treesitter
- **Comentarios contextuales** por tipo de archivo
- **Selección incremental** con Treesitter
- **Múltiples cursores** y edición avanzada

### 🐙 Git Integration
- **Gitsigns** - Indicadores de cambios en tiempo real
- **Git blame** en línea
- **Navegación de hunks** (cambios)
- **Stage/unstage** hunks directamente
- **Vista previa de cambios**

### 🖥️ Terminal y Herramientas
- **ToggleTerm** - Terminal flotante integrado
- **Gestión de tabs y splits** mejorada
- **Autocomandos** útiles
- **Configuración portable**

## 🚀 Instalación Rápida

### Instalación Automática (Recomendada)

```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/neovim-config.git
cd neovim-config

# Ejecutar instalador automático
./install.sh
```

### Instalación Manual

1. **Actualizar Neovim:**
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim
```

2. **Instalar dependencias:**
```bash
sudo apt install -y build-essential cmake unzip curl git python3-pip nodejs npm ripgrep fd-find
```

3. **Copiar configuración:**
```bash
# Backup de configuración existente (opcional)
mv ~/.config/nvim ~/.config/nvim.backup

# Copiar nueva configuración
cp -r config/nvim ~/.config/
```

4. **Primera ejecución:**
```bash
nvim
```

## 🎯 Keymaps Principales

### Navegación General
| Keymap | Descripción |
|--------|-------------|
| `<Space>` | Leader key |
| `<Space>e` | Toggle explorador de archivos |
| `<Space>ef` | Encontrar archivo actual en explorador |
| `Ctrl+h/j/k/l` | Navegar entre ventanas |

### Búsqueda (Telescope)
| Keymap | Descripción |
|--------|-------------|
| `<Space>ff` | Buscar archivos |
| `<Space>fw` | Buscar palabras (grep) |
| `<Space>fb` | Buscar buffers |
| `<Space>fh` | Buscar ayuda |
| `<Space>fr` | Archivos recientes |
| `<Space>fc` | Cambiar tema de color |

### LSP y Código
| Keymap | Descripción |
|--------|-------------|
| `gd` | Ir a definición |
| `gD` | Ir a declaración |
| `gr` | Mostrar referencias |
| `K` | Mostrar documentación |
| `<Space>ca` | Acciones de código |
| `<Space>rn` | Renombrar |
| `<Space>f` | Formatear código |

### Git (Gitsigns)
| Keymap | Descripción |
|--------|-------------|
| `]c` | Siguiente hunk |
| `[c` | Hunk anterior |
| `<Space>hs` | Stage hunk |
| `<Space>hr` | Reset hunk |
| `<Space>hp` | Preview hunk |
| `<Space>hb` | Blame línea |

### Edición
| Keymap | Descripción |
|--------|-------------|
| `gcc` | Comentar/descomentar línea |
| `gc` | Comentar selección (visual) |
| `<Alt>j/k` | Mover líneas arriba/abajo |
| `s + 2chars` | Saltar a ubicación (Leap) |

### Terminal y Utilidades
| Keymap | Descripción |
|--------|-------------|
| `Ctrl+\` | Terminal flotante |
| `<Space>sv` | Split vertical |
| `<Space>sh` | Split horizontal |
| `<Space>tn` | Nueva tab |

## 📁 Estructura del Proyecto

```
neovim-config/
├── 📄 README.md              # Esta documentación
├── 🚀 install.sh             # Instalador automático
├── 🗑️ uninstall.sh           # Desinstalador
├── 📋 CHANGELOG.md           # Historial de cambios
├── 📜 LICENSE                # Licencia MIT
├── 📁 config/
│   └── 📁 nvim/
│       ├── 📄 init.lua       # Configuración principal
│       └── 📁 lua/
│           └── 📁 config/
│               ├── 📄 options.lua    # Opciones de Neovim
│               ├── 📄 keymaps.lua    # Atajos de teclado
│               ├── 📄 autocmds.lua   # Autocomandos
│               └── 📄 lazy.lua       # Configuración de plugins
├── 📁 scripts/
│   ├── 📄 backup.sh          # Script de backup
│   ├── 📄 restore.sh         # Script de restauración
│   └── 📄 update.sh          # Actualizador
└── 📁 docs/
    ├── 📄 KEYMAPS.md         # Guía completa de atajos
    ├── 📄 PLUGINS.md         # Documentación de plugins
    ├── 📄 CUSTOMIZATION.md  # Guía de personalización
    └── 📄 TROUBLESHOOTING.md # Solución de problemas
```

## 🛠️ Plugins Incluidos

### Core
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Gestor de plugins moderno
- **[catppuccin](https://github.com/catppuccin/nvim)** - Tema de colores elegante

### LSP y Autocompletado
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - Instalador de LSP
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - Configuración LSP
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Motor de autocompletado
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Motor de snippets

### Interfaz
- **[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)** - Explorador de archivos
- **[lualine](https://github.com/nvim-lualine/lualine.nvim)** - Barra de estado
- **[telescope](https://github.com/nvim-telescope/telescope.nvim)** - Búsqueda fuzzy
- **[which-key](https://github.com/folke/which-key.nvim)** - Ayuda de atajos
- **[dashboard](https://github.com/nvimdev/dashboard-nvim)** - Pantalla de inicio

### Edición
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Comentarios inteligentes
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto pairs
- **[leap.nvim](https://github.com/ggandor/leap.nvim)** - Navegación rápida

### Git y Terminal
- **[gitsigns](https://github.com/lewis6991/gitsigns.nvim)** - Git integration
- **[toggleterm](https://github.com/akinsho/toggleterm.nvim)** - Terminal integrado

### Utilidades
- **[indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)** - Líneas de indentación

## ⚙️ Personalización

### Cambiar Tema
```lua
-- En lua/config/lazy.lua, cambiar:
vim.cmd.colorscheme("catppuccin-mocha")
-- Por uno de: catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
```

### Agregar Servidores LSP
```lua
-- En lua/config/lazy.lua, agregar a ensure_installed:
ensure_installed = { 
  "lua_ls", 
  "pyright", 
  "ts_ls",
  "rust_analyzer",  -- Agregar Rust
  "gopls",          -- Agregar Go
}
```

### Modificar Keymaps
```lua
-- En lua/config/keymaps.lua
vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>", { desc = "Todo list" })
```

## 🔧 Scripts Utilitarios

### Backup y Restauración
```bash
# Crear backup de configuración actual
./scripts/backup.sh

# Restaurar desde backup
./scripts/restore.sh backup_20231201_120000
```

### Actualización
```bash
# Actualizar configuración y plugins
./scripts/update.sh
```

## 🐛 Solución de Problemas

### Problemas Comunes

1. **Plugins no se instalan:**
```bash
nvim --headless -c "Lazy! sync" -c "qall"
```

2. **LSP no funciona:**
```bash
# Verificar instalación de Mason
nvim -c "Mason"
```

3. **Telescope no encuentra archivos:**
```bash
# Instalar ripgrep y fd
sudo apt install ripgrep fd-find
```

### Logs y Diagnóstico
```bash
# Ver logs de Neovim
nvim -c "messages"

# Verificar salud de plugins
nvim -c "checkhealth"
```

## 📋 Requisitos del Sistema

- **OS:** Ubuntu 20.04+ / Debian 11+
- **Neovim:** 0.10+
- **Node.js:** 18+
- **Python:** 3.8+
- **Git:** 2.0+

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add: AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📜 Licencia

Distribuido bajo la Licencia MIT. Ver `LICENSE` para más información.

## 🙏 Agradecimientos

- [Neovim](https://neovim.io/) - El editor base
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Gestor de plugins
- [Catppuccin](https://github.com/catppuccin) - Tema de colores
- Comunidad de Neovim - Por los increíbles plugins

## 📞 Soporte

Si tienes problemas o preguntas:

1. Revisa la [documentación](docs/)
2. Busca en [Issues existentes](https://github.com/tu-usuario/neovim-config/issues)
3. Crea un [nuevo Issue](https://github.com/tu-usuario/neovim-config/issues/new)

---

**¡Hecho con ❤️ para la comunidad de desarrollo!**