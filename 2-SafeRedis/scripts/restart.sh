#!/bin/sh

set -e

docker-compose down
docker-compose up -d --wait

./scripts/test.sh
