#!/bin/bash
# Run dnsmasq in the container 
set -o errexit -o nounset -o pipefail

: ${DNSMASQ_HOME:="/srv/dnsmasq"}
: ${DNSMASQ_CONF:="${DNSMASQ_HOME}/dnsmasq.conf"}
: ${DNSMASQ_LOG:="${DNSMASQ_HOME}/dnsmasq.log"}
: ${HOSTS_D_PATH:="${DNSMASQ_HOME}/hosts.d"}
: ${DHCP_HOSTS_D_PATH:="${DNSMASQ_HOME}/dhcp.hosts.d"}
: ${DHCP_OPTS_D_PATH:="${DNSMASQ_HOME}/dhcp.opts.d"}
: ${RESOLV_CONF:="${DNSMASQ_HOME}/etc/resolv.conf"}

echo "Starting dnsmasq...."
/usr/sbin/dnsmasq --user=root --no-daemon \
    --conf-file=${DNSMASQ_CONF} \
    --no-hosts --hostsdir=${HOSTS_D_PATH} \
    --resolv-file=${RESOLV_CONF} \
    --dhcp-hostsdir=${DHCP_HOSTS_D_PATH} \
    --dhcp-optsdir=${DHCP_OPTS_D_PATH} \
    --dhcp-leasefile=${DNSMASQ_HOME}/dnsmasq-dhcp.leases \
    --log-dhcp --log-queries --log-facility=${DNSMASQ_LOG}
