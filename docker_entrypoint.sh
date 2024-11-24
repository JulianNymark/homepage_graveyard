#!/bin/bash
set -euxo pipefail

mkdir -p /mnt/data/html
# chown -R ubuntu:ubuntu /mnt/data
# chmod -R 755 /mnt/data

mkdir -p /mnt/nginx/logs
# chown -R www-data:www-data /mnt/nginx

/usr/sbin/sshd

nginx -g 'daemon off;'

exec "$@"
