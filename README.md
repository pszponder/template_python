# Python Project Template

This is a template for the start of a Python Project

## Prerequisites

- [uv - Extremely fast Python package installer and resolver written in rust](https://github.com/astral-sh/uv)
- [just (make alternative)](https://github.com/casey/just)


## Cloning the Repository

```bash
# Clone the repo
git clone git@github.com:pszponder/template_python.git

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
# Install a package
pixi add <package_name> [<pkg2>, <pkg3>, ...]

# Uninstall a package
pixi remove <package_name> [<pkg2>, <pkg3>, ...]
```

### Running the Main Application

```bash
pixi run start
```

### Deactivate Virtual Environment

```bash
exit
```

### Using Docker

```bash
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

## Resources / References

- [just (make alternative)](https://github.com/casey/just)
- [Bastian Benthur - Writing Makefiles for Python Projects](https://venthur.de/2021-03-31-python-makefiles.html)
- [Alex Edwards - A Time Saving Makefile for your Go Project](https://www.alexedwards.net/blog/a-time-saving-makefile-for-your-go-projects)
- [ruff - Python linter & Formatter](https://github.com/astral-sh/ruff)
- [pixi](https://prefix.dev/)
- [Pytest](https://docs.pytest.org/en)
- [Pytest with Eric](https://pytest-with-eric.com/)
- [freeCodeCamp - Pytest Tutorial - How to Test Python Code](https://www.youtube.com/watch?v=cHYq1MRoyI0)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
- [Docker Compose Overview](https://docs.docker.com/compose/)
- [ArjanCodes - How to Use Docker to Make Local Development a Breeze](https://www.youtube.com/watch?v=zkMRWDQV4Tg)