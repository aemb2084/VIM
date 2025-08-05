-- Configuración de keymaps
local keymap = vim.keymap.set

-- Configurar leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps generales
keymap("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Salir" })
keymap("n", "<leader>x", ":x<CR>", { desc = "Guardar y salir" })

-- Navegación entre ventanas
keymap("n", "<C-h>", "<C-w>h", { desc = "Ventana izquierda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Ventana abajo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Ventana arriba" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Ventana derecha" })

-- Redimensionar ventanas
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Reducir altura" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Aumentar altura" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Reducir ancho" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Aumentar ancho" })

-- Navegación en modo insertar
keymap("i", "<C-h>", "<Left>", { desc = "Mover izquierda" })
keymap("i", "<C-j>", "<Down>", { desc = "Mover abajo" })
keymap("i", "<C-k>", "<Up>", { desc = "Mover arriba" })
keymap("i", "<C-l>", "<Right>", { desc = "Mover derecha" })

-- Mover líneas
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover línea abajo" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover línea arriba" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover selección abajo" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover selección arriba" })

-- Indentación en modo visual
keymap("v", "<", "<gv", { desc = "Indent a la izquierda" })
keymap("v", ">", ">gv", { desc = "Indent a la derecha" })

-- Mejores movimientos de página
keymap("n", "<C-d>", "<C-d>zz", { desc = "Media página abajo" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Media página arriba" })

-- Mantener búsqueda centrada
keymap("n", "n", "nzzzv", { desc = "Siguiente búsqueda" })
keymap("n", "N", "Nzzzv", { desc = "Búsqueda anterior" })

-- Limpiar resaltado de búsqueda
keymap("n", "<Esc>", ":nohlsearch<CR>", { desc = "Limpiar búsqueda" })

-- Explorador de archivos
keymap("n", "<leader>e", ":Explore<CR>", { desc = "Explorador de archivos" })

-- Terminal
keymap("n", "<leader>t", ":terminal<CR>", { desc = "Abrir terminal" })
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Salir modo terminal" })

-- Splits
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })
keymap("n", "<leader>sc", ":close<CR>", { desc = "Cerrar split" })

-- Tabs
keymap("n", "<leader>tn", ":tabnew<CR>", { desc = "Nueva tab" })
keymap("n", "<leader>tc", ":tabclose<CR>", { desc = "Cerrar tab" })
keymap("n", "<leader>tp", ":tabprevious<CR>", { desc = "Tab anterior" })
keymap("n", "<leader>tl", ":tabnext<CR>", { desc = "Siguiente tab" })