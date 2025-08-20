# 🐍 Guía de Desarrollo Python Profesional

Una guía completa para desarrollo Python profesional usando este entorno Neovim configurado.

## 🚀 Configuración Inicial

### 1. Instalación del Entorno Python
```bash
# Ejecutar script de configuración automática
./scripts/install-python-dev.sh
```

Este script instala:
- **Ruff** - Linting y formateo ultra-rápido
- **Black** - Formateo de código estándar
- **Pytest** - Framework de testing
- **Coverage** - Cobertura de código
- **MyPy** - Type checking estático
- **Poetry** - Gestión de dependencias
- **Pyenv** - Gestión de versiones Python
- **Proyecto ejemplo** completo

### 2. Configuración de Neovim
```bash
# Instalar/actualizar plugins Python
nvim --headless -c "Lazy! sync" -c "qall"
nvim --headless -c "MasonUpdate" -c "qall"
```

## 🛠️ Herramientas Incluidas

### LSP Servers
- **Pyright** - Type checking e IntelliSense avanzado
- **Pylsp** - Python Language Server con funciones adicionales
- **Ruff LSP** - Linting súper rápido y formateo

### Plugins de Desarrollo
- **venv-selector** - Gestión de entornos virtuales
- **nvim-dap** - Debugging avanzado con breakpoints
- **neotest** - Testing integrado con pytest
- **iron.nvim** - REPL interactivo
- **conform.nvim** - Formateo automático
- **neogen** - Generación de docstrings
- **nvim-coverage** - Visualización de cobertura

## 🎯 Flujo de Trabajo

### 1. Crear Nuevo Proyecto
```bash
cd ~/python-projects
mkdir mi-proyecto && cd mi-proyecto
poetry init
poetry add requests pydantic
poetry add --group dev pytest pytest-cov black ruff mypy
```

### 2. Configurar Entorno en Neovim
```vim
" Abrir proyecto
:cd ~/python-projects/mi-proyecto

" Seleccionar entorno virtual
<leader>vs

" Verificar LSP
:LspInfo
```

### 3. Desarrollo con Testing
```python
# src/main.py
def calcular_factorial(n: int) -> int:
    """Calcula el factorial de un número."""
    if n < 0:
        raise ValueError("No se puede calcular factorial de números negativos")
    if n <= 1:
        return 1
    return n * calcular_factorial(n - 1)
```

```python
# tests/test_main.py
import pytest
from src.main import calcular_factorial

def test_factorial_positivo():
    assert calcular_factorial(5) == 120
    assert calcular_factorial(0) == 1

def test_factorial_negativo():
    with pytest.raises(ValueError):
        calcular_factorial(-1)
```

### 4. Keymaps de Desarrollo

#### Testing
| Keymap | Descripción |
|--------|-------------|
| `<leader>tt` | Ejecutar test actual |
| `<leader>tf` | Ejecutar tests del archivo |
| `<leader>td` | Debug test actual |
| `<leader>ts` | Toggle resumen de tests |
| `<leader>to` | Toggle output de tests |

#### Debugging
| Keymap | Descripción |
|--------|-------------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continuar debugging |
| `<leader>do` | Step over |
| `<leader>di` | Step into |
| `<leader>dr` | Abrir REPL de debug |
| `<leader>du` | Toggle UI de debug |

#### REPL
| Keymap | Descripción |
|--------|-------------|
| `<leader>rs` | Iniciar REPL |
| `<leader>rr` | Reiniciar REPL |
| `<leader>rf` | Enfocar REPL |
| `<leader>rh` | Ocultar REPL |
| `<leader>sc` | Enviar código al REPL |
| `<leader>sl` | Enviar línea al REPL |
| `<leader>sf` | Enviar archivo al REPL |

#### Formateo y Documentación
| Keymap | Descripción |
|--------|-------------|
| `<leader>mp` | Formatear código |
| `<leader>nf` | Generar docstring de función |
| `<leader>nc` | Generar docstring de clase |
| `<leader>is` | Ordenar imports |

#### Coverage
| Keymap | Descripción |
|--------|-------------|
| `<leader>cc` | Cargar coverage |
| `<leader>cs` | Resumen de coverage |
| `<leader>ct` | Toggle coverage |

#### Entornos Virtuales
| Keymap | Descripción |
|--------|-------------|
| `<leader>vs` | Seleccionar entorno virtual |
| `<leader>vc` | Seleccionar entorno cached |

## 📋 Ejemplo de Sesión de Desarrollo

