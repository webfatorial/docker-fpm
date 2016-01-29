#!/bin/bash
set -e

umask 0002

chown www-data:www-data .
find . -type f -exec chmod 664 {} +
find . -type d -exec chmod 775 {} +

umask 0002

exec "$@"