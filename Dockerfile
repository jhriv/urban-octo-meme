FROM registry.redhat.io/ubi8/ubi:latest

RUN dnf install --assumeyes ruby
RUN gem install rack

ADD config.ru /opt/hello/config.ru
ENTRYPOINT /usr/local/bin/rackup --host 0.0.0.0 /opt/hello/config.ru
EXPOSE 9292
