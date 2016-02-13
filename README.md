# Ad free DNS server

## Description
A docker [container](https://hub.docker.com/r/kolyunya/afdns/) with a DNS server configured to block advertisement hosts.

## Installation
Just start the container and you are good to go. No configuration is required.

`docker run --detach --tty --publish=53:53/tcp --publish=53:53/udp --restart=always --name=afdns kolyunya/afdns`

## Configuration details
* DNS server utilized in this container is `BIND 9`.
* Advertisement hosts list is retrieved from [here](https://github.com/StevenBlack/hosts) on a daily basis and contains over 27,000 entries at the moment.
* All non-advertisement request are forwarded to `8.8.8.8` and `8.8.4.4`.
* Response rate limit is set to `8` per second (to mitigate DNS amplification attack).

## Demo server
Demo server is running at `46.101.57.91`.
