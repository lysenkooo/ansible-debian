# Debian Web Server Playbook

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

## Vagrant

Just run:

```sh
make vagrant
```

### Use custom playbook for Vagrant

If you want to use your custom playbook (eg. playbook.local.yml) then run:

```sh
PLAYBOOK=local make vagrant
```

## Let's Encrypt

To generate ssl certificate on host:

```sh
sudo certbot certonly --webroot -w /var/www/app/current/public -d example.com
```
