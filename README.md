# Debian Web Server Playbook

Clone this repo to your local machine with submodules:

```sh
git clone https://github.com/lysenkooo/ansible-debian.git
```

## Vagrant

Just run:

```sh
make vagrant
```

## Production

Run on the remote machine:

```sh
# useradd -m -s /bin/bash deploy
# passwd deploy
# apt-get update
# apt-get upgrade
# apt-get install sudo
# echo 'deploy ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/deploy
```

Then on local machine:

```sh
$ ssh-copy-id deploy@hostname
$ make provision
```

## Let's Encrypt

To generate ssl certificate on host:

```sh
sudo certbot certonly --webroot -w /var/www/app/current/public -d example.com
```
