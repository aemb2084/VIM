# 🎯 Guía Completa de Keymaps

Una referencia completa de todos los atajos de teclado configurados en esta configuración de Neovim.

## 🔑 Keymap Principal

**Leader Key: `<Space>`** - Todas las combinaciones comienzan con la barra espaciadora.

## 📁 Explorador de Archivos (nvim-tree)

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `<Space>e` | Normal | Toggle explorador de archivos |
| `<Space>ef` | Normal | Encontrar archivo actual en explorador |

### Dentro del Explorador:
| Keymap | Descripción |
|--------|-------------|
| `Enter` | Abrir archivo/directorio |
| `o` | Abrir archivo/directorio |
| `a` | Crear nuevo archivo |
| `A` | Crear nuevo directorio |
| `r` | Renombrar archivo/directorio |
| `d` | Eliminar archivo/directorio |
| `x` | Cortar archivo/directorio |
| `c` | Copiar archivo/directorio |
| `p` | Pegar archivo/directorio |
| `y` | Copiar nombre del archivo |
| `Y` | Copiar ruta relativa |
| `gy` | Copiar ruta absoluta |
| `R` | Refrescar explorador |
| `H` | Toggle archivos ocultos |
| `q` | Cerrar explorador |

## 🔍 Búsqueda (Telescope)

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `<Space>ff` | Normal | Buscar archivos |
| `<Space>fw` | Normal | Buscar palabras (live grep) |
| `<Space>fb` | Normal | Buscar buffers abiertos |
| `<Space>fh` | Normal | Buscar en ayuda |
| `<Space>fr` | Normal | Archivos recientes |
| `<Space>fc` | Normal | Cambiar esquema de colores |

### Dentro de Telescope:
| Keymap | Descripción |
|--------|-------------|
| `Ctrl+n` | Siguiente resultado |
| `Ctrl+p` | Resultado anterior |
| `Ctrl+c` | Cerrar Telescope |
| `Ctrl+u` | Scroll preview up |
| `Ctrl+d` | Scroll preview down |
| `Tab` | Toggle selección |
| `Ctrl+q` | Enviar a quickfix |

## 🧠 LSP (Language Server Protocol)

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `gd` | Normal | Ir a definición |
| `gD` | Normal | Ir a declaración |
| `gi` | Normal | Ir a implementación |
| `gr` | Normal | Mostrar referencias |
| `K` | Normal | Mostrar documentación/hover |
| `Ctrl+k` | Normal | Mostrar ayuda de función |
| `<Space>rn` | Normal | Renombrar símbolo |
| `<Space>ca` | Normal | Acciones de código |
| `<Space>f` | Normal | Formatear código |

### Diagnósticos:
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `[d` | Normal | Diagnóstico anterior |
| `]d` | Normal | Siguiente diagnóstico |
| `<Space>e` | Normal | Mostrar diagnóstico en línea |
| `<Space>q` | Normal | Lista de diagnósticos |

## 📝 Autocompletado (nvim-cmp)

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `Tab` | Insert | Siguiente sugerencia / Expandir snippet |
| `Shift+Tab` | Insert | Sugerencia anterior |
| `Enter` | Insert | Confirmar selección |
| `Ctrl+Space` | Insert | Activar autocompletado |
| `Ctrl+e` | Insert | Cancelar autocompletado |
| `Ctrl+b` | Insert | Scroll documentación arriba |
| `Ctrl+f` | Insert | Scroll documentación abajo |

## 🐙 Git (Gitsigns)

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `]c` | Normal | Siguiente hunk (cambio) |
| `[c` | Normal | Hunk anterior |
| `<Space>hs` | Normal | Stage hunk |
| `<Space>hr` | Normal | Reset hunk |
| `<Space>hS` | Normal | Stage buffer completo |
| `<Space>hu` | Normal | Undo stage hunk |
| `<Space>hR` | Normal | Reset buffer completo |
| `<Space>hp` | Normal | Preview hunk |
| `<Space>hb` | Normal | Blame línea |
| `<Space>hB` | Normal | Blame línea completo |
| `<Space>hd` | Normal | Diff contra index |
| `<Space>hD` | Normal | Diff contra HEAD |

### Modo Visual (Gitsigns):
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `<Space>hs` | Visual | Stage selección |
| `<Space>hr` | Visual | Reset selección |

## 💬 Comentarios (Comment.nvim)

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `gcc` | Normal | Comentar/descomentar línea |
| `gbc` | Normal | Comentar/descomentar bloque |
| `gc` | Visual | Comentar/descomentar selección |
| `gb` | Visual | Comentar/descomentar bloque |

### Operadores:
| Keymap | Descripción |
|--------|-------------|
| `gc + motion` | Comentar con movimiento |
| `gb + motion` | Comentar bloque con movimiento |

