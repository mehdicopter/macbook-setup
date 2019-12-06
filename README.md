# Mac OS X Setup

This is what I install on my MacBookPro.

## Prerequisites

```sh
mkdir -p ~/{Github,Bitbucket,workspace}
```

## Homebrew

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Tools

```sh
brew install git
brew install gnu-sed
brew install vim
brew install screen
brew install p7zip
brew install tree
brew install mas
brew install jq
brew install mdcat
brew install htop
brew install fping
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json
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

## Terminal

```sh
brew cask install iterm2
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

## Dotfiles

```sh
brew install twpayne/taps/chezmoi
chezmoi init https://github.com/mehdicopter/dotfiles.git
chezmoi apply
chezmoi update
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
