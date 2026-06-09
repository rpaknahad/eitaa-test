#!/bin/sh

redis-cli -h localhost -p 9000 SET "test:$(date +%s)" "success" && echo 'Redis running' || echo 'Error in Redis'
