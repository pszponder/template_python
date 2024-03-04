# Makefile

# Variables
VENV = .venv
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

## up: spin up docker compose service
.PHONY: up
up: Dockerfile docker-compose.yaml
	docker compose up

## upd: spin up docker compose service as a detatched service
.PHONY: upd
upd: Dockerfile docker-compose.yaml
	docker compose up -d

## logs: view logs for docker compose
.PHONY: logs
logs:
	docker compose logs

## logsf: view logs for docker compose, and follow
.PHONY: logsf
logsf:
	docker compose logs -f main --tail 100

## down: tear down docker compose
.PHONY: down
down:
	docker compose down

## down/clean: tear down docker compose, remove images used by services, & remove named volumes
.PHONY: down/clean
down/clean:
	docker compose down -v --rmi all --remove-orphans


# ==================================================================================== #
# QUALITY CONTROL
# ==================================================================================== #

## lint: lints code using ruff linter
.PHONY: lint
lint:
	$(BIN)/ruff check

## format: formats code using ruff formatter
.PHONY: format
format:
	$(BIN)/ruff format

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

## clean: clean up all artifacts
.PHONY: clean
clean:
	@echo "Cleaning up..."
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
