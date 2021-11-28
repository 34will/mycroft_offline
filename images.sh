#!/bin/bash

source selene-backend/common.sh

set -e

docker build -t selene-backend ./selene-backend ;
docker build -t selene-db-setup ./selene-db-setup ;
