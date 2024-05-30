# Python Project Template

This is a template for the start of a Python Project

## Prerequisites

- [uv - Extremely fast Python package installer and resolver written in rust](https://github.com/astral-sh/uv)
- [just (make alternative)](https://github.com/casey/just)


## Cloning the Repository

```bash
# Clone the repo
git clone --depth 1 git@github.com:pszponder/template_python.git

# Navigate to project and remove existing git dirs
cd <repo_name>
rm -rf .git

# Initialize a new Git repo
git init

# Add and commit Files
git add .
git commit -m "Initial commit"
```

## Quick Start

```bash
# Create new .venv and install requirements
just init

# Activate virtual environment
source .venv/bin/activate
```

## Usage

### Create new virtual environment

```bash
# Create Virtual Environment
uv venv
```

### Activate Virtual Environment

**NOTE:** Upon first activation of virtual environment, make sure to install dependencies from `requirements.txt`

```bash
# Activate Virtual Environment
source .venv/bin/activate
```

### Install / Remove python dependencies

```bash
# Install from requirements.txt file
uv pip install -r requirements.txt

# Install a package
uv pip install <package_name> [<pkg2>, <pkg3>, ...]

# Uninstall a package
uv pip uninstall <package_name> [<pkg2>, <pkg3>, ...]
```

```bash
# Update requirements.txt
uv pip freeze > requirements.txt
```

### Running the Main Application

```bash
python src/main.py
```

### Deactivate Virtual Environment

```bash
deactivate
```

### Using Docker

```bash
# Build an image using docker build
docker build [-t <image-name>] .

# Build Docker Compose
docker compose build

# Spin up docker compose
docker compose up [-d] [--build]

# View logs for "main" container
docker logs [-f] main [--tail 100]

# Spin down docker compose
docker compose down [-v --rmi all]
```

## Using Just Commands

```bash
# Run just to view list of options
just
```

## Automating running app using Cron

1. **NOTE:** Make sure that you have build a docker image before setting up your cron job
2. Add a cron job to crontab

```bash
# Run app every 15 minutes
*/15 * * * * cd <absolute-path-to-repo> && docker compose up -d
```
3. Verify Cron Job was added by listing the current crontab entries

```bash
crontab -l
```

## Resources / References

- [just (make alternative)](https://github.com/casey/just)
- [ruff - Python linter & Formatter](https://github.com/astral-sh/ruff)
- [uv - fast python package installer and resolver](https://github.com/astral-sh/uv)
- [Pytest](https://docs.pytest.org/en)
- [freeCodeCamp - Pytest Tutorial](https://www.youtube.com/watch?v=cHYq1MRoyI0)
- [testdriven.io - Docker Best Practices for Python Developers](https://testdriven.io/blog/docker-best-practices/)