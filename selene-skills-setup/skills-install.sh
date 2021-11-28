#!/bin/bash
# skills-install.sh

source /opt/common.sh

if [ -e $skills_setup_done ]; then
    echo "Skills already installed"
    exit 0
fi

/opt/wait-for-bootstrap.sh $db_bootstrap_done

cd /opt/selene/selene-backend/batch/script

pipenv run python load_skill_display_data.py --core-version $1

touch $skills_setup_done