## 🖥️ Terminal (ToggleTerm)

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `Ctrl+\` | Normal/Insert | Toggle terminal flotante |
| `Escape` | Terminal | Salir modo terminal |

## 🚀 Navegación Rápida (Leap)

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `s` | Normal | Salto hacia adelante |
| `S` | Normal | Salto hacia atrás |
| `gs` | Normal | Salto a ventana |

### Uso de Leap:
1. Presiona `s`
2. Escribe 2 caracteres del destino
3. Presiona la etiqueta que aparece

## 🖼️ Ventanas y Splits

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `Ctrl+h` | Normal | Ventana izquierda |
| `Ctrl+j` | Normal | Ventana abajo |
| `Ctrl+k` | Normal | Ventana arriba |
| `Ctrl+l` | Normal | Ventana derecha |
| `<Space>sv` | Normal | Split vertical |
| `<Space>sh` | Normal | Split horizontal |
| `<Space>sc` | Normal | Cerrar split actual |
| `<Space>so` | Normal | Cerrar otros splits |

### Redimensionar Ventanas:
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `Ctrl+Up` | Normal | Reducir altura |
| `Ctrl+Down` | Normal | Aumentar altura |
| `Ctrl+Left` | Normal | Reducir ancho |
| `Ctrl+Right` | Normal | Aumentar ancho |

## 📑 Tabs

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `<Space>tn` | Normal | Nueva tab |
| `<Space>tc` | Normal | Cerrar tab |
| `<Space>tp` | Normal | Tab anterior |
| `<Space>tl` | Normal | Siguiente tab |
| `<Space>to` | Normal | Cerrar otras tabs |

## 📝 Edición Avanzada

### Mover Líneas:
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `Alt+j` | Normal | Mover línea abajo |
| `Alt+k` | Normal | Mover línea arriba |
| `Alt+j` | Visual | Mover selección abajo |
| `Alt+k` | Visual | Mover selección arriba |

### Indentación:
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `>` | Visual | Indentar derecha |
| `<` | Visual | Indentar izquierda |
| `>>` | Normal | Indentar línea derecha |
| `<<` | Normal | Indentar línea izquierda |

### Selección Incremental (Treesitter):
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `Ctrl+Space` | Normal/Visual | Iniciar/expandir selección |
| `Ctrl+s` | Visual | Expandir scope |
| `Ctrl+Backspace` | Visual | Reducir selección |

## 🔧 Utilidades

### Guardar y Salir:
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `<Space>w` | Normal | Guardar archivo |
| `<Space>q` | Normal | Salir |
| `<Space>x` | Normal | Guardar y salir |
| `<Space>Q` | Normal | Salir sin guardar |

### Búsqueda en Archivo:
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `/` | Normal | Buscar hacia adelante |
| `?` | Normal | Buscar hacia atrás |
| `n` | Normal | Siguiente resultado |
| `N` | Normal | Resultado anterior |
| `*` | Normal | Buscar palabra bajo cursor |
| `#` | Normal | Buscar palabra bajo cursor (atrás) |

### Navegación:
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `gg` | Normal | Ir al inicio del archivo |
| `G` | Normal | Ir al final del archivo |
| `0` | Normal | Inicio de línea |
| `$` | Normal | Final de línea |
| `^` | Normal | Primer carácter no blanco |
| `w` | Normal | Siguiente palabra |
| `b` | Normal | Palabra anterior |
| `e` | Normal | Final de palabra |

### Edición Básica:
| Keymap | Modo | Descripción |
|--------|------|-------------|
| `i` | Normal | Insertar antes del cursor |
| `a` | Normal | Insertar después del cursor |
| `I` | Normal | Insertar al inicio de línea |
| `A` | Normal | Insertar al final de línea |
| `o` | Normal | Nueva línea abajo |
| `O` | Normal | Nueva línea arriba |
| `x` | Normal | Eliminar carácter |
| `dd` | Normal | Eliminar línea |
| `yy` | Normal | Copiar línea |
| `p` | Normal | Pegar después |
| `P` | Normal | Pegar antes |
| `u` | Normal | Deshacer |
| `Ctrl+r` | Normal | Rehacer |

## 🆘 Ayuda y Información

| Keymap | Modo | Descripción |
|--------|------|-------------|
| `<Space>h` | Normal | Mostrar which-key |
| `:help` | Command | Ayuda de Neovim |
| `:checkhealth` | Command | Verificar salud del sistema |
| `:Lazy` | Command | Gestionar plugins |
| `:Mason` | Command | Gestionar LSP servers |

## 💡 Consejos

1. **Which-key**: Presiona `<Space>` y espera para ver todas las opciones disponibles
2. **Telescope**: Usa `Ctrl+n/p` para navegar rápidamente en los resultados
3. **LSP**: Usa `K` dos veces para entrar en la ventana de documentación
4. **Terminal**: `Ctrl+\` dos veces para maximizar/restaurar el terminal
5. **Git**: Los hunks se muestran en la columna izquierda con símbolos `+`, `~`, `-`

¿Necesitas personalizar algún keymap? Edita `~/.config/nvim/lua/config/keymaps.lua`!