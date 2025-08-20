#!/bin/bash

# 🐍 Python Development Environment Setup Script

set -e

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

print_color() {
    echo -e "${1}${2}${NC}"
}

show_progress() {
    print_color $BLUE "📋 $1"
}

show_success() {
    print_color $GREEN "✅ $1"
}

show_error() {
    print_color $RED "❌ $1"
}

print_color $PURPLE "
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║        🐍 PYTHON DEVELOPMENT ENVIRONMENT SETUP         ║
║                                                           ║
║    Instalación de herramientas profesionales Python     ║
║    para desarrollo con Neovim                           ║
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

show_progress "Instalando herramientas de desarrollo Python..."

# 1. Instalar Python y pip
show_progress "Instalando Python 3 y herramientas básicas..."
sudo apt update
sudo apt install -y python3 python3-pip python3-venv python3-dev

# 2. Instalar pipx para herramientas globales
show_progress "Instalando pipx..."
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# 3. Instalar herramientas de desarrollo con pipx
show_progress "Instalando herramientas de desarrollo Python..."
~/.local/bin/pipx install ruff
~/.local/bin/pipx install black
~/.local/bin/pipx install isort
~/.local/bin/pipx install mypy
~/.local/bin/pipx install pytest
~/.local/bin/pipx install coverage
~/.local/bin/pipx install pylint
~/.local/bin/pipx install flake8
~/.local/bin/pipx install bandit
~/.local/bin/pipx install autopep8
~/.local/bin/pipx install pydocstyle

# 4. Instalar poetry para gestión de dependencias
show_progress "Instalando Poetry..."
curl -sSL https://install.python-poetry.org | python3 -

# 5. Instalar pyenv para gestión de versiones Python
show_progress "Instalando pyenv..."
curl https://pyenv.run | bash

# 6. Configurar variables de entorno
show_progress "Configurando variables de entorno..."
{
    echo ""
    echo "# Python Development Tools"
    echo 'export PATH="$HOME/.local/bin:$PATH"'
    echo 'export PATH="$HOME/.poetry/bin:$PATH"'
    echo 'export PYENV_ROOT="$HOME/.pyenv"'
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"'
    echo 'eval "$(pyenv init --path)"'
    echo 'eval "$(pyenv init -)"'
    echo 'eval "$(pyenv virtualenv-init -)"'
} >> ~/.bashrc

# 7. Crear estructura de proyectos Python
show_progress "Creando estructura de proyectos..."
mkdir -p ~/python-projects/{scripts,web,data-science,automation}

# 8. Crear archivo de configuración para pytest
show_progress "Creando configuración de pytest..."
cat > ~/python-projects/pytest.ini << 'EOF'
[tool:pytest]
testpaths = tests
python_files = test_*.py *_test.py
python_classes = Test*
python_functions = test_*
addopts = 
    --verbose
    --tb=short
    --strict-markers
    --disable-warnings
    --cov=.
    --cov-report=term-missing
    --cov-report=html
markers =
    slow: marks tests as slow
    integration: marks tests as integration tests
    unit: marks tests as unit tests
EOF

