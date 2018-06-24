#!/bin/bash
cd lexpredict_openedgar

source .env

echo "Building migrations"
python manage.py makemigrations

echo "Applying database migrations"
python manage.py migrate

# echo "Starting tika"
# bash ../tika/run_tika.sh &

echo "Starting celery"
celery -A lexpredict_openedgar.taskapp worker --loglevel=INFO -f celery.log -c16