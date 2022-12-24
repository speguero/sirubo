<h1 align="center">sirubo</h1>

<p align="center">
        <em>ASN prefix (big tech conglomerate) outbound traffic blocker.</em>
</p>

<br>

<img src="img/header.gif" alt="" style="border: 10px solid black; border-radius: 5px; margin: auto; display: block;">

<br>

# Table of Contents


- [Usage](#usage)
- [Description](#description)
- [Requirements](#requirements)
- [Motive](#motive)
- [Name Origin](#name-origin)
- [Install](#install)
- [Uninstall](#uninstall)
- [Files](#files)
    - [Programs](#programs)
    - [Configurations](#configurations)
    - [Services](#services)
- [License](#license)

<br>

# Usage
```
sirubo create|resume|show|stop
```

<br>

  Command  | Description
  ---      | ---
  `create` | Create firewall ruleset and ruleset persistency service.
  `resume` | Resume enforcement of cached firewall ruleset and enable ruleset persistency service.
  `show`   | Show cached firewall ruleset.
  `stop`   | Disable cached firewall ruleset and ruleset persistency service.

<br>

# Description

The sirubo utility is a POSIX shell script that makes use of:

  - Transport-layer packet filtering; in particular, nftables on Linux
    and pf on OpenBSD, to facilitate the rejection of outgoing traffic
    to autonomous system network, or ASN, prefixes (subnets).

  - whois, to perform a query for ASN prefixes (subnets).

<br>

# Requirements

  Linux    | OpenBSD
  -----    | -------
  nftables | pf
  whois    | whois
  systemd  |

<br>

# Motive

Preventing passive and nonconsensual telemetry, and the infringement of
one's privacy thereafter, from intrusively inquisitive big tech
conglomerates, such as Meta (Facebook) and Alphabet (Google).

<br>

# Name Origin

Dissecting the etymology of sirubo (pronounced as <i>seer-rue-bow</i>), "<i>si</i>"
refers to the silicon chemical symbol of "<i>Si</i>", referencing Silicon Valley.
The word "<i>rubo</i>" derives from the Esperanto language, meaning "<i>trash</i>".

<br>

# Install

1. Install sirubo:
```
sudo make install
```

2. To illustrate, add the following ASN to /usr/local/etc/sirubo.conf:
```
AS32934 # Google
```

3. Create a new firewall ruleset:
```
sirubo create
```

4. Test your newly created firewall ruleset:
```
nc -vw 1 google.com 443
```

  The command should print a message similar to this:

  ```
  nc: connect to google.com (0.0.0.0) port 443 (tcp) failed: Connection refused
  ```

  This will indicate that your operating system firewall is configured
  to reject all outbound traffic directed at Google's ASN prefixes.

<br>

# Uninstall

1. Within this repository, uninstall sirubo:
```
make uninstall
```

   Or, optionally, uninstall sirubo and delete its configuration files:

   ```
   make clean
   ```

<br>

# Files

  ### Programs

  - `/usr/local/bin/sirubo` - The utility itself.


  ### Configurations

  - `/usr/local/etc/sirubo.conf` - Contains ASNs that you, the user, specify for
    rejection.
  - `/usr/local/etc/sirubo.ruleset` - Contains a cached firewall ruleset.
  - `/usr/local/etc/sirubo.ruleset.backup` - Contains a defunct firewall ruleset
    that is reserved as a backup when creating a new ruleset manually or
    automatically.


  ### Services

  - `/etc/systemd/system/sirubo.service` **(Linux)** - A service that facilitates
    firewall ruleset persistency and automatic ruleset updates with every
    operating system reboot.

  - `/etc/rc.d/sirubo` **(OpenBSD)** - A service that facilitates firewall ruleset
    persistency and automatic ruleset updates with every operating system
    reboot.

<br>

# License

See the `LICENSE` file for details.
