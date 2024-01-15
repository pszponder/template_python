# Makefile

# Variables
VENV = venv
BIN=$(VENV)/bin
PY = $(BIN)/python3
APP=src/main.py


.DEFAULT_GOAL := help


# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: confirm
confirm:
	# Throws error if not confirmed
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

.PHONY: no-dirty
no-dirty:
	# Check for uncommitted changes
	git diff --exit-code


# ==================================================================================== #
# DOCKER
# ==================================================================================== #

## dbuild: build docker compose
.PHONY: dbuild
dbuild: Dockerfile compose.yaml
	docker compose build

## up: spin up docker compose
.PHONY: up
up: build
	docker compose up

## upd: spin up docker compose (in detached mode)
.PHONY: upd
upd: build
	docker compose up -d

## logs: view logs for docker compose
.PHONY: logs
logs:
	docker logs main

## logsf: view logs for docker compose, and follow
.PHONY: logsf
logsf:
	docker logs -f main --tail 100

## down: tear down docker compose
.PHONY: down
down:
	docker compose down

## down/clean: tear down docker compose, remove images used by services, & remove named volumes
.PHONY: down/clean
down/clean:
	docker compose down -v --rmi all

# ==================================================================================== #
# DEPENDENCIES
# ==================================================================================== #

## setup: install virtual env, update pip, install / update dependencies
.PHONY: setup
setup: requirements.txt
	python3 -m venv $(VENV)
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install --upgrade -r requirements.txt
	@echo "Setup is complete, run '. ./$(BIN)/activate' to activate the virtual environment"


# ==================================================================================== #
# QUALITY CONTROL
# ==================================================================================== #

## lint: lints code using ruff linter
.PHONY: lint
lint:
	$(BIN)/ruff check .

## format: formats code using ruff formatter
.PHONY: format
format:
	$(BIN)/ruff format .

## tidy: lint & format code
.PHONY: tidy
tidy: lint format


# ==================================================================================== #
# TESTING
# ==================================================================================== #

## test: run all tests
.PHONY: test
test:
	$(BIN)/pytest


# ==================================================================================== #
# RUNNING
# ==================================================================================== #

## run: run main.py
.PHONY: run
run:
	@$(PY) $(APP)


# ==================================================================================== #
# CLEANING
# ==================================================================================== #

## clean: clean up all build artifacts & virtual environments
.PHONY: clean
clean:
	@echo "Cleaning up..."
	rm -rf $(VENV)
	rm -rf .ruff_cache
	rm -rf .pytest_cache
	find . -type f -name *.pyc -delete
	find . -type d -name __pycache__ -delete


# ==================================================================================== #
# GIT
# ==================================================================================== #

## push: push changes to the remote Git repository, after running quality control checks
.PHONY: push
push: tidy audit no-dirty
	git push
