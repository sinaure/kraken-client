#!/bin/bash
pg_dumpall -U executor crypto-executor > /usr/local/share/postgresql/backup/backup.sql