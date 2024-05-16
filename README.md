# Python Project Template

This is a template for the start of a Python Project

## Prerequisites

[pixi](https://prefix.dev/)

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

### Create / Activate New Virtual Environment

```bash
# Creates (if it does not exist) .pixi directory
# and activate the virtual environment
pixi shell
```

### Install / Remove python dependencies

```bash
# Install a package
pixi add <package_name> [<pkg2>, <pkg3>, ...]

# Uninstall a package
pixi remove <package_name> [<pkg2>, <pkg3>, ...]

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

## Pixi Tasks

You can run tasks specified under `[tool.pixi.tasks]` by invoking `pixi run <task_name>`

## Resources / References

- [Bastian Benthur - Writing Makefiles for Python Projects](https://venthur.de/2021-03-31-python-makefiles.html)
- [Alex Edwards - A Time Saving Makefile for your Go Project](https://www.alexedwards.net/blog/a-time-saving-makefile-for-your-go-projects)
- [ruff - Python linter & Formatter](https://github.com/astral-sh/ruff)
- [uv - fast python package installer and resolver](https://github.com/astral-sh/uv)
- [pixi](https://prefix.dev/)
- [Pytest](https://docs.pytest.org/en)
- [Pytest with Eric](https://pytest-with-eric.com/)
- [freeCodeCamp - Pytest Tutorial - How to Test Python Code](https://www.youtube.com/watch?v=cHYq1MRoyI0)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
- [Docker Compose Overview](https://docs.docker.com/compose/)
- [ArjanCodes - How to Use Docker to Make Local Development a Breeze](https://www.youtube.com/watch?v=zkMRWDQV4Tg)
- [Official Docs - Poetry](https://python-poetry.org/)
- [Official Docs - Poetry CLI](https://python-poetry.org/docs/cli/)
- [ArjanCodes - How to Create and Use Virtual Environments in Python with Poetry](https://www.youtube.com/watch?v=0f3moPe_bhk)
- [Riccardo Albertazzi - Blazing Fast Python Docker builds w/ Poetry](https://medium.com/@albertazzir/blazing-fast-python-docker-builds-with-poetry-a78a66f5aed0)
- [usr-ein -- Multistaged Dockerfile for Poetry](https://gist.github.com/usr-ein/c42d98abca3cb4632ab0c2c6aff8c88a)