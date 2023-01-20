#!/bin/sh
RUNTIME_ID=$1 #will be used later, nodsjs for now
LAYER_PATH=$2
LAYER_NAME=$3

./build-tools/bin/build_tools \
    deploy \
    --layer-path "${LAYER_PATH}" \
    --architecture amd64 \
    --layer-name "${LAYER_NAME}" \
    --region "${AWS_REGION}"