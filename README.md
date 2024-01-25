# Python Project Template

This is a template for the start of a Python Project

## Prerequisites

This project template uses and requires [`poetry`](https://python-poetry.org/docs/)

## Usage

### Cloning the Repository

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

### Update pyproject.toml

Update the 1st part of the `pyproject.toml` file with information related to your project:
- `name`
- `version`
- `description`
- `authors`

```yaml
[tool.poetry]
name = "python-template-project"
version = "0.1.0"
description = ""
authors = ["Your Name <you@example.com>"]
```

### Install + Update Dependencies from pyproject.toml

```bash
# Install dependencies specified in pyproject.toml
poetry install
```

```bash
# Update dependencies in pyproject.toml
poetry update
```

### Create / Activate / Deactivate a New Virtual Environment

```bash
# Creates and/or Activates new Virtual Environment
poetry shell

# Deactivate Virtual Environment
exit
```

### Installing New / Removing Existing Dependencies

```bash
poetry add <package_name> [--group <group_name>]

poetry remove <package_name> [--group <group_name>]
```

### Makefile

The Makefile contains many useful recipes, to view a help file simply execute `make` in your terminal

```txt
Usage:
  help         print this help message
  up           spin up docker compose development service
  upd          spin up docker compose development service (in detatched mode)
  up/prod      spin up docker compose production service
  upd/prod     spin up docker compose production service (in detatched mode)
  logs         view logs for docker compose
  logsf        view logs for docker compose, and follow
  down         tear down docker compose
  down/clean   tear down docker compose, remove images used by services, & remove named volumes
  lint         lints code using ruff linter
  format       formats code using ruff formatter
  tidy         lint & format code
  test         run all tests
  run          run main.py
  clean        clean up all artifacts
  push         push changes to the remote Git repository, after running quality control checks
```

### Using Docker

```bash
# Build Docker Compose
docker compose build

# Spin up docker compose
docker compose up [-d] <development/production>

# View logs for "main" container
docker logs [-f] main [--tail 100]

# Spin down docker compose
docker compose down [-v --rmi all]
```

Can also use make commands (refer to Docker section of `MakeFile`)

## Resources / References

- [Bastian Benthur - Writing Makefiles for Python Projects](https://venthur.de/2021-03-31-python-makefiles.html)
- [Alex Edwards - A Time Saving Makefile for your Go Project](https://www.alexedwards.net/blog/a-time-saving-makefile-for-your-go-projects)
- [ruff - Python linter & Formatter](https://github.com/astral-sh/ruff)
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