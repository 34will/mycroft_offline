#!/bin/bash
# replace-domain.sh

find /usr/share/nginx/html -type f -exec sed -i -e "s/account\.mycroft\.ai/$1/g" {} \;
find /usr/share/nginx/html -type f -exec sed -i -e "s/home\.mycroft\.ai/$1/g" {} \;
find /usr/share/nginx/html -type f -exec sed -i -e "s/market\.mycroft\.ai/$2/g" {} \;
find /usr/share/nginx/html -type f -exec sed -i -e "s/sso\.mycroft\.ai/$3/g" {} \;
