#!/bin/sh

SERVER_MAXIMAL_QUEUE_SIZE=${SERVER_MAXIMAL_QUEUE_SIZE:=16384}
SERVER_SCHEDULER_QUEUE_SIZE=${SERVER_SCHEDULER_QUEUE_SIZE:=16384}

echo "Setting maximal queue size: ${SERVER_MAXIMAL_QUEUE_SIZE}"
echo "Setting scheduler queue size: ${SERVER_SCHEDULER_QUEUE_SIZE}"
nohup /opt/app/bin/import-schema.sh > /opt/arangodb/logs/schema.log &

/entrypoint.sh arangod --server.maximal-queue-size $SERVER_MAXIMAL_QUEUE_SIZE  --server.scheduler-queue-size $SERVER_SCHEDULER_QUEUE_SIZE
