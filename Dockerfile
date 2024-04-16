FROM --platform=amd64 ubuntu:focal
ARG UNIFI_VERSION

ENV DEBIAN_FRONTEND=noninteractive
ENV UNIFI_VERSION=$UNIFI_VERSION
RUN echo "Unifi version: $UNIFI_VERSION"

ADD ./install-unifi-controller.sh /install-unifi-controller.sh

RUN ./install-unifi-controller.sh

ADD ./entrypoint.sh /entrypoint.sh

EXPOSE 8443
EXPOSE 38473/udp
EXPOSE 10001/udp
EXPOSE 8080
EXPOSE 1900/udp
EXPOSE 8843
EXPOSE 8880
EXPOSE 6789
EXPOSE 5514/udp

ENTRYPOINT ["/entrypoint.sh"]