# 9. Crear archivo de configuración para coverage
show_progress "Creando configuración de coverage..."
cat > ~/python-projects/.coveragerc << 'EOF'
[run]
source = .
omit = 
    */tests/*
    */test_*
    */venv/*
    */.venv/*
    */site-packages/*
    */__pycache__/*

[report]
exclude_lines =
    pragma: no cover
    def __repr__
    if self.debug:
    if settings.DEBUG
    raise AssertionError
    raise NotImplementedError
    if 0:
    if __name__ == .__main__.:
    class .*\bProtocol\):
    @(abc\.)?abstractmethod
EOF

# 10. Crear archivo de configuración para ruff
show_progress "Creando configuración de Ruff..."
cat > ~/python-projects/ruff.toml << 'EOF'
target-version = "py38"
line-length = 88
select = [
    "E",  # pycodestyle errors
    "W",  # pycodestyle warnings
    "F",  # pyflakes
    "I",  # isort
    "B",  # flake8-bugbear
    "C4", # flake8-comprehensions
    "UP", # pyupgrade
]
ignore = [
    "E501",  # line too long, handled by black
    "B008",  # do not perform function calls in argument defaults
    "C901",  # too complex
]

[per-file-ignores]
"__init__.py" = ["F401"]
"test_*.py" = ["B011"]

[mccabe]
max-complexity = 10

[isort]
known-first-party = ["myapp"]
EOF

# 11. Crear proyecto ejemplo
show_progress "Creando proyecto ejemplo..."
mkdir -p ~/python-projects/ejemplo-proyecto/{src,tests,docs}

cat > ~/python-projects/ejemplo-proyecto/pyproject.toml << 'EOF'
[tool.poetry]
name = "ejemplo-proyecto"
version = "0.1.0"
description = "Proyecto ejemplo para desarrollo con Neovim"
authors = ["Tu Nombre <tu.email@ejemplo.com>"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.8"
requests = "^2.31.0"
pydantic = "^2.0.0"

[tool.poetry.group.dev.dependencies]
pytest = "^7.4.0"
pytest-cov = "^4.1.0"
black = "^23.7.0"
ruff = "^0.0.285"
mypy = "^1.5.0"

[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"

[tool.ruff]
target-version = "py38"
line-length = 88

[tool.black]
line-length = 88
target-version = ["py38"]

[tool.mypy]
python_version = "3.8"
warn_return_any = true
warn_unused_configs = true
disallow_untyped_defs = true

[tool.pytest.ini_options]
testpaths = ["tests"]
addopts = "--cov=src --cov-report=term-missing"
EOF

cat > ~/python-projects/ejemplo-proyecto/src/__init__.py << 'EOF'
"""Módulo ejemplo para desarrollo Python."""
EOF

cat > ~/python-projects/ejemplo-proyecto/src/main.py << 'EOF'
"""Módulo principal del proyecto ejemplo."""

from typing import List


def saludar(nombre: str) -> str:
    """
    Saluda a una persona por su nombre.
    
    Args:
        nombre: El nombre de la persona a saludar.
        
    Returns:
        Un mensaje de saludo personalizado.
    """
    return f"¡Hola, {nombre}!"


def calcular_suma(numeros: List[int]) -> int:
    """
    Calcula la suma de una lista de números.
    
    Args:
        numeros: Lista de números enteros.
        
    Returns:
        La suma de todos los números.
    """
    return sum(numeros)


def main() -> None:
    """Función principal del programa."""
    print(saludar("Desarrollador Python"))
    print(f"La suma de [1, 2, 3, 4, 5] es: {calcular_suma([1, 2, 3, 4, 5])}")


if __name__ == "__main__":
    main()
EOF

cat > ~/python-projects/ejemplo-proyecto/tests/__init__.py << 'EOF'
"""Tests para el proyecto ejemplo."""
EOF

cat > ~/python-projects/ejemplo-proyecto/tests/test_main.py << 'EOF'
"""Tests para el módulo main."""

import pytest
from src.main import saludar, calcular_suma


def test_saludar():
    """Test para la función saludar."""
    assert saludar("Juan") == "¡Hola, Juan!"
    assert saludar("María") == "¡Hola, María!"


def test_calcular_suma():
    """Test para la función calcular_suma."""
    assert calcular_suma([1, 2, 3]) == 6
    assert calcular_suma([]) == 0
    assert calcular_suma([10]) == 10


def test_calcular_suma_negativos():
    """Test para números negativos."""
    assert calcular_suma([-1, -2, -3]) == -6
    assert calcular_suma([1, -1, 2, -2]) == 0
EOF

cat > ~/python-projects/ejemplo-proyecto/README.md << 'EOF'
# Proyecto Ejemplo Python

Este es un proyecto ejemplo configurado para desarrollo profesional con Neovim.

## Características

- ✅ Configuración con Poetry
- ✅ Tests con pytest
- ✅ Linting con Ruff
- ✅ Formateo con Black
- ✅ Type checking con MyPy
- ✅ Coverage reports

## Comandos útiles

```bash
# Instalar dependencias
poetry install

# Ejecutar tests
poetry run pytest

# Ejecutar linting
poetry run ruff check .

# Formatear código
poetry run black .

# Type checking
poetry run mypy src/

# Coverage
poetry run pytest --cov=src
```

## Desarrollo con Neovim

### Keymaps principales:

- `<leader>vs` - Seleccionar virtual environment
- `<leader>tt` - Ejecutar test actual
- `<leader>tf` - Ejecutar tests del archivo
- `<leader>td` - Debug test actual
- `<leader>db` - Toggle breakpoint
- `<leader>rs` - Iniciar REPL
- `<leader>mp` - Formatear código
- `<leader>nf` - Generar docstring de función
- `<leader>cc` - Cargar coverage
EOF

show_success "¡Configuración de Python completada exitosamente!"

print_color $CYAN "
╔═══════════════════════════════════════════════════════════╗
║                    ✨ INSTALACIÓN COMPLETA ✨           ║
╠═══════════════════════════════════════════════════════════╣
║                                                           ║
║  🎉 Entorno de desarrollo Python configurado:            ║
║                                                           ║
║  📦 Herramientas instaladas:                             ║
║     • Ruff (linting y formateo ultra-rápido)             ║
║     • Black (formateo de código)                         ║
║     • Pytest (testing framework)                         ║
║     • Coverage (cobertura de código)                     ║
║     • MyPy (type checking)                               ║
║     • Poetry (gestión de dependencias)                   ║
║     • Pyenv (gestión de versiones Python)               ║
║                                                           ║
║  📁 Proyecto ejemplo creado en:                          ║
║     ~/python-projects/ejemplo-proyecto/                  ║
║                                                           ║
║  🚀 Para comenzar:                                       ║
║     1. Reinicia tu terminal                              ║
║     2. cd ~/python-projects/ejemplo-proyecto             ║
║     3. poetry install                                    ║
║     4. nvim src/main.py                                  ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
"

echo ""
show_progress "Información adicional:"
echo "• Configuraciones creadas en ~/python-projects/"
echo "• Variables de entorno agregadas a ~/.bashrc"
echo "• Reinicia tu terminal para aplicar los cambios"
echo "• Usa 'poetry install' en el proyecto ejemplo"
echo ""
show_success "¡Tu entorno Python está listo para desarrollo profesional!"