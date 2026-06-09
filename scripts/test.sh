#/bin/sh

# Test LB & backends
TEST_COUNT=20
echo "Testing load balancer for $TEST_COUNT times..."
for ((i=0; i < $TEST_COUNT; i++)); do
    curl localhost:8080
    sleep 0.1
done
echo

echo "Ensuring header LB-TYPE:"
curl -s -D - localhost:8080 | grep --color 'LB-TYPE'
