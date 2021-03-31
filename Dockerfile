FROM haproxy:2.3.8-alpine

COPY ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

# OpenShift does not support the root user. Instead, OpenShift creates a random user and adds that user to the root group. Finally it executes the docker container as this random user.
# For this to work we need to make the docker container execute as an non-root user. The user ID we assign here is chosen at random (it will anyway be overwritten).
# Also we need to make sure all our source files are readable, writable & executable for the root user.
# Source: https://docs.openshift.com/container-platform/3.11/creating_images/guidelines.html
RUN chgrp -R 0 /usr/local/etc/haproxy && \
    chmod -R g+rwX /usr/local/etc/haproxy
USER 1001
