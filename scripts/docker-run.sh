#!/bin/bash
# Run dnsmasq in the container 
set -o errexit -o nounset -o pipefail

: ${DNSMASQ_CONF:="/opt/dnsmasq/dnsmasq.conf"}
: ${HOSTS_D_PATH:="/opt/dnsmasq/hosts.d"}
: ${DHCP_HOSTS_D_PATH:="/opt/dnsmasq/dhcp.hosts.d"}
: ${DHCP_OPTS_D_PATH:="/opt/dnsmasq/dhcp.opts.d"}
: ${RESOLV_CONF:="/opt/dnsmasq/etc/resolv.conf"}

echo "Starting dnsmasq...."
/usr/sbin/dnsmasq --user=root --no-daemon \
    --conf-file=${DNSMASQ_CONF} \
    --no-hosts --hostsdir=${HOSTS_D_PATH} \
    --resolv-file=${RESOLV_CONF} \
    --dhcp-hostsdir=${DHCP_HOSTS_D_PATH} \
    --dhcp-optsdir=${DHCP_OPTS_D_PATH} \
    --dhcp-leasefile=/var/run/dnsmasq-dhcp.leases \
    --log-dhcp --log-queries --log-facility=/var/log/dnsmasq.log