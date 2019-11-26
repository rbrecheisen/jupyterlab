#!/bin/bash

echo ">> Create database 'restheart'"
curl --user admin:secret -I -X PUT http://localhost:8080
echo ">> Create collection 'collection'"
curl --user admin:secret -I -X PUT http://localhost:8080/collection
echo ">> Create documents"
curl --user admin:secret -X POST http://localhost:8080/collection -d '{"a": 1}' -H "Content-Type: application/json"
curl --user admin:secret -X POST http://localhost:8080/collection -d '{"a": 2}' -H "Content-Type: application/json"
echo ">> Get collection contents"
curl --user admin:secret http://localhost:8080/collection
