#!/usr/bin/env sh

set -e

VERSION=${VERSION-main}
REPO_URL="https://github.com/mcflis/ansible-freebsd-jail-setup/archive/$VERSION.zip"

echo "[Stage] bootstrap"
env ASSUME_ALWAYS_YES=YES pkg bootstrap
echo ""

echo ""
echo "[Stage] ansible-dependencies"
pkg update
pkg install -y py37-ansible
echo ""

echo ""
echo "[Stage] repository"
echo "Creating temporary directory"
prefix="ansible-setup-$(echo "$VERSION" | sed -e 's/[^A-Za-z0-9._-]/_/g')"
tempdir=$(mktemp -dt "$prefix")
archive="$tempdir/$prefix.zip"
echo "Temporary directory: $tempdir"
echo "Downloading repo from $REPO_URL"
curl "$REPO_URL" -Lo "$archive"
unzip "$archive" -jd "$tempdir"
ANSIBLE_CFG="$tempdir/ansible.cfg"
export ANSIBLE_CFG
echo ""

echo ""
echo "[Stage] ansible-ping"
ansible -m ping -c local localhost
echo ""

echo ""
echo "[Stage] ansible-ping"
ansible-playbook "$tempdir/main.yml"
echo ""

echo "[Stage] cleanup"
rm -rf "$tempdir"
echo ""
