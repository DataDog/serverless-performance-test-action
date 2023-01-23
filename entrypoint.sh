#!/bin/sh
RUNTIME_ID=$1 #will be used later, nodsjs for now
LAYER_NAME=$2
RUN_TEST=$4
ROLE=$5
EXTENSION_ARN=$6

mv *.zip layer.zip

/build_tools \
    deploy \
    --layer-path "/github/workspace/layer.zip" \
    --architecture amd64 \
    --layer-name "${LAYER_NAME}" \
    --region "${AWS_REGION}"

if [ "${RUN_TEST}" == "true" ]
then
    /build_tools \
        deploy_lambda \
        --layer-name "${LAYER_NAME}" \
        --runtime "${RUNTIME_ID}" \
        --region "${AWS_REGION}" \
        --role "${ROLE}" \
        --extension-arn "${EXTENSION_ARN}"
else
    echo "run_test param is not set to 'true', skipping"
fi