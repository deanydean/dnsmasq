# dnsmasq
Simple dnsmasq docker image

## Build

To build the dnsmasq image:

```
$ make build
```

## Run

To run the dnsmasq container:

```
$ make run
```

## Customized Images

To create a customized image, add your own config files:

```
$ cat my-dnsmasq-image/Dockerfile
#
# Dockerfile for my-dnsmasq-image
#
FROM deanydean/dnsmasq:latest

# Remove the defaults (only needed if you're replacing everything)
RUN rm -rf /srv/dnsmasq/*

# My specific config
ADD etc/dnsmasq.conf /srv/dnsmasq/dnsmasq.conf
ADD etc/resolv.conf /srv/dnsmasq/etc/resolv.conf
ADD hosts.d /srv/dnsmasq/hosts.d
ADD dhcp.opts.d /srv/dnsmasq/dhcp.opts.d
ADD dhcp.hosts.d /srv/dnsmasq/dhcp.hosts.d
```

then build and run your image: 

```
$ cd my-dnsmasq-image
$ docker build -t my-dnsmasq-image .
$ docker run --rm -it -p 53:53/tcp -p 53:53/udp -p 67:67/udp -p 68:68/udp my-dnsmasq-image
```
