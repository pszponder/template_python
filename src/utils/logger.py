"""
Configure a Loguru Logger
- https://github.com/Delgan/loguru
"""

import os
import sys

from dotenv import load_dotenv
from loguru import logger

# Load log level from .env file
load_dotenv(override=True)  # bust env cache by enabling override
log_level = os.getenv("LOG_LEVEL", "TRACE")
log_file_max_size = int(
    os.getenv("LOG_FILE_MAX_SIZE", 1000)
)  # Max size of log file in bytes
log_file_retention = int(
    os.getenv("LOG_FILE_RETENTION", 5)
)  # Number of log files to retain before deleting oldest


# Configure Logger
logger.remove()  # Remove default log sink

logger.add(
    sys.stdout,
    format="{time:!UTC} -- {level} -- <level>{message}</level>",
    level=log_level,
)  # Add sink to print to stdout

logger.add(
    "app.log",
    serialize=True,
    level=log_level,
    rotation=log_file_max_size,
    retention=log_file_retention,
)  # Add another sink, this one will log to a log file called "app.log"
