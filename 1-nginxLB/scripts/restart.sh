#/bin/sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

${SCRIPT_DIR}/clear-containers.sh

method=${1:-compose}

if [[ "$method" == "compose" ]]; then
    echo "Trying compose method..."
    docker compose -f ${SCRIPT_DIR}/../compose.yaml up -d --wait
elif [[ "$method" == "run" ]]; then
    echo "Trying docker run method..."
    ${SCRIPT_DIR}/docker-run.sh
else
    echo "Unknown method $method" && exit 1;
fi

${SCRIPT_DIR}/test.sh
