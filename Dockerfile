FROM haproxy:2.3.8-alpine

# OpenShift does not support USER 0 (root). Instead, it creates a random user (UID > 100000) and adds that user to the root group.
ENV USER 1001

USER root

# Copy Haproxy config
COPY ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
