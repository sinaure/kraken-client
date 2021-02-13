#!/bin/bash
DATA_DIR="/usr/local/share/postgresql/scripts/data/"
for file in $DATA_DIR/*; do
    psql -d crypto-executor -U executor -f "${file}"
done