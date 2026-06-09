#!/bin/sh

set -e

set -a; . ./.env; set +a

wget -O - -q --user ${REDIS_EXPORTER_BASIC_AUTH_USERNAME} --password ${REDIS_EXPORTER_BASIC_AUTH_PASSWORD} http://localhost:9100/metrics || echo 'Problem connecting to redis exporter'
