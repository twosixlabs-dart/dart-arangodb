#!/bin/sh

ARANGO_UP=false

while [ !$ARANGO_UP ]; do
    result=$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost:8529/_api/version)
    if [ $result == 200 ]; then
        ARANGO_UP=true
        sleep 2
        arangosh --javascript.execute /opt/app/conf/schema.js --server.password ''
        echo 'schema imported!!!'
        exit 0
    else
        echo "ArangoDB is not available yet..."
        sleep 3
    fi
done
