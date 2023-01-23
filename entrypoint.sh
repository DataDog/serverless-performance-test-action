#!/bin/sh
RUNTIME_ID=$1 #will be used later, nodsjs for now
LAYER_NAME=$2
RUN_TEST=$4

mv *.zip layer.zip

/build_tools \
    deploy \
    --layer-path "/github/workspace/layer.zip" \
    --architecture amd64 \
    --layer-name "${LAYER_NAME}" \
    --region "${AWS_REGION}"

echo "Run test is :"
echo $RUN_TEST

/build_tools \
    deploy_lambda \
    --layer-name "${LAYER_NAME}" \
    --runtime "${RUNTIME_ID}" \
    --region "${AWS_REGION}"
