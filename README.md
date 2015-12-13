# AdFree DNS server
A docker [container](https://hub.docker.com/r/kolyunya/afdns/) with a DNS server (BIND) configured to block ad hosts. Ad hosts list is retrieved from [here](https://github.com/StevenBlack/hosts) on a daily basis via a cron job.

## Installation
`docker run --detach --tty --publish=53:53/tcp --publish=53:53/udp --restart=always --name=afdns kolyunya/afdns`
