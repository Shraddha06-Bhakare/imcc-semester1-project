# # syntax=docker/dockerfile:1
# FROM python:3.11-slim

# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1

# WORKDIR /app

# # system deps for some Python packages and to allow pip to compile wheels if needed
# RUN apt-get update \
#  && apt-get install -y --no-install-recommends build-essential gcc \
#  && rm -rf /var/lib/apt/lists/*

# # copy requirement file and install
# COPY requirements.txt /app/requirements.txt
# RUN pip install --upgrade pip
# RUN pip install -r /app/requirements.txt

# # copy project
# COPY . /app/

# # create static dir (STATIC_ROOT)
# RUN mkdir -p /app/staticfiles

# # add entrypoint
# COPY ./entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# EXPOSE 8000

# # Use the entrypoint which will run migrations, collectstatic and start gunicorn
# CMD ["/entrypoint.sh"]









# # Use official Python image
# FROM python:3.11-slim

# # Set environment variables (no .pyc files, unbuffered logs)
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Set working directory
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential libpq-dev gcc \
#     && rm -rf /var/lib/apt/lists/*

# # Install pipenv/requirements
# COPY requirements.txt /app/
# RUN pip install --upgrade pip
# RUN pip install -r requirements.txt

# # Copy project files
# COPY . /app/

# # Collect static files (for Django staticfiles in Docker)
# RUN python manage.py collectstatic --noinput

# # Expose port
# EXPOSE 8000

# # Default command
# CMD ["gunicorn", "ecommerce.wsgi:application", "--bind", "0.0.0.0:8000"]















# # Use official Python image
# FROM python:3.11-slim

# # Set environment variables (no .pyc files, unbuffered logs)
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Set working directory
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential libpq-dev gcc \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies
# COPY requirements.txt /app/
# RUN pip install --upgrade pip \
#     && pip install -r requirements.txt

# # Copy project files
# COPY . /app/

# # Copy entrypoint script
# COPY entrypoint.sh /app/
# RUN chmod +x /app/entrypoint.sh

# # Expose port
# EXPOSE 8000

# # Use entrypoint for migrations & collectstatic
# ENTRYPOINT ["/app/entrypoint.sh"]

# # Default command
# CMD ["gunicorn", "ecommerce.wsgi:application", "--bind", "0.0.0.0:8000"]






















# # Use official Python image
# FROM python:3.11-slim

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Set working directory
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential libpq-dev gcc \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies
# COPY requirements.txt /app/
# RUN pip install --upgrade pip \
#     && pip install -r requirements.txt

# # Copy project files
# COPY . /app/

# # Copy entrypoint script
# COPY entrypoint.sh /app/
# RUN chmod +x /app/entrypoint.sh

# # Expose port
# EXPOSE 8000

# # Use entrypoint for migrations & collectstatic
# ENTRYPOINT ["/app/entrypoint.sh"]

# # Default command
# CMD ["gunicorn", "ecommerce.wsgi:application", "--bind", "0.0.0.0:8000"]

















# # Use official Python image
# FROM python:3.11-slim

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Set working directory
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential libpq-dev gcc \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies
# COPY requirements.txt .
# RUN pip install --upgrade pip \
#     && pip install -r requirements.txt

# # Copy project files
# COPY . .

# # Create necessary directories
# RUN mkdir -p staticfiles product

# # Make entrypoint script executable
# RUN chmod +x /app/entrypoint.sh

# # Expose port
# EXPOSE 8000

# # Use entrypoint for migrations & collectstatic
# ENTRYPOINT ["/app/entrypoint.sh"]

# # Default command
# CMD ["gunicorn", "ecommerce.wsgi:application", "--bind", "0.0.0.0:8000"]


















# # Use official Python image
# FROM python:3.11-slim

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Set working directory
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential libpq-dev gcc \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies
# COPY requirements.txt .
# RUN pip install --upgrade pip \
#     && pip install -r requirements.txt

# # Copy project files
# COPY . .

# # Create necessary directories
# # RUN mkdir -p staticfiles media

# # Expose port
# EXPOSE 8000

# # Default command - all in one line to avoid entrypoint issues
# CMD ["sh", "-c", "python manage.py migrate && python manage.py collectstatic --noinput && python manage.py runserver 0.0.0.0:8000"]






# Use official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install system dependencies (including Pillow dependencies)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    gcc \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy project files
COPY . .

# Create necessary directories
RUN mkdir -p staticfiles media static

# Expose port
EXPOSE 8000

# Default command
CMD ["sh", "-c", "python manage.py migrate && python manage.py collectstatic --noinput && python manage.py runserver 0.0.0.0:8000"]