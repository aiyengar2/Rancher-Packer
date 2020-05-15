#!/bin/sh -eux

echo -e "packerbuilt ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers

# if [ 'There are no package locks defined.' == $(zypper locks | grep package) ]; then
#   echo 'Doing nothing';
# else
#   zypper --non-interactive ll | grep package | awk -F\| '{ print $2 }' | xargs -n 20 zypper -n rl;
# fi

zypper clean
find /var/log -type f -exec truncate --size=0 {} \;
rm -rf /tmp/* /var/tmp/*
rm -f /root/.wget-hsts
export HISTSIZE=0


# # set a default HOME_DIR environment variable if not set
# HOME_DIR="${HOME_DIR:-/home/vagrant}";

# pubkey_url="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub";
# mkdir -p $HOME_DIR/.ssh;
# if command -v wget >/dev/null 2>&1; then
#     wget --no-check-certificate "$pubkey_url" -O $HOME_DIR/.ssh/authorized_keys;
# elif command -v curl >/dev/null 2>&1; then
#     curl --insecure --location "$pubkey_url" > $HOME_DIR/.ssh/authorized_keys;
# elif command -v fetch >/dev/null 2>&1; then
#     fetch -am -o $HOME_DIR/.ssh/authorized_keys "$pubkey_url";
# else
#     echo "Cannot download vagrant public key";
#     exit 1;
# fi
# chown -R vagrant $HOME_DIR/.ssh;
# chmod -R go-rwsx $HOME_DIR/.ssh;