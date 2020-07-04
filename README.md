# **asnreject**

`asnreject` is an `iptables` wrapper that rejects outgoing traffic to ASN IP addresses.

This project was created specifically to block ASNs (allocated IPv4 and IPv6 addresses) of big tech companies. `asnreject` grants users the power to seamlessly stop their invasive tracking practices at the operating system firewall level and claim back their privacy.

- [Install](#install)
- [Uninstall](#uninstall)
- [Arguments](#arguments)
- [To-Do](#to-do)
- [Contributing](#contributing)
- [License](#license)

## Install

__1)__ Install `asnreject` and its configuration file:

```
sudo make
```

__2)__ Edit the configuration file to add one ASN per line, such as "[AS15169](https://www.radb.net/query?keywords=AS15169)":

```
sudo $editor_of_choice /usr/local/etc/asnreject.conf
```

And ensure ASNs are listed in this fashion:

```
AS15169
AS123
AS456
```

__3)__ Create new firewall reject rules:

```
sudo asnreject create
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

These messages indicate that outgoing traffic to `example.com` is being rejected.

## Uninstall

From this repository, run the following to remove `asnreject`:

```
make uninstall
```

Or run the following to remove both `asnreject` and its configuration file:

```
make clean
```

## Arguments

Arguments | Description
---       | ---
[none]    | Display help.
`create`  | Query ASN(s) for IP subnetworks and create new firewall reject rules.
`delete`  | Delete firewall reject rules.
`stop`    | Temporarily disregard current firewall reject rules.
`resume`  | Reinstate current firewall reject rules.

## To-Do

Access the [ticket tracker](https://todo.sr.ht/~speguero/tracker?search=label:%22todo%22%20%5Basnreject%5D) for details.

## Contributing

Contributions are welcome!

Submit __patches__ via email at [~speguero/patch@lists.sr.ht](mailto:~speguero/patch@lists.sr.ht) using [git-send-email](https://git-send-email.io). Include `[asnreject]` at the beginning of your subject line.

Submit __issue__, __question__ and __suggestion__ tickets as a [SourceHut registered user](https://todo.sr.ht/~speguero/tracker) or via email at [~speguero/tracker@todo.sr.ht](mailto:~speguero/tracker@todo.sr.ht). Include `[asnreject]` at the beginning of your subject line.

Items submitted to mirror repositories on GitHub and GitLab will be ignored.

## License

Access the `LICENSE` file for details.

