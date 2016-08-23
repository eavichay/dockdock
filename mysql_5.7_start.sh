#!/bin/bash

mkdir -p /var/mysql/data
mysqld --initialize-insecure --datadir=/var/mysql/data --user=root 2>/dev/null || echo "Info: Database already initialized, skipping"

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
