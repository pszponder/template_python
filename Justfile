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
run:
	$PY src/main.py


# ================================================
# Packages
# ================================================

# Update requirements.txt file
update:
	uv pip freeze > requirements.txt

# Add package to project
add package:
	uv pip install {{package}}
	uv pip freeze > requirements.txt

# Remove package from project
remove package:
	uv pip uninstall {{package}}
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