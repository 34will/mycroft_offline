#!/bin/bash

source selene-backend/common.sh

set -e

docker build -t selene-backend ./selene-backend
docker build -t selene-db-setup ./selene-db-setup
docker build --build-arg SELENEAPPDIR=/opt/selene/selene-backend/api/sso --build-arg FILECHECK="$db_bootstrap_done" -t selene-sso ./selene-app
docker build --build-arg SELENEAPPDIR=/opt/selene/selene-backend/api/account --build-arg FILECHECK="$db_bootstrap_done" -t selene-account ./selene-app
docker build -t selene-skills-setup ./selene-skills-setup
docker build --build-arg SELENEAPPDIR=/opt/selene/selene-backend/api/market --build-arg FILECHECK="$skills_setup_done" -t selene-market ./selene-app
docker build --build-arg SELENEAPPDIR=/opt/selene/selene-backend/api/public --build-arg FILECHECK="$skills_setup_done" -t selene-devices ./selene-app
docker build --build-arg APPNAME=market -t selene-ui-market ./selene-ui
docker build --build-arg APPNAME=account -t selene-ui-account ./selene-ui
docker build --build-arg APPNAME=sso -t selene-ui-sso ./selene-ui
docker build -t deepspeech ./deepspeech
