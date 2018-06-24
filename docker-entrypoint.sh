#!/bin/bash
cd lexpredict_openedgar

source .env

echo "Applying database migrations"
python manage.py migrate

# echo "Starting tika"
# bash ../tika/run_tika.sh &

echo "Starting celery"
celery -A lexpredict_openedgar.taskapp worker --loglevel=INFO -c16