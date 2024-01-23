# ==============
# Layer 1: Build
# ==============
FROM python:alpine AS builder

# Install + Configure Poetry (Python Dependency Manager)
RUN pip install poetry

ENV POETRY_NO_INTERACTION=1 \
	POETRY_VIRTUALENVS_IN_PROJECT=1 \
	POETRY_VIRTUALENVS_CREATE=1 \
	POETRY_CACHE_DIR=/tmp/poetry_cache

# set the working directory
WORKDIR /app

# Copy / Create Poetry Dependencies
COPY pyproject.toml poetry.lock ./
RUN touch README.md

# install dependencies
RUN --mount=type=cache,target=$POETRY_CACHE_DIR poetry install --without dev --no-root

# ==============
# Layer 2: Final
# ==============
FROM python:alpine AS runtime

ENV VIRTUAL_ENV=/app/.venv \
	PATH="/app/.venv/bin:$PATH"

# copy build environment + the scripts to the folder
COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}
COPY src ./src

# start the app
CMD ["python", "src/main.py"]