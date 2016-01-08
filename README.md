# AdFree DNS server
A docker [container](https://hub.docker.com/r/kolyunya/afdns/) with a DNS server (BIND) configured to block advertisement hosts. Advertisement hosts list is retrieved from [here](https://github.com/StevenBlack/hosts) on a daily basis and contains over 350,000 entries at the moment.

## Installation
Just start the container and you are good to go. No configuration is required.

`docker run --detach --tty --publish=53:53/tcp --publish=53:53/udp --restart=always --name=afdns kolyunya/afdns`

## Demo
Demo server is running at `46.101.57.91`.
