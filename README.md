# ansible-freebsd-jail-setup

A repo for setting up ansible and ssh in a TrueNAS/FreeBSD jail.

The scripts and playbooks in this repository are meant to be executed in the freebsd jail.

## Install

One-shot command to install curl, enable SSH and set up an ansible user with password-less sudo privileges

```sh
sh -c "env ASSUME_ALWAYS_YES=YES pkg bootstrap && \
       pkg update && \
       pkg install -y curl && \
       curl -Lo- https://raw.githubusercontent.com/mcflis/ansible-freebsd-jail-setup/main/install.sh | sh"
```

## Resources:

- [1] https://www.cyberciti.biz/faq/how-to-enable-sshd-on-freebsd-server-jail/
