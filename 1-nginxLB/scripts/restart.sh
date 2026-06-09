#/bin/sh

set -e

scripts/clear-containers.sh

method=${1:-compose}

if [[ "$method" == "compose" ]]; then
    echo "Trying compose method..."
    docker compose -f compose.yaml up -d --wait
elif [[ "$method" == "run" ]]; then
    echo "Trying docker run method..."
    scripts/docker-run.sh
else
    echo "Unknown method $method" && exit 1;
fi

scripts/test.sh
