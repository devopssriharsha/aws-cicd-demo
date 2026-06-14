#!/bin/bash

docker stop flask-container || true
docker rm flask-container || true

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 363191779630.dkr.ecr.us-east-1.amazonaws.com

docker pull 363191779630.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest

docker run -d \
--name flask-container \
-p 5000:5000 \
363191779630.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest
