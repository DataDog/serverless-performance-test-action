FROM ubuntu:jammy
ARG INPUT_LAYER_PATH

RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates
RUN update-ca-certificates

COPY entrypoint.sh /entrypoint.sh
COPY build_tools /build_tools
COPY $INPUT_LAYER_PATH /layer.zip

ENTRYPOINT ["/entrypoint.sh"]