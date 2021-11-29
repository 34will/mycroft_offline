#!/bin/bash
# update-domain.sh

sed -i -e "s/\.mycroft\.ai/${DOMAIN}/g" /opt/selene/selene-backend/shared/selene/api/base_config.py
