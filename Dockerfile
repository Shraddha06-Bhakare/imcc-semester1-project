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




# Base image
FROM python:3.10-slim

# Set workdir
WORKDIR /app

# Copy requirements
COPY requirements.txt /app/

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Expose Django port
EXPOSE 8000

# Add entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
