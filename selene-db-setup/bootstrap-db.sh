#!/bin/bash
# bootstrap-db.sh

set -e

markerFile="/shared/db_bootstrap_done"

if [ -e $markerFile ]; then
    echo "Database already bootstrapped"
    exit 0
fi

cd /opt/selene/selene-backend/db/scripts

pipenv run python -u bootstrap_mycroft_db.py

touch $markerFile
