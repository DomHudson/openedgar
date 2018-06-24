#!/bin/bash
echo "Building migrations"
python kernel-api/manage.py migrateall

echo "Applying database migrations"
python kernel-api/manage.py migrateall


echo "Starting server"
python kernel-api/manage.py runserver 0.0.0.0:8000