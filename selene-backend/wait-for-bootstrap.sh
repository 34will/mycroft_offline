#!/bin/bash
# wait-for-bootstrap.sh

while [ ! -f $1 ]; do
    echo "$1 not found. Bootstrapping not done. Retrying.";
    sleep 5;
done;
