# Ad free DNS server

## Description
A docker [container](https://hub.docker.com/r/kolyunya/afdns/) with a DNS server configured to block advertisement hosts.

## Installation
Just start the container and you are good to go. No configuration is required.

`docker run --detach --tty --net=host --restart=always --name=afdns kolyunya/afdns`

## Custom blacklist management
You can add and remove hosts to a custom blacklist. You can also backup the entire blacklist.

The following command will add `foo.bar` to the custom blacklist.

`docker exec afdns afdns-host-add foo.bar`

The following command will remove `foo.bar` from the custom blacklist.

`docker exec afdns afdns-host-remove foo.bar`

The following command will send the entire blacklist to the `stdout`.

`docker exec afdns afdns-blacklist-backup`

Blacklist restoration is not yet implemented.

## Configuration details
* DNS server utilized in this container is `BIND 9`.
* Advertisement hosts list is retrieved from [here](https://github.com/StevenBlack/hosts) on a daily basis and contains over 27,000 entries at the moment.
* All non-advertisement request are forwarded to `8.8.8.8` and `8.8.4.4`.
* Response rate limit is set to `8` per second (to mitigate DNS amplification attack).

## Demo server
Demo server is running at `46.101.57.91`.
