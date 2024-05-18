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
- [uv - fast python package installer and resolver](https://github.com/astral-sh/uv)
- [Pytest](https://docs.pytest.org/en)
- [freeCodeCamp - Pytest Tutorial - How to Test Python Code](https://www.youtube.com/watch?v=cHYq1MRoyI0)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
- [Docker Compose Overview](https://docs.docker.com/compose/)
- [ArjanCodes - How to Use Docker to Make Local Development a Breeze](https://www.youtube.com/watch?v=zkMRWDQV4Tg)
- [Official Docs - Poetry](https://python-poetry.org/)
- [Official Docs - Poetry CLI](https://python-poetry.org/docs/cli/)
- [ArjanCodes - How to Create and Use Virtual Environments in Python with Poetry](https://www.youtube.com/watch?v=0f3moPe_bhk)
- [Riccardo Albertazzi - Blazing Fast Python Docker builds w/ Poetry](https://medium.com/@albertazzir/blazing-fast-python-docker-builds-with-poetry-a78a66f5aed0)
- [usr-ein -- Multistaged Dockerfile for Poetry](https://gist.github.com/usr-ein/c42d98abca3cb4632ab0c2c6aff8c88a)