FROM debian:8.2
USER root
EXPOSE 53/udp
EXPOSE 53/tcp
COPY scripts/* /usr/bin/
COPY configs/* /etc/bind/
RUN afdns-install
ENTRYPOINT afdns-start && sh
