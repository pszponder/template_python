# Python Project Template

This is a template for the start of a Python Project

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

### Create a New Virtual Environment

```bash
# This will create a new virtual environment, update pip, and install any dependencies from requirements.txt
make setup
```

### Activating & Deactivating Virtual Environment

```bash
# Activate Virtual Environment
. ./venv/bin/activate

# Deactivate Virtual Environment
deactivate
```

### Makefile

The Makefile contains many useful recipes, to view a help file simply execute `make` in your terminal

```txt
Usage:
  help         print this help message
  dbuild       build docker compose
  up           spin up docker compose
  upd          spin up docker compose (in detached mode)
  logs         view logs for docker compose
  logsf        view logs for docker compose, and follow
  down         tear down docker compose
  down/clean   tear down docker compose, remove images used by services, & remove named volumes
  setup        install virtual env, update pip, install / update dependencies
  lint         lints code using ruff linter
  format       formats code using ruff formatter
  tidy         lint & format code
  test         run all tests
  run          run main.py
  clean        clean up all build artifacts & virtual environments
  push         push changes to the remote Git repository, after running quality control checks
```

### Using Docker

```bash
# Build Docker Compose
docker compose build

# Spin up docker compose
docker compose up [-d]

# View logs for "main" container
docker logs [-f] main [--tail 100]

# Spin down docker compose
docker compose down [-v --rmi all]
```

Can also use make commands
```bash
# Builds the docker compose
make dbuild

# Spin up docker compose
make up

# Spin up docker compose in detached mode
make upd

# View logs for main container
make logs

# View logs for main container and follow
make logsf

# Spin down docker compose
make down

# Spin down docker compose & remove images and volumes
make down/clean
```

## Resources / References

- [Bastian Benthur - Writing Makefiles for Python Projects](https://venthur.de/2021-03-31-python-makefiles.html)
- [Alex Edwards - A Time Saving Makefile for your Go Project](https://www.alexedwards.net/blog/a-time-saving-makefile-for-your-go-projects)
- [ruff - Python linter & Formatter](https://github.com/astral-sh/ruff)
- [Pytest](https://docs.pytest.org/en)
- [freeCodeCamp - Pytest Tutorial - How to Test Python Code](https://www.youtube.com/watch?v=cHYq1MRoyI0)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
- [Docker Compose Overview](https://docs.docker.com/compose/)
- [ArjanCodes - How to Use Docker to Make Local Development a Breeze](https://www.youtube.com/watch?v=zkMRWDQV4Tg)