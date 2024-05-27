# =====================================================
# justfile: makefile like build script / Command Runner
# =====================================================
# REQUIRES: cargo install just or brew install just
# PLATFORMS: macOS, Linux, Windows, ...
# USAGE:
#   just --list
#   just <TARGET>
#   just <TARGET> <PARAM_VALUE1> ...
#
# SEE ALSO:
#   * https://github.com/casey/just
# =====================================================

# ================================================
# VARIABLES
# ================================================
PROJECT_NAME := "python-proj"
BIN := ".venv/bin"
PY := ".venv/bin/python3"

# ================================================
# HELPERS
# ================================================

# load .env file
set dotenv-load
set export := true

@_default:
	just --list

# ================================================
# Startup
# ================================================

# Create virtual environment & install dependencies
init:
	uv venv
	uv pip install -r requirements.txt
	@echo "Activate virtual env with \n source .venv/bin/activate"


# ================================================
# RUNNING
# ================================================

# Run main.py
start:
	$PY src/main.py

alias run := start

# Run scratch.py (if it does not exist, create a new scratch.py file)
scratch:
	@if [ ! -f src/scratch.py ]; then echo 'print("Running scratch file...")' > src/scratch.py; fi
	$PY src/scratch.py


# ================================================
# Packages
# ================================================

# Update requirements.txt file
update:
	uv pip freeze > requirements.txt

# Upgrade all package dependencies to newest available version in requirements.txt
upgrade:
	# modify version specifiers in requirements.txt to >=
	@just {{ if os() == "darwin" { "modify-darwin" } else { "modify-linux" } }}

	# Upgrade installed packages to latest versions
	uv pip install -U -r requirements.txt

	# Update requirements.txt to use compatible version specifiers (~=)
	uv pip freeze | sed 's/==/~=/' > requirements.txt

modify-darwin:
	sed -i '' 's/[~=]=/>=/' requirements.txt

modify-linux:
	sed -i 's/[~=]=/>=/' requirements.txt

# Add one or more packages to the project
add +packages:
	uv pip install {{packages}}
	uv pip freeze > requirements.txt

# Remove one or more packages from the project
remove +packages:
	uv pip uninstall {{packages}}
	uv pip freeze > requirements.txt

# ================================================
# QUALITY CONTROL
# ================================================

# Lints code using ruff linter
lint:
	$BIN/ruff check

# Formats code using ruff formatter
format:
	$BIN/ruff format

# Lint & format code
tidy: lint format


# ================================================
# TESTING
# ================================================

# Run all tests
test:
	$BIN/pytest


# ================================================
# CLEANING
# ================================================

# Clean up all artifacts
clean:
	@echo "Cleaning up..."
	rm -rf .ruff_cache
	rm -rf .pytest_cache
	find . -type f -name *.pyc -delete
	find . -type d -name __pycache__ -delete


# ================================================
# DOCKER
# ================================================

# Build docker image from Dockerfile
dbuild:
	docker build -t $PROJECT_NAME .

# Spin up docker compose service
up:
	docker compose up --build

# Spin up docker compose service as a detatched service
upd:
	docker compose up -d --build

# view logs for docker compose
logs:
	docker compose logs

# View logs for docker compose, and follow
logsf:
	docker compose logs -f app --tail 100

# Tear down docker compose
down:
	docker compose down

# Tear down docker compose, remove images used by services, & remove named volumes
downall:
	docker compose down -v --rmi all --remove-orphans