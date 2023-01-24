#!/bin/sh
RUNTIME_ID=$1 #will be used later, nodsjs for now
LAYER_NAME=$2
LAYER_PATH=$3
ROLE=$4
PR_ID=$5

if test -z "$PR_ID" 
then
      PR_ID="main"
fi

cp $LAYER_PATH /layer.zip
cd /

/build_tools \
    deploy \
    --layer-path "layer.zip" \
    --architecture amd64 \
    --layer-name "${LAYER_NAME}" \
    --region "${AWS_REGION}"

/build_tools \
    deploy_lambda \
    --layer-name "${LAYER_NAME}" \
    --runtime "${RUNTIME_ID}" \
    --region "${AWS_REGION}" \
    --role "${ROLE}" \
    --pr-id "${PR_ID}" \
    --should-invoke