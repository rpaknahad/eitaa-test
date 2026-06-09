#/bin/sh

set -e

NETWORK_NAME=eitaa-network
echo "Ensuring common network for containers..."
if [[ -z $(docker network ls --filter name=$NETWORK_NAME --format "{{.Name}}" | wc -l) ]]; then
    docker network create $NETWORK_NAME 2>/dev/null
fi

echo "Building backend image..."
docker build backend/ -t backend-eitaa:1.0.0

echo "Running backend containers..."
for i in {1..2}; do
    docker run -d --name backend$i -h backend$i --network $NETWORK_NAME -e SERVER_ID=$i backend-eitaa:1.0.0 && echo "Backend $i container is running"
done

echo "Building nginx image..."
docker build nginx/ -t nginx-eitaa:1.0.0

docker run -d --name nginx-eitaa --network $NETWORK_NAME -p 8080:8080 -e LB_TYPE="${LB_TYPE}" nginx-eitaa:1.0.0 && echo "Nginx container is running"
