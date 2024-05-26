# ===========
# BUILD STAGE
# ===========
FROM python:slim AS builder

# Set the working directory in the container
WORKDIR /app

# Optimize Python's behavior within the container
#  PYTHONDONTWRITEBYTECODE -- Prevent Python from writing .pyc files to disk (bytecode files)
#  PYTHONUNBUFFERED -- Don't buffer stdout and stderr output streams so that log messages are visible immediately
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Update package lists for APT
#  install gcc compiler for compiling any required C extensions from python packages
#  clean up
RUN apt-get update && \
	apt-get install -y --no-install-recommends gcc &&\
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy requirements from host into container's working directory
COPY requirements.txt .

# Install python dependencies listed in requirements.txt into /app/wheels directory as pre-compiled wheel packages
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

# ===========
# TEST STAGE
# ===========
FROM builder AS tester

# Copy requirements.txt and wheel packages from temp build stage to final stage
COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .

# Install python dependencies from pre-compiled wheel packages
RUN pip install --no-cache /wheels/*

# Copy the entire application directory to the test stage
COPY . .

# Run pytest, exiting if a unit test fails
RUN pytest || (echo "Unit tests failed" && exit 1)

# ===========
# FINAL STAGE
# ===========
FROM python:slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt and wheel packages from temp build stage to final stage
COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .

# Copy the rest of the application code (files specified in .dockerignore are ignored)
COPY . .

# Install python dependencies from pre-compiled wheel packages
RUN pip install --no-cache /wheels/*

# Set environment variable for Python to find .env file
ENV PYTHONPATH=/app

# Command to run the Python script
CMD ["python", "src/main.py"]