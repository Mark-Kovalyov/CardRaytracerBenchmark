#!/bin/bash

AWS_PROFILE=mayton

mvn clean package

aws lambda update-function-code \
    --function-name  CardRaytracerLambda \
    --zip-file fileb://./target/java-aws-cloud-1.0-SNAPSHOT.jar
