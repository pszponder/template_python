# Use Alpine as base image
FROM python:alpine

# Install uv tool
RUN pip install uv

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Create and Activate Virtual Environment in uv
RUN uv venv
SHELL ["/bin/ash", "-c"]
RUN source .venv/bin/activate

# Install Python dependencies
RUN uv pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Command to run the Python script
CMD ["python", "src/main.py"]
