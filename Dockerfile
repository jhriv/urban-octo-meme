ARG repository=jhriv/urban-octo-meme
FROM $repository

LABEL author="John H. Robinson, IV <jhriv@ucla.edu>"
LABEL description="RHEL Subscritopn Manager for UBI proof-of-concept"

COPY config.ru /opt/hello/config.ru
ENTRYPOINT /usr/local/bin/rackup --host 0.0.0.0 /opt/hello/config.ru
EXPOSE 9292
