# Mac OS X Setup

Setup a MacBook Pro on Big Sur.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Bootstrap](#bootstrap)
- [iTerm2](#iterm2)
- [Ansible](#ansible)
- [Google Cloud SDK](#google-cloud-sdk)
- [Visual Studio Code](#visual-studio-code)

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
3. Click _Color Presets..._
4. Click _Import..._
5. Select the `material-design-colors.itermcolors` file
6. Select now the _material-design-colors_

```sh
curl --output ~/Downloads/material-design-colors.itermcolors https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors
```

### Powerlevel10k

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
brew install gnu-sed
gsed -ri 's#(^ZSH_THEME=)(\"robbyrussell\")#\1\"powerlevel10k/powerlevel10k\"#g' ~/.zshrc
source ~/.zshrc
```

### Dotfiles

```sh
brew install chezmoi
chezmoi init --apply mehdicopter
```

## Ansible

### Prerequisites

```sh
export WORKON_HOME=$HOME/.venv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source virtualenvwrapper.sh
workon
mkvirtualenv ansible
```

### Installation

```sh
make install_ansible
```

### Usage

```sh
ansible-playbook -v main.yml -i hosts --ask-become-pass
```

## Google Cloud SDK

### Installation

```sh
brew install --cask google-cloud-sdk
```

> **_NOTE_**: The installation has already been done by running the Ansible playbook.

### Components

```sh
gcloud components install kubectl
```

## Visual Studio Code

### Installation

```sh
brew install --cask visual-studio-code
```

> **_NOTE_**: The installation has already been done by running the Ansible playbook.

### Extensions

- [wayou.vscode-todo-highlight](<https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight>)
- [vscode-icons-team.vscode-icons](<https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons>)
- [DavidAnson.vscode-markdownlint](<https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint>)
- [HashiCorp.terraform](<https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform>)
- [esbenp.prettier-vscode](<https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode>)
- [bierner.markdown-emoji](<https://marketplace.visualstudio.com/items?itemName=bierner.markdown-emoji>)
- [redhat.vscode-yaml](<https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml>)
- [ms-kubernetes-tools.vscode-kubernetes-tools](<https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools>)
- [ms-python.python](<https://marketplace.visualstudio.com/items?itemName=ms-python.python>)
- [MS-vsliveshare.vsliveshare-pack](<https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare-pack>)
- [lunarlimbo.banner-comments-plus](<https://marketplace.visualstudio.com/items?itemName=lunarlimbo.banner-comments-plus>)

```sh
code --install-extension <EXTENSION_ID>
```

## Yubikey

### Infnoise

```sh
brew install libftdi libusb
cd Github && git clone https://github.com/13-37-org/infnoise.git
cd infnoise/software
gsed -i '/^FTDILOCL.*/a FTDILOC = \$(shell mdfind -name ftdi.h | tail -n 1)' Makefile.macos
make -f Makefile.macos
cp infnoise /usr/local/bin
sudo infnoise > /dev/random
```
