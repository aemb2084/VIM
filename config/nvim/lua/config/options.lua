-- Opciones básicas de Neovim
local opt = vim.opt

-- Configuración de UI
opt.number = true          -- Mostrar números de línea
opt.relativenumber = true  -- Números relativos
opt.cursorline = true      -- Resaltar línea actual
opt.wrap = false           -- No envolver líneas
opt.scrolloff = 8          -- Mantener 8 líneas visibles arriba/abajo
opt.sidescrolloff = 8      -- Mantener 8 columnas visibles izq/der

-- Configuración de indentación
opt.tabstop = 4            -- Espacios por tab
opt.softtabstop = 4        -- Espacios al presionar tab
opt.shiftwidth = 4         -- Espacios para autoindent
opt.expandtab = true       -- Usar espacios en lugar de tabs
opt.autoindent = true      -- Mantener indentación
opt.smartindent = true     -- Indentación inteligente

-- Configuración de búsqueda
opt.hlsearch = false       -- No resaltar búsquedas permanentemente
opt.incsearch = true       -- Búsqueda incremental
opt.ignorecase = true      -- Ignorar mayúsculas en búsqueda
opt.smartcase = true       -- Caso inteligente en búsqueda

-- Configuración de archivos
opt.swapfile = false       -- No crear archivos swap
opt.backup = false         -- No crear backups
opt.undofile = true        -- Mantener historial de deshacer
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Configuración de colores
opt.termguicolors = true   -- Soporte para colores 24-bit
opt.background = "dark"    -- Fondo oscuro

-- Configuración de ventana
opt.splitbelow = true      -- Split horizontal hacia abajo
opt.splitright = true      -- Split vertical hacia la derecha

-- Configuración de mouse y clipboard
opt.mouse = "a"            -- Habilitar mouse
opt.clipboard = "unnamedplus" -- Usar clipboard del sistema

-- Configuración de tiempo
opt.updatetime = 250       -- Tiempo de actualización más rápido
opt.timeoutlen = 300       -- Tiempo para secuencias de teclas

-- Configuración de completado
opt.completeopt = "menuone,noselect"

-- Mostrar caracteres invisibles
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }