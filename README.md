# ansible-borg-backup-jail-setup

A repo for setting up a TrueNAS jail for running borg backup as client.

The scripts and playbooks in this repository are meant to be executed in the freebsd jail.

## Install

One-shot command to install curl and (because it is not provided by default) and then run the `install.sh` script

```sh
sh -c "env ASSUME_ALWAYS_YES=YES pkg bootstrap && \
       pkg update && \
       pkg install -y curl && \
       curl -Lo- https://raw.githubusercontent.com/mcflis/ansible-freebsd-jail-setup/main/install.sh | sh"
```

## Resources:

- [1] https://www.cyberciti.biz/faq/how-to-enable-sshd-on-freebsd-server-jail/
