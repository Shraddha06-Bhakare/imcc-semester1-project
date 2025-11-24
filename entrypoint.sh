# #!/bin/sh
# set -e

# # If you need to wait for another service (like a DB) you can add wait-for logic here.

# # Apply DB migrations
# echo "Running migrations..."
# python manage.py migrate --noinput

# # Collect static files
# echo "Collecting static files..."
# python manage.py collectstatic --noinput

# # Start Gunicorn
# echo "Starting Gunicorn..."
# gunicorn ecommerce.wsgi:application \
#   --bind 0.0.0.0:8000 \
#   --workers 3 \
#   --log-level info











# #!/bin/sh

# echo "Running database migrations..."
# python manage.py migrate --noinput

# echo "Collecting static files..."
# python manage.py collectstatic --noinput

# echo "Starting Gunicorn server..."
# exec "$@"















# #!/bin/sh

# echo "Running database migrations..."
# python manage.py migrate --noinput

# echo "Collecting static files..."
# python manage.py collectstatic --noinput

# echo "Starting Gunicorn server..."
# exec "$@"
















# #!/bin/sh
# set -e

# echo "Running database migrations..."
# python manage.py migrate --noinput

# echo "Collecting static files..."
# python manage.py collectstatic --noinput

# echo "Starting Gunicorn server..."
# exec "$@"










#!/bin/sh
set -e

echo "Running database migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting server..."
exec "$@"