#!/bin/sh
RUNTIME_ID=$1 #will be used later, nodsjs for now
LAYER_NAME=$2
ROLE=$5
PR_ID=$6

pwd
cp *.zip /layer.zip
cd /

/build_tools \
    deploy \
    --layer-path "layer.zip" \
    --architecture amd64 \
    --layer-name "${LAYER_NAME}" \
    --region "${AWS_REGION}"

if [ "$RUN_TEST" = "true" ]
then
    /build_tools \
        deploy_lambda \
        --layer-name "${LAYER_NAME}" \
        --runtime "${RUNTIME_ID}" \
        --region "${AWS_REGION}" \
        --role "${ROLE}"
        --pr-id "${PR_ID}"
        --should-invoke
else
    echo "run_test param is not set to 'true', skipping"
fi