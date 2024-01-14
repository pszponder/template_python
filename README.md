# Python Project Template

This is a template for the start of a Python Project

## Usage

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
  help     print this help message
  setup    install virtual env, update pip, install / update dependencies
  lint     lints code using ruff linter
  format   formats code using ruff formatter
  tidy     lint & format code
  test     run all tests
  run      run main.py
  clean    clean up all build artifacts & virtual environments
  push     push changes to the remote Git repository, after running quality control checks
```

## Resources / References

- [Bastian Benthur - Writing Makefiles for Python Projects](https://venthur.de/2021-03-31-python-makefiles.html)
- [Alex Edwards - A Time Saving Makefile for your Go Project](https://www.alexedwards.net/blog/a-time-saving-makefile-for-your-go-projects)
- [ruff - Python linter & Formatter](https://github.com/astral-sh/ruff)
- [Pytest](https://docs.pytest.org/en)
- [freeCodeCamp - Pytest Tutorial - How to Test Python Code](https://www.youtube.com/watch?v=cHYq1MRoyI0)