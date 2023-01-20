FROM ubuntu:bionic
ARG INPUT_LAYER_PATH
COPY entrypoint.sh /entrypoint.sh
ADD $INPUT_LAYER_PATH .
ENTRYPOINT ["/entrypoint.sh"]