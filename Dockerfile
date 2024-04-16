FROM --platform=amd64 ubuntu:focal
ARG UNIFI_VERSION

ENV DEBIAN_FRONTEND=noninteractive
ENV UNIFI_VERSION=$UNIFI_VERSION
RUN echo "Unifi version: $UNIFI_VERSION"

ADD ./install-unifi-controller.sh /install-unifi-controller.sh

RUN ./install-unifi-controller.sh

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]