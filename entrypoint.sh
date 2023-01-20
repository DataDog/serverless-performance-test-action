#!/bin/sh
RUNTIME_ID=$1 #will be used later, nodsjs for now
LAYER_NAME=$2
pwd
echo "dir 1"
ls -la
cd /
echo "after cd"
ls -la 
/build_tools \
    deploy \
    --layer-path "/github/workspace/layer.zip" \
    --architecture amd64 \
    --layer-name "${LAYER_NAME}" \
    --region "${AWS_REGION}"