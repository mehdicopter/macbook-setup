# Mac OS X Setup

This is what I install on my MacBookPro.

## Prerequisites

```sh
mkdir -p ~/{Github,Bitbucket}
```

## Homebrew

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install git zsh gnupg
```

## First

### Terminal

```sh
brew cask install iterm2
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
p10k configure
```

Customize `iTerm2` described [here](<https://github.com/MartinSeeler/iterm2-material-design>).

### Python3

```sh
brew install python
pip install -U pip
pip install virtualenv virtualenvwrapper
```

### Mac App Store

```sh
brew install mas
mas lucky clocker
```

### Password

```sh
brew 1password 1password-cli
```

## Google

```sh
brew cask install google-drive-file-stream google-chrome
```

### Google Cloud Platform

```sh
brew cask install google-cloud-sdk
gcloud auth login
gcloud components install kubectl
```

## GPG

```sh
brew install gnupg yubikey-personalization hopenpgp-tools ykman pinentry-mac
```

## Dotfiles

```sh
brew install twpayne/taps/chezmoi
chezmoi init https://github.com/mehdicopter/dotfiles.git
chezmoi apply
chezmoi update
```

## Visual Studio Code

```sh
brew cask install visual-studio-code
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension ms-python.python
code --install-extension vscode-icons-team.vscode-icons
code --install-extension mauve.terraform
```

## Tools

```sh
brew install gnu-sed
brew install vim
brew install screen
brew install tree
brew install jq
brew install mdcat
brew install htop
brew install fping
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json
brew install shellcheck
```

## Infnoise

```sh
brew install libftdi libusb
git clone https://github.com/13-37-org/infnoise ~/Github/infnoise
cd ~/Github/infnoise/software
gsed -i '/^FTDILOCL.*/a FTDILOC = \$(shell mdfind -name ftdi.h | tail -n 1)' Makefile.macos
make -f Makefile.macos
cp infnoise /usr/local/bin
```



## System Configuration

### Filevault/Firewall

```sh
# Enable Filevault for current user
sudo fdesetup enable -user $USER
# Enable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
# Turn log on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
# Stealth mode (do not respond to PING)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
# Disabled allow signed built-in applications automatically
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
# Disabled allow signed downloaded applications automatically
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off
# Restart firewall
sudo pkill -HUP socketfilterfw
```

### Computer Name

```sh
sudo scutil --set ComputerName MacBookPro
sudo scutil --set LocalHostName MacBookPro
```

### NTP

```sh
sudo systemsetup -setnetworktimeserver "time.euro.apple.com"
sudo systemsetup -setusingnetworktime on
echo "restrict default ignore" | sudo tee -a /etc/ntp.conf
```

### DNS

```sh
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | sudo tee -a /etc/hosts
```

### Screensaver

```sh
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
```

## Applications

```sh
# Homebrew
brew cask install dropbox
brew cask install whatsapp
brew cask install signal
brew cask install spotify
brew cask install skype
brew cask install keepingyouawake
brew cask install nightowl
brew cask install flux
brew cask install appcleaner
brew cask install slack
brew cask install vlc
brew cask install insomnia
brew cask install the-unarchiver
```

### Virtualization/Docker/Kubernetes

```sh
brew cask install virtualbox
brew cask install vagrant
brew install docker docker-machine docker-compose
docker-machine create --driver virtualbox default


brew install kubernetes-helm kubectl minikube
```

## Sources

<https://github.com/drduh/macOS-Security-and-Privacy-Guide>

<https://github.com/mas-cli/mas>

<https://github.com/moretension/duti>

<https://github.com/feross/spoof>

<https://github.com/0xmachos/mOSL>

<https://github.com/ernw/hardening/blob/master/operating_system/osx/10.14/ERNW_Hardening_OS_X_Mojave.md>

<https://github.com/twpayne/chezmoi/>

<https://github.com/MartinSeeler/iterm2-material-design>

<https://github.com/sindresorhus/quick-look-plugins>

<https://objective-see.com/products.html>
