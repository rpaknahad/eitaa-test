#!/bin/sh

set -e

docker compose -f ../2-SafeRedis/compose.yaml down
docker compose down
docker compose up -d --wait

./scripts/test.sh
