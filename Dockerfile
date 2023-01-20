FROM ubuntu:bionic
ARG INPUT_LAYER_PATH
COPY entrypoint.sh /entrypoint.sh
COPY build_tools /build_tools
ADD $INPUT_LAYER_PATH .

ENTRYPOINT ["/entrypoint.sh"]