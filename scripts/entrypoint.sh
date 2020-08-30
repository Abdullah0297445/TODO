#!/bin/sh

set -e

cd /home/TODO/
# Collect static files
# echo "Collect static files"
# python manage.py collectstatic --noinput

# # Wait for DB
# python manage.py wait_for_db

# # Make migrations
# echo "Make migrations"
# python manage.py makemigrations

# # Apply database migrations
# echo "Apply database migrations"
# python manage.py migrate

# Start server
echo "Starting server"
python manage.py runserver 0.0.0.0:8000