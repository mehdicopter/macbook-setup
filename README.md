# Mac OS X Setup

Setup a MacBook Pro on Big Sur.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Bootstrap](#bootstrap)
- [iTerm2](#iterm2)

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

## iTerm2

### Installation

Open `Terminal`.

```sh
brew install --cask iterm2
```

### Configuration

1. Download [Material Design color scheme](<https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors>).
2. _iTerm2 > Preferences > Profiles > Colors Tab_
3. Click _Color Presets_
4. Click _Import_
5. Select the `material-design-colors.itermcolors` file
6. Select the _material-design-colors_ from _Load Presets_

```sh
curl --output ~/Downloads/material-design-colors.itermcolors https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors
```
