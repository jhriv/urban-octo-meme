# syntax=docker/dockerfile:experimental

FROM registry.redhat.io/ubi8/ubi:latest

LABEL author="John H. Robinson, IV <jhriv@ucla.edu>"
LABEL description="RHEL Subscritopn Manager for UBI proof-of-concept"

COPY subscribe.sh /root/subscribe.sh
RUN --mount=type=secret,id=rhsm /root/subscribe.sh
RUN rm /root/subscribe.sh

# bash-completion is part of rhel-8-for-x86_64-baseos-rpms
RUN dnf install --assumeyes bash-completion

RUN dnf install --assumeyes ruby
RUN gem install rack

RUN subscription-manager unregister

COPY config.ru /opt/hello/config.ru
ENTRYPOINT /usr/local/bin/rackup --host 0.0.0.0 /opt/hello/config.ru
EXPOSE 9292
