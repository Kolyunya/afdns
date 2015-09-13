# AdFree DNS server
A docker container with a DNS server (BIND) configured to block ad hosts. Ad hosts list is retrieved from [pgl.yoyo.org](http://pgl.yoyo.org/as/) on a daily basis via a cron job.

The container [image](https://hub.docker.com/r/kolyunya/afdns/) is published in the docker hub and my be run using the command:

`docker run --detach --tty --publish=53:53/tcp --publish=53:53/udp --restart=always --name=afdns kolyunya/afdns`
