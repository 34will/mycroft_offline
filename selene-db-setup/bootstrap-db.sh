#!/bin/bash
# bootstrap-db.sh

source common.sh

set -e

if [ -e $db_bootstrap_done ]; then
    echo "Database already bootstrapped"
    exit 0
fi

cd /opt/selene/selene-backend/db/scripts

pipenv run python -u bootstrap_mycroft_db.py

touch $db_bootstrap_done
