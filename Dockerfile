FROM debian:10

USER root

ENV AFDNS_BLACKLIST_AUTO /etc/bind/blacklist-auto.db
ENV AFDNS_BLACKLIST_MANUAL /etc/bind/blacklist-manual.db
ENV AFDNS_BLACKLIST_TEMPLATE /etc/bind/blacklist.db.template
ENV AFDNS_BLACKLIST_TEMPORARY /tmp/blacklist-temporary.db

EXPOSE 53/tcp
EXPOSE 53/udp

COPY scripts/* /usr/bin/
COPY configs/* /var/lib/afdns/

RUN afdns-install

ENTRYPOINT afdns-run
