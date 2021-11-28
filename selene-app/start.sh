#!/bin/bash
# start.sh

/opt/wait-for-bootstrap.sh $1

cd $2

pipenv run uwsgi -b 32768 --http 0.0.0.0:$3 --ini uwsgi.ini
