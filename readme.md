# Ad free DNS server

## Description
A docker [container](https://hub.docker.com/r/kolyunya/afdns/) with a DNS server configured to block advertisement hosts.

## Installation
Just start the container and you are good to go. Absolutely no configuration is required.

If you have `docker-compose`:
```sh
docker-compose up --detach
```

If you only have `docker`:
```sh
docker run \
    --name=afdns \
    --publish=53:53/tcp \
    --publish=53:53/udp \
    --restart=always \
    --tty \
    --detach \
    kolyunya/afdns
```

## Automatic blacklist source selection
You can select the source to get automatic blacklist from. After running any of the following commands the automatic blacklist will be updated and the corresponding source will be set as default. The following updates via cron job will use that source.

* `docker exec afdns afdns-update-ahf` - update automatic blacklist from [amalgamated hosts file](https://github.com/StevenBlack/hosts).
* `docker exec afdns afdns-update-hph` - update automatic blacklist from [hpHosts](http://hosts-file.net/).

## Custom blacklist management
The server also has a manual blacklist. The following commands let you manage it.
* `docker exec afdns afdns-host-add ad.example.com` -  add `ad.example.com` to the manual blacklist.
* `docker exec afdns afdns-host-remove ad.example.com` - remove `ad.example.com` from the manual blacklist.

## Default configuration details
* DNS server utilized in this container is `BIND 9`.
* Automatic blacklist is retrieved from [amalgamated hosts file](https://github.com/StevenBlack/hosts) once a day.
* All non-advertisement request are forwarded to `8.8.8.8` and `8.8.4.4`.
* Response rate limit is set to `8` per second (to mitigate DNS amplification attack).

## Demo server
Demo server is running at `188.166.168.121`.

## Ad free VPN
This DNS server is incorporated in the [ad free VPN server](https://github.com/Kolyunya/afvpn).