### 1. Abrir Proyecto
```bash
cd ~/python-projects/ejemplo-proyecto
nvim src/main.py
```

### 2. Seleccionar Entorno Virtual
```vim
<leader>vs
" Seleccionar el entorno del proyecto
```

### 3. Desarrollar con LSP
- **Autocompletado**: Tab para aceptar sugerencias
- **Documentación**: `K` para ver documentación
- **Ir a definición**: `gd`
- **Buscar referencias**: `gr`
- **Renombrar**: `<leader>rn`
- **Acciones de código**: `<leader>ca`

### 4. Generar Documentación
```vim
" Posicionar cursor en función y ejecutar:
<leader>nf
```

Resultado:
```python
def mi_funcion(param1: str, param2: int) -> bool:
    """
    Brief description of the function.

    Args:
        param1: Description of param1.
        param2: Description of param2.

    Returns:
        Description of return value.
    """
    pass
```

### 5. Ejecutar Tests
```vim
" Ejecutar test actual
<leader>tt

" Ejecutar todos los tests del archivo
<leader>tf

" Ver resumen de tests
<leader>ts
```

### 6. Debugging
```vim
" Establecer breakpoint en línea actual
<leader>db

" Ejecutar test en modo debug
<leader>td

" Iniciar debugging normal
<leader>dc
```

### 7. REPL Interactivo
```vim
" Iniciar REPL
<leader>rs

" Enviar línea actual al REPL
<leader>sl

" Enviar selección visual al REPL
V (seleccionar) <leader>sc
```

### 8. Formateo y Calidad
```vim
" Formatear archivo completo
<leader>mp

" Ordenar imports
<leader>is

" Ver coverage
<leader>cc
```

## 🔧 Configuraciones Avanzadas

### 1. Configuración de pytest
```ini
# pytest.ini
[tool:pytest]
testpaths = tests
python_files = test_*.py *_test.py
addopts = 
    --verbose
    --tb=short
    --cov=src
    --cov-report=term-missing
    --cov-report=html
```

### 2. Configuración de Ruff
```toml
# ruff.toml
target-version = "py38"
line-length = 88
select = ["E", "W", "F", "I", "B", "C4", "UP"]
ignore = ["E501"]

[per-file-ignores]
"__init__.py" = ["F401"]
"test_*.py" = ["B011"]
```

### 3. Configuración de Poetry
```toml
# pyproject.toml
[tool.poetry]
name = "mi-proyecto"
version = "0.1.0"
description = ""
authors = ["Tu Nombre <email@ejemplo.com>"]

[tool.poetry.dependencies]
python = "^3.8"

[tool.poetry.group.dev.dependencies]
pytest = "^7.4.0"
pytest-cov = "^4.1.0"
ruff = "^0.0.285"
black = "^23.7.0"
mypy = "^1.5.0"
```

## 🐛 Troubleshooting

### LSP No Funciona
```vim
:LspInfo
:Mason
" Verificar que pyright, pylsp, ruff_lsp están instalados
```

### Entorno Virtual No Detectado
```vim
<leader>vs
" Seleccionar manualmente el entorno
```

### Tests No Se Ejecutan
```bash
# Verificar pytest instalado
poetry run pytest --version

# Verificar estructura de tests
ls tests/test_*.py
```

### Formateo No Funciona
```bash
# Verificar ruff instalado
which ruff
ruff --version
```

## 📚 Recursos Adicionales

### Comandos Poetry Útiles
```bash
poetry install              # Instalar dependencias
poetry add requests         # Agregar dependencia
poetry add --group dev pytest  # Agregar dependencia de desarrollo
poetry remove requests      # Remover dependencia
poetry show                 # Mostrar dependencias
poetry shell               # Activar entorno virtual
```

### Comandos de Testing
```bash
poetry run pytest                    # Ejecutar todos los tests
poetry run pytest tests/test_main.py # Ejecutar archivo específico
poetry run pytest -k "test_suma"     # Ejecutar tests que coincidan
poetry run pytest --cov=src          # Con coverage
poetry run pytest -v                 # Verbose
poetry run pytest --pdb              # Entrar en debugger en fallos
```

### Comandos de Calidad de Código
```bash
poetry run ruff check .              # Linting
poetry run ruff format .             # Formateo
poetry run black .                   # Formateo alternativo
poetry run mypy src/                 # Type checking
poetry run isort .                   # Ordenar imports
```

¡Con esta configuración tienes un entorno de desarrollo Python profesional completamente integrado en Neovim!