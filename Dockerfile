#!/usr/bin/docker build
# Dockerfile for dnsmasq

FROM debian:10

# Set up the system
RUN apt-get update && \
    apt-get install -y dnsmasq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add the files to the image
ADD ./etc/default-dnsmasq.conf /srv/dnsmasq/dnsmasq.conf
ADD ./etc/default-resolv.conf /srv/dnsmasq/etc/resolv.conf
ADD ./etc/default-hosts.conf /srv/dnsmasq/hosts.d/default-hosts.conf
ADD ./etc/default-dhcp-opts.conf /srv/dnsmasq/dhcp.opts.d/default-opts.conf
ADD ./etc/default-dhcp-hosts.conf /srv/dnsmasq/dhcp.hosts.d/default-hosts.conf

# Expose DNS ports
EXPOSE 53
EXPOSE 53/udp

# Expose DHCP ports
EXPOSE 67
EXPOSE 67/udp
EXPOSE 68
EXPOSE 68/udp

VOLUME /data

# Start dnsmasq
ADD ./scripts/docker-run.sh /opt/dnsmasq/scripts/docker-run.sh
CMD [ "/opt/dnsmasq/scripts/docker-run.sh" ]
