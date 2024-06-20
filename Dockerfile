#ubunutu
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

RUN apt-get install -y net-tools

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -yq asterisk
COPY sip.conf /etc/asterisk/sip.conf