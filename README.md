# Mac OS X Setup

Setup a MacBook Pro on Big Sur.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Bootstrap](#bootstrap)

## Prerequisites

Make sure your MacBook is up-to-date.

Open `Terminal` App.

```sh
sudo softwareupdate --install --all --restart
```

> **_NOTE_**: This might restart your computer if required to complete the update.

```sh
sudo xcode-select --install
mkdir -p ~/Github && cd ~/Github
git clone https://github.com/mehdicopter/macbook-setup && cd macbook-setup
```

## Bootstrap

The `bootstrap` target will launch four differents targets which will install [Homebrew](<https://brew.sh/>), [Python Pip](<https://pypi.org/project/pip/>), [Virtualenv/Virtualenvwrapper](<https://virtualenvwrapper.readthedocs.io/en/latest/>) and [Oh My Zsh](<https://ohmyz.sh/>).

```sh
make bootstrap
```

Obviously you can run those targets one after the other.

```sh
make get_homebrew
make get_python_pip
make install_virtualenv
make ohmyzsh
```
