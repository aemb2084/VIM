# Manual de Usuario: Neovim para Desarrollo Python

## Tabla de Contenidos

1. [Introducción](#introducción)
2. [Instalación y Configuración](#instalación-y-configuración)
3. [Funcionalidades de Python](#funcionalidades-de-python)
4. [Atajos de Teclado Esenciales](#atajos-de-teclado-esenciales)
5. [Flujo de Trabajo de Desarrollo](#flujo-de-trabajo-de-desarrollo)
6. [Plugins Específicos de Python](#plugins-específicos-de-python)
7. [Debugging y Testing](#debugging-y-testing)
8. [Gestión de Entornos Virtuales](#gestión-de-entornos-virtuales)
9. [Formateo y Linting](#formateo-y-linting)
10. [REPL Interactivo](#repl-interactivo)
11. [Cobertura de Código](#cobertura-de-código)
12. [Solución de Problemas](#solución-de-problemas)
13. [Consejos y Trucos](#consejos-y-trucos)

---

## Introducción

Esta configuración de Neovim está optimizada para el desarrollo profesional en Python, proporcionando un entorno de desarrollo integrado (IDE) completo con características modernas como LSP, autocompletado inteligente, debugging avanzado, testing integrado, y gestión de entornos virtuales.

### Características Principales

- **LSP Múltiple**: Pyright (type checking), Pylsp (funcionalidades adicionales), Ruff (linting ultrarrápido)
- **Debugging Avanzado**: Integración DAP con breakpoints, step debugging, e inspección de variables
- **Testing Framework**: Neotest con soporte pytest y descubrimiento automático de tests
- **REPL Integrado**: Iron.nvim para desarrollo Python interactivo
- **Entornos Virtuales**: Detección y cambio automático con venv-selector
- **Formateo Automático**: Ruff y Black con format-on-save
- **Documentación**: Generación automática de docstrings estilo Google
- **Gestión de Imports**: Ordenamiento automático con isort
- **Cobertura de Código**: Indicadores visuales de cobertura con nvim-coverage

---

## Instalación y Configuración

### Requisitos del Sistema

- **Sistema Operativo**: Ubuntu 20.04+ / Debian 11+
- **Neovim**: 0.10+ (optimizado para 0.12+)
- **Node.js**: 18+ (para servidores LSP)
- **Python**: 3.8+ (con pip)
- **Git**: 2.0+

### Instalación Automática

```bash
# Instalación completa de la configuración
./install.sh

# Instalación específica para desarrollo Python
./scripts/install-python-dev.sh
```

### Instalación Manual de Dependencias

```bash
# Paquetes del sistema
sudo apt update
sudo apt install build-essential cmake unzip curl ripgrep fd-find npm

# Herramientas de Python
pip install --user neovim pynvim debugpy pytest coverage ruff black isort

# Node.js (si no está instalado)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Verificación de la Instalación

```bash
# Verificar salud del sistema
nvim --headless -c "checkhealth" -c "qall"

# Sincronizar plugins
nvim --headless -c "Lazy! sync" -c "qall"

# Actualizar servidores LSP
nvim --headless -c "MasonUpdate" -c "qall"
```

---

## Funcionalidades de Python

### Servidores LSP Configurados

1. **Pyright**: Type checking y intellisense avanzado
2. **Pylsp**: Funcionalidades adicionales de Python Language Server
3. **Ruff LSP**: Linting ultrarrápido y formateo

### Características de Autocompletado

- Autocompletado inteligente basado en tipos
- Snippets integrados para patrones comunes de Python
- Documentación inline durante escritura
- Import automático de módulos
- Navegación por definiciones y referencias

### Syntax Highlighting

- Treesitter para highlighting semántico avanzado
- Soporte para f-strings, decoradores, y sintaxis moderna de Python
- Indentación automática conforme a PEP8

---

## Atajos de Teclado Esenciales

### Navegación General

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `<Space>` | Leader key | Tecla líder para comandos personalizados |
| `<leader>e` | Toggle file explorer | Alternar explorador de archivos |
| `<leader>ef` | Find file in explorer | Encontrar archivo en explorador |
| `<leader>ff` | Find files | Buscar archivos con Telescope |
| `<leader>fw` | Find word | Buscar texto en proyecto |
| `<leader>fb` | Find buffers | Buscar entre buffers abiertos |
| `<leader>fr` | Recent files | Archivos recientes |

### LSP y Código

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `gd` | Go to definition | Ir a definición |
| `gD` | Go to declaration | Ir a declaración |
| `gi` | Go to implementation | Ir a implementación |
| `gr` | Find references | Encontrar referencias |
| `K` | Hover documentation | Documentación flotante |
| `<C-k>` | Signature help | Ayuda de signatura |
| `<leader>rn` | Rename symbol | Renombrar símbolo |
| `<leader>ca` | Code actions | Acciones de código |
| `<leader>f` | Format document | Formatear documento |

### Python Específico

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `<leader>vs` | Select virtual environment | Seleccionar entorno virtual |
| `<leader>vc` | Select cached virtual environment | Seleccionar entorno virtual en caché |
| `<leader>mp` | Format Python code | Formatear código Python |
| `<leader>is` | Sort imports | Ordenar imports |
| `<leader>nf` | Generate function docstring | Generar docstring de función |
| `<leader>nc` | Generate class docstring | Generar docstring de clase |

### Testing

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `<leader>tt` | Run current test | Ejecutar test actual |
| `<leader>tf` | Run test file | Ejecutar archivo de test |
| `<leader>td` | Debug current test | Debuggear test actual |
| `<leader>ts` | Toggle test summary | Alternar resumen de tests |
| `<leader>to` | Toggle test output | Alternar salida de tests |

### Debugging

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `<leader>db` | Toggle breakpoint | Alternar breakpoint |
| `<leader>dc` | Continue debugging | Continuar debugging |
| `<leader>do` | Step over | Paso por encima |
| `<leader>di` | Step into | Paso hacia dentro |
| `<leader>dr` | Open debug REPL | Abrir REPL de debug |
| `<leader>du` | Toggle debug UI | Alternar UI de debug |

### REPL

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `<leader>rs` | Start REPL | Iniciar REPL |
| `<leader>rr` | Restart REPL | Reiniciar REPL |
| `<leader>rf` | Focus REPL | Enfocar REPL |
| `<leader>rh` | Hide REPL | Ocultar REPL |
| `<space>sc` | Send to REPL | Enviar al REPL |
| `<space>sl` | Send line | Enviar línea |
| `<space>sf` | Send file | Enviar archivo |

### Cobertura de Código

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `<leader>cc` | Load coverage | Cargar cobertura |
| `<leader>cs` | Coverage summary | Resumen de cobertura |
| `<leader>ct` | Toggle coverage | Alternar cobertura |

### Git

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `]c` | Next git hunk | Siguiente hunk de git |
| `[c` | Previous git hunk | Anterior hunk de git |
| `<leader>hs` | Stage hunk | Preparar hunk |
| `<leader>hr` | Reset hunk | Resetear hunk |
| `<leader>hp` | Preview hunk | Vista previa del hunk |
| `<leader>hb` | Blame line | Culpar línea |

### Terminal

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `<C-\>` | Toggle terminal | Alternar terminal flotante |

---

## Flujo de Trabajo de Desarrollo

### 1. Configuración Inicial del Proyecto

```bash
# Navegar al directorio del proyecto
cd mi_proyecto_python

# Crear entorno virtual
python -m venv venv
source venv/bin/activate

# Instalar dependencias
pip install -r requirements.txt

# Abrir Neovim
nvim .
```

### 2. Selección de Entorno Virtual

Una vez en Neovim:
1. Presionar `<leader>vs` para abrir el selector de entornos virtuales
2. Seleccionar el entorno virtual del proyecto
3. Verificar que el LSP reconozca las dependencias instaladas

### 3. Desarrollo de Código

1. **Navegación**: Usar `<leader>ff` para encontrar archivos
2. **Autocompletado**: Escribir código con autocompletado inteligente (`<Tab>` para aceptar)
3. **Documentación**: Presionar `K` sobre símbolos para ver documentación
4. **Refactoring**: Usar `<leader>rn` para renombrar símbolos
5. **Formateo**: El código se formatea automáticamente al guardar, o manualmente con `<leader>mp`

### 4. Testing

1. **Escribir tests**: Crear archivos `test_*.py` o `*_test.py`
2. **Ejecutar tests**: 
   - `<leader>tt` para test actual
   - `<leader>tf` para todo el archivo
3. **Debugging tests**: `<leader>td` para debuggear test específico
4. **Ver resultados**: `<leader>ts` para resumen, `<leader>to` para salida detallada

### 5. Debugging

1. **Establecer breakpoints**: `<leader>db` en líneas específicas
2. **Iniciar debugging**: `<leader>dc` para comenzar
3. **Navegación**: 
   - `<leader>do` para paso por encima
   - `<leader>di` para paso hacia dentro
4. **Inspección**: `<leader>dr` para abrir REPL de debug
5. **UI**: `<leader>du` para alternar interfaz de debugging

### 6. REPL Interactivo

1. **Iniciar**: `<leader>rs` para abrir REPL de Python
2. **Enviar código**: 
   - `<space>sl` para línea actual
   - `<space>sc` para selección
   - `<space>sf` para archivo completo
3. **Gestión**: `<leader>rr` para reiniciar, `<leader>rh` para ocultar

---

## Plugins Específicos de Python

### venv-selector.nvim
- **Propósito**: Gestión de entornos virtuales
- **Configuración**: Detecta automáticamente entornos de conda y virtualenv
- **Uso**: `<leader>vs` para seleccionar entorno

### nvim-dap-python
- **Propósito**: Debugging avanzado para Python
- **Características**: Breakpoints, step debugging, inspección de variables
- **Configuración**: Integrado con DAP UI para interfaz visual

### neotest-python
- **Propósito**: Testing framework integrado
- **Características**: Descubrimiento automático de tests, ejecución individual
- **Soporte**: pytest, unittest, nose

### iron.nvim
- **Propósito**: REPL interactivo
- **Características**: Envío de código, evaluación en tiempo real
- **Configuración**: Integrado con terminal flotante

### conform.nvim
- **Propósito**: Formateo automático
- **Formateadores**: Ruff, Black
- **Configuración**: Format-on-save habilitado

### neogen
- **Propósito**: Generación de docstrings
- **Estilo**: Google docstrings por defecto
- **Uso**: `<leader>nf` para funciones, `<leader>nc` para clases

### vim-isort
- **Propósito**: Ordenamiento de imports
- **Configuración**: Conforme a PEP8
- **Uso**: `<leader>is` para ordenar imports

### nvim-coverage
- **Propósito**: Visualización de cobertura de código
- **Características**: Indicadores visuales en el gutter
- **Integración**: Con pytest-cov y coverage.py

---

## Debugging y Testing

### Configuración de Debugging

El debugging está configurado para trabajar con debugpy:

1. **Configuración automática**: Se configura automáticamente con el entorno virtual seleccionado
2. **Breakpoints condicionales**: Clic derecho en número de línea para opciones avanzadas
3. **Variables**: Panel lateral muestra variables locales y globales
4. **Call stack**: Navegación por la pila de llamadas
5. **Console**: REPL integrado para evaluación en tiempo de ejecución

### Testing con Neotest

El framework de testing está optimizado para pytest:

```python
# Ejemplo de test que funciona con la configuración
import pytest

def test_suma():
    assert suma(2, 3) == 5

def test_division_por_cero():
    with pytest.raises(ZeroDivisionError):
        division(5, 0)

class TestCalculadora:
    def test_multiplicacion(self):
        assert multiplicar(3, 4) == 12
```

### Patrones de Testing Recomendados

1. **Estructura de directorios**:
   ```
   proyecto/
   ├── src/
   │   └── modulo.py
   ├── tests/
   │   ├── __init__.py
   │   └── test_modulo.py
   └── requirements.txt
   ```

2. **Configuración pytest.ini**:
   ```ini
   [tool:pytest]
   testpaths = tests
   python_files = test_*.py *_test.py
   python_functions = test_*
   addopts = --verbose --tb=short
   ```

---

## Gestión de Entornos Virtuales

### Detección Automática

El plugin venv-selector detecta automáticamente:
- Entornos de virtualenv en `./venv`, `./env`
- Entornos de conda
- Entornos de poetry
- Variables de entorno `$VIRTUAL_ENV`

### Configuración de Entornos

1. **Conda**: 
   ```bash
   conda create -n mi_proyecto python=3.9
   conda activate mi_proyecto
   ```

2. **Virtualenv**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/Mac
   venv\Scripts\activate     # Windows
   ```

3. **Poetry**:
   ```bash
   poetry install
   poetry shell
   ```

### Integración con LSP

Una vez seleccionado el entorno virtual:
- Pyright utiliza el intérprete correcto
- Las dependencias del proyecto están disponibles para autocompletado
- Los imports se resuelven correctamente
- El debugging usa el entorno seleccionado

---

## Formateo y Linting

### Ruff (Recomendado)

Ruff es un linter y formateador extremadamente rápido:

**Configuración en pyproject.toml**:
```toml
[tool.ruff]
line-length = 88
target-version = "py38"

[tool.ruff.lint]
select = ["E", "F", "W", "I"]
ignore = ["E501"]

[tool.ruff.format]
quote-style = "double"
indent-style = "space"
```

### Black (Alternativo)

Para proyectos que prefieren Black:

**Configuración en pyproject.toml**:
```toml
[tool.black]
line-length = 88
target-version = ['py38']
include = '\.pyi?$'
```

### Configuración de Formateo Automático

El formateo automático está habilitado por defecto:
- Se ejecuta al guardar archivos
- Se puede ejecutar manualmente con `<leader>mp`
- Respeta la configuración del proyecto

### Desactivar Formateo Automático

Para desactivar temporalmente:
```lua
vim.g.disable_autoformat = true
```

---

## REPL Interactivo

### Inicialización

El REPL de Python se configura automáticamente:
1. Detecta el entorno virtual activo
2. Carga variables de entorno del proyecto
3. Importa módulos comunes automáticamente

### Flujo de Trabajo REPL

1. **Desarrollo iterativo**:
   ```python
   # En el archivo .py
   def mi_funcion(x, y):
       return x + y
   
   # Enviar al REPL con <space>sf (archivo completo)
   # o seleccionar función y <space>sc
   ```

2. **Testing rápido**:
   ```python
   # Seleccionar y enviar con <space>sc
   mi_funcion(3, 5)  # Resultado: 8
   ```

3. **Debugging interactivo**:
   ```python
   # Importar pdb en REPL
   import pdb; pdb.set_trace()
   ```

### Comandos REPL Útiles

| Comando | Descripción |
|---------|-------------|
| `%run script.py` | Ejecutar script |
| `%load script.py` | Cargar script en REPL |
| `%time expresion` | Medir tiempo de ejecución |
| `%history` | Mostrar historial de comandos |
| `%reset` | Limpiar namespace |

---

## Cobertura de Código

### Configuración de Coverage

Instalar herramientas necesarias:
```bash
pip install coverage pytest-cov
```

### Configuración en pyproject.toml

```toml
[tool.coverage.run]
source = ["src"]
omit = ["tests/*", "setup.py"]

[tool.coverage.report]
exclude_lines = [
    "pragma: no cover",
    "def __repr__",
    "if self.debug:",
    "if settings.DEBUG",
    "raise AssertionError",
    "raise NotImplementedError",
]
```

### Uso de Cobertura

1. **Generar reporte**:
   ```bash
   pytest --cov=src tests/
   coverage html
   ```

2. **En Neovim**:
   - `<leader>cc` para cargar cobertura
   - `<leader>cs` para ver resumen
   - `<leader>ct` para alternar visualización

### Interpretación de Indicadores

- **Verde**: Líneas cubiertas por tests
- **Rojo**: Líneas no cubiertas
- **Amarillo**: Cobertura parcial (branches)

---

## Solución de Problemas

### LSP No Funciona

**Síntomas**: No hay autocompletado, diagnósticos, o navegación

**Soluciones**:
1. Verificar instalación de servidores LSP:
   ```vim
   :Mason
   ```

2. Verificar logs de LSP:
   ```vim
   :LspLog
   ```

3. Reinstalar servidores LSP:
   ```vim
   :MasonUninstall pyright
   :MasonInstall pyright
   ```

4. Verificar entorno virtual:
   ```vim
   :echo exepath('python')
   ```

### Debugging No Inicia

**Síntomas**: Breakpoints no se activan, debugging no responde

**Soluciones**:
1. Verificar instalación de debugpy:
   ```bash
   pip show debugpy
   ```

2. Verificar configuración DAP:
   ```vim
   :lua print(vim.inspect(require('dap').configurations.python))
   ```

3. Verificar entorno virtual en debug:
   ```vim
   :lua require('dap-python').setup('/path/to/python')
   ```

### Tests No Se Detectan

**Síntomas**: Neotest no encuentra tests automáticamente

**Soluciones**:
1. Verificar estructura de directorios:
   ```
   tests/
   ├── __init__.py
   └── test_*.py
   ```

2. Verificar patrones de archivos:
   ```vim
   :lua print(vim.inspect(require('neotest').config))
   ```

3. Verificar pytest instalado:
   ```bash
   which pytest
   pytest --version
   ```

### Formateo No Funciona

**Síntomas**: El código no se formatea al guardar

**Soluciones**:
1. Verificar instalación de formateadores:
   ```bash
   which ruff
   ruff --version
   ```

2. Verificar configuración:
   ```vim
   :ConformInfo
   ```

3. Formatear manualmente:
   ```vim
   :lua require('conform').format()
   ```

### REPL No Responde

**Síntomas**: El REPL no ejecuta código enviado

**Soluciones**:
1. Reiniciar REPL:
   ```vim
   <leader>rr
   ```

2. Verificar proceso Python:
   ```vim
   :lua require('iron.core').list_active_repls()
   ```

3. Verificar entorno virtual:
   ```bash
   which python
   echo $VIRTUAL_ENV
   ```

### Rendimiento Lento

**Síntomas**: Neovim responde lentamente con archivos Python grandes

**Soluciones**:
1. Desactivar Treesitter para archivos grandes:
   ```vim
   :TSBufDisable highlight
   ```

2. Ajustar configuración LSP:
   ```lua
   vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
     vim.lsp.diagnostic.on_publish_diagnostics, {
       update_in_insert = false,
     }
   )
   ```

3. Limpiar caché:
   ```bash
   rm -rf ~/.cache/nvim
   ```

---

## Consejos y Trucos

### Productividad

1. **Usa Which-Key**: Presiona `<leader>` y espera para ver opciones disponibles

2. **Navegación rápida**: Usa `gd` frecuentemente para saltar entre definiciones

3. **Búsqueda inteligente**: `<leader>fw` busca texto en todo el proyecto con contexto

4. **Buffer management**: `<leader>fb` para cambiar rápidamente entre archivos abiertos

### Debugging Avanzado

1. **Breakpoints condicionales**:
   ```vim
   :lua require('dap').set_breakpoint(vim.fn.input('Condition: '))
   ```

2. **Log points**:
   ```vim
   :lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log message: '))
   ```

3. **Remote debugging**: Configurar debugpy para debugging remoto

### Testing Eficiente

1. **Test específicos**: Usa `<leader>tt` con cursor en método específico

2. **Test con parámetros**: Usa pytest markers para categorizar tests

3. **Parallel testing**: Configura pytest-xdist para tests en paralelo

### Personalización

1. **Temas**: Cambiar tema con `<leader>fc`

2. **Keymaps personalizados**: Agregar en `~/.config/nvim/lua/config/keymaps.lua`

3. **Configuración por proyecto**: Usar `.nvim.lua` en directorio del proyecto

### Integración Git

1. **Visual diff**: Los cambios se muestran en tiempo real en el gutter

2. **Stage hunks**: `<leader>hs` para preparar cambios específicos

3. **Blame integration**: `<leader>hb` para ver quién modificó cada línea

### Optimización de Memoria

1. **Lazy loading**: Los plugins se cargan solo cuando se necesitan

2. **Cleanup automático**: Buffers inactivos se liberan automáticamente

3. **Cache inteligente**: LSP y Treesitter mantienen cache optimizado

### Workflows Avanzados

1. **Desarrollo TDD**:
   - Escribir test → `<leader>tt` → Implementar → Refactor
   
2. **Code review**:
   - Usar `gr` para encontrar todas las referencias
   - `<leader>ca` para ver acciones de código disponibles
   
3. **Profiling**:
   - Integrar con `cProfile` via REPL
   - Usar `<space>sc` para enviar código de profiling

### Comandos Útiles de Neovim

| Comando | Descripción |
|---------|-------------|
| `:checkhealth` | Verificar estado del sistema |
| `:Lazy` | Gestionar plugins |
| `:Mason` | Gestionar LSP servers |
| `:LspInfo` | Información sobre LSP activos |
| `:TSPlayground` | Explorar AST de Treesitter |

---

## Recursos Adicionales

### Documentación Oficial
- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)

### Comunidad Python
- [Python.org](https://www.python.org/)
- [PEP 8 Style Guide](https://pep8.org/)
- [pytest Documentation](https://docs.pytest.org/)

### Herramientas de Desarrollo
- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [Black Documentation](https://black.readthedocs.io/)
- [Coverage.py](https://coverage.readthedocs.io/)

---

*Este manual se actualiza regularmente. Para la versión más reciente, consulta el repositorio del proyecto.*