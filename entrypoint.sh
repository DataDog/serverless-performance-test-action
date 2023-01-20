#!/bin/sh
RUNTIME_ID=$1 #will be used later, nodsjs for now
LAYER_NAME=$2
LAYER_NAME=${LAYER_NAME//[-._]} # remove dot as it's a forbiden char for layer name

/build_tools \
    deploy \
    --layer-path "/github/workspace/layer.zip" \
    --architecture amd64 \
    --layer-name "${LAYER_NAME}" \
    --region "${AWS_REGION}"