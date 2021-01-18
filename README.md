# **asndrop**

`asndrop` is a firewall wrapper with an intended purpose of protecting one's privacy from big tech conglomerates, achieved by using your operating system's firewall to drop outgoing traffic to IP addresses that exist within the realm of their ASN subnetworks.

- [Install](#install)
- [Uninstall](#uninstall)
- [Arguments](#arguments)
- [To-Do](#to-do)
- [Contributing](#contributing)
- [License](#license)

## Install

__1)__ Install `asndrop` and its configuration file:

```
sudo make
```

__2)__ Edit the configuration file to add one ASN per line, such as "[AS15169](https://www.radb.net/query?keywords=AS15169)":

```
sudo $editor_of_choice /usr/local/etc/asndrop.conf
```

And ensure ASNs are listed in this fashion:

```
AS15169
AS123
AS456
```

__3)__ Create new firewall drop rules:

```
sudo asndrop create
```

__4)__ Ping a domain name whose IP address is part of a targeted ASN and verify it is being blocked:

```
ping -c 1 example.com
```

Which should display messages such as these:

```
icmp_seq=1 Destination Port Unreachable
ping: sendmsg: Operation not permitted
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0m
```

These messages indicate that outgoing traffic to `example.com` is being dropped.

## Uninstall

From this repository, run the following to remove `asndrop`:

```
make uninstall
```

Or run the following to remove both `asndrop` and its configuration file:

```
make clean
```

## Arguments

Arguments | Description
---       | ---
[none]    | Display help.
`help`    | Display help.
`create`  | Generate firewall drop rules.
`stop`    | Undo firewall drop rules.
`resume`  | Resume enforcement of cached firewall drop rules.

## To-Do

Access the [ticket tracker](https://todo.sr.ht/~speguero/tracker?search=label:%22todo%22%20%5Basndrop%5D) for details.

## Contributing

Contributions are welcome!

Submit __patches__ via email at [~speguero/patch@lists.sr.ht](mailto:~speguero/patch@lists.sr.ht) using [git-send-email](https://git-send-email.io). Include `[asndrop]` at the beginning of your subject line.

Submit __issue__, __question__ and __suggestion__ tickets as a [SourceHut registered user](https://todo.sr.ht/~speguero/tracker) or via email at [~speguero/tracker@todo.sr.ht](mailto:~speguero/tracker@todo.sr.ht). Include `[asndrop]` at the beginning of your subject line.

Items submitted to mirror repositories on GitHub and GitLab will be ignored.

## License

Access the `LICENSE` file for details.

