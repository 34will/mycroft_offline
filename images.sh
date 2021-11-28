#!/bin/bash

source selene-backend/common.sh

set -e

docker build -t selene-backend ./selene-backend ;
docker build -t selene-db-setup ./selene-db-setup ;
docker build --build-arg SELENEAPPDIR=/opt/selene/selene-backend/api/sso --build-arg FILECHECK="$db_bootstrap_done" -t selene-sso ./selene-app ;
docker build --build-arg SELENEAPPDIR=/opt/selene/selene-backend/api/account --build-arg FILECHECK="$db_bootstrap_done" -t selene-account ./selene-app ;
docker build -t selene-skills-setup ./selene-skills-setup ;
