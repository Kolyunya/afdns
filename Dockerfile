# Version: 1.0.0
FROM debian:8.2
MAINTAINER Nikolay @Kolyunya Oleynikov
USER root
EXPOSE 53
RUN apt-get update
RUN apt-get install -y bind9
RUN apt-get install -y wget
RUN apt-get install -y cron
COPY scripts/afdns-update /etc/cron.daily/afdns-update
COPY scripts/afdns-update /usr/bin/afdns-update
COPY scripts/afdns-launch /usr/bin/afdns-launch
COPY configs/named.conf.options /etc/bind/named.conf.options
COPY configs/named.conf.local /etc/bind/named.conf.local
COPY configs/.blacklist.db /etc/bind/.blacklist.db
ENTRYPOINT afdns-update && service cron start && sh
