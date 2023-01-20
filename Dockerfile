FROM ubuntu:bionic
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]