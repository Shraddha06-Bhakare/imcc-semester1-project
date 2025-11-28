# # This is the final code:-
# #!/bin/sh
# set -e

# echo "Running database migrations..."
# python manage.py migrate --noinput

# echo "Collecting static files..."
# python manage.py collectstatic --noinput

# echo "Starting server..."
# exec "$@"



#!/bin/sh

python manage.py migrate
python manage.py collectstatic --noinput

gunicorn ecommerce.wsgi:application --bind 0.0.0.0:8000
