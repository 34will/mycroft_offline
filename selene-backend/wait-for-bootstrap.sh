#!/bin/bash
# wait-for-bootstrap.sh

while [ ! -f $1 ]; do
    echo 'Bootstraping not done. Exiting.';
    sleep 5;
done;
