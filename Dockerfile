# # This is the final code of Docker-Image file:-
# # Use official Python image
# FROM python:3.11-slim

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Set working directory
# WORKDIR /app

# # Install system dependencies (including Pillow dependencies)
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     libpq-dev \
#     gcc \
#     libjpeg-dev \
#     zlib1g-dev \
#     && rm -rf /var/lib/apt/lists/*

# # Install Python dependencies
# COPY requirements.txt .
# RUN pip install --upgrade pip \
#     && pip install -r requirements.txt

# # Copy project files
# COPY . .

# # Create necessary directories
# RUN mkdir -p staticfiles media static

# # Expose port
# EXPOSE 8000

# # Default command
# CMD ["sh", "-c", "python manage.py migrate && python manage.py collectstatic --noinput && python manage.py runserver 0.0.0.0:8000"]




# # Base image
# FROM python:3.10-slim

# # Set workdir
# WORKDIR /app

# # Copy requirements
# COPY requirements.txt /app/

# # Install requirements
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy project files
# COPY . /app/

# # Expose Django port
# EXPOSE 8000

# # Add entrypoint
# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]




# # Use official Python image
# FROM python:3.10-slim

# # Set working directory
# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     libpq-dev \
#     && rm -rf /var/lib/apt/lists/*

# # Copy project files
# COPY . .

# # Install Python dependencies
# RUN pip install --upgrade pip
# RUN pip install -r requirements.txt

# # Collect static files
# RUN python manage.py collectstatic --noinput

# # Expose Django port
# EXPOSE 8000

# # Gunicorn command
# CMD ["gunicorn", "firstapp.wsgi:application", "--bind", "0.0.0.0:8000"]






# -------------------------------
# Base Image
# -------------------------------
FROM python:3.10-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# -------------------------------
# Set working directory
# -------------------------------
WORKDIR /app

# -------------------------------
# Install system dependencies
# -------------------------------
RUN apt-get update && apt-get install -y --fix-missing \
    build-essential \
    pkg-config \
    default-libmysqlclient-dev \
    libssl-dev \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# -------------------------------
# Install Python dependencies
# -------------------------------
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install gunicorn pytest pytest-cov

# -------------------------------
# Copy project files
# -------------------------------
COPY . .

# -------------------------------
# Create non-root user
# -------------------------------
RUN adduser --disabled-password appuser
USER appuser

# -------------------------------
# Expose port
# -------------------------------
EXPOSE 8000

# -------------------------------
# Kubernetes Health Check
# -------------------------------
HEALTHCHECK CMD curl -f http://localhost:8000/ || exit 1

# -------------------------------
# Start server (safe for CI/CD)
# -------------------------------
CMD ["sh", "-c", "python manage.py migrate || true && exec gunicorn ecommerce.wsgi:application --bind 0.0.0.0:8000"]
