#!/bin/bash

echo "Importing squashed Onyx Docker images..."

echo "Importing onyx-backend-squashed.tar.gz (this may take a while)..."
cat onyx-backend-squashed.tar.gz | docker import - onyxdotapp/onyx-backend:latest

echo "Importing onyx-model-server-squashed.tar.gz (this may take a while)..."
cat onyx-model-server-squashed.tar.gz | docker import - onyxdotapp/onyx-model-server:latest

echo "Importing onyx-web-server-squashed.tar.gz..."
cat onyx-web-server-squashed.tar.gz | docker import - onyxdotapp/onyx-web-server:latest

echo "Importing vespa-squashed.tar.gz..."
cat vespa-squashed.tar.gz | docker import - vespaengine/vespa:8.277.17

echo "Importing postgres-squashed.tar.gz..."
cat postgres-squashed.tar.gz | docker import - postgres:15.2-alpine

echo "Importing redis-squashed.tar.gz..."
cat redis-squashed.tar.gz | docker import - redis:7.4-alpine

echo "Importing nginx-squashed.tar.gz..."
cat nginx-squashed.tar.gz | docker import - nginx:1.23.4-alpine

echo "All images imported successfully!"
echo "You can now run Onyx using the docker-compose.dev.yml file as described in the README.md" 