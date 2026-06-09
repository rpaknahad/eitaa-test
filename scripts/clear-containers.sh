#/bin/sh

echo "Clearing containers if any..."
containers="nginx-eitaa backend1 backend2"
docker stop $containers 2>/dev/null || :
docker rm $containers 2>/dev/null || :
