# Mac OS X Setup

This is what I install on my MacBookPro.

## Prerequisites

```sh
sudo xcode-select --install
mkdir -p ~/Github && cd ~/Github
git clone https://github.com/mehdicopter/macbook-setup && cd macbook-setup
```

## Bootstrap

```sh
export PATH=~/Library/Python/bin/3.8/bin:$PATH
make bootstrap
```

## Ansible

```sh
export WORKON_HOME=$HOME/.venv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source virtualenvwrapper.sh
workon
mkvirtualenv ansible
make ansible
```
