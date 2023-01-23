FROM ubuntu:jammy
ARG INPUT_LAYER_PATH

RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates
RUN update-ca-certificates

RUN mkdir /app
WORKDIR /app
COPY entrypoint.sh /
COPY build_tools /app/
COPY $INPUT_LAYER_PATH /

ENTRYPOINT ["/app/entrypoint.sh"]