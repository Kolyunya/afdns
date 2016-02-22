# Version: 1.0.0
FROM debian:8.2
MAINTAINER Nikolay @Kolyunya Oleynikov
USER root
EXPOSE 53
RUN apt-get update
RUN apt-get install -y bind9
RUN apt-get install -y wget
RUN apt-get install -y cron
COPY scripts/* /usr/bin/
COPY configs/* /etc/bind/
COPY scripts/afdns-update /etc/cron.daily/afdns-update
ENTRYPOINT afdns-initialize
