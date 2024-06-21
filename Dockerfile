#ubunutu
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

RUN apt-get install -y net-tools

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -yq asterisk
COPY sip.conf /etc/asterisk/sip.conf
COPY extensions.conf /etc/asterisk/extensions.conf

# Expose SIP and RTP ports
EXPOSE 5060/udp 5060/tcp

# Start Asterisk in foreground
CMD ["asterisk", "-f", "-vvv"]