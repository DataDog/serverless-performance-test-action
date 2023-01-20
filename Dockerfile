FROM ubuntu:bionic
ARG INPUT_LAYER_PATH
COPY entrypoint.sh /entrypoint.sh
ADD $INPUT_LAYER_PATH .
ADD build_tools .
ENTRYPOINT ["/entrypoint.sh"]