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
brew cask install 1password 1password-cli
brew cask install whatsapp
brew cask install signal
brew cask install spotify
brew cask install android-file-transfer
brew cask install android-messages
brew cask install firefox
brew cask install skype
brew cask install keepingyouawake
brew cask install nightowl
brew cask install tunnelblick
brew cask install flux
brew cask install spectacle
brew cask install cyberduck
brew cask install appcleaner
brew cask install slack
brew cask install vlc
brew cask install transmission
brew cask install knockknock
brew cask install lulu
brew cask install oversight
brew cask install reikey
brew cask install do-not-disturb
# Apple Store
mas lucky tweetdeck
mas lucky clocker
```

## Sources

<https://github.com/drduh/macOS-Security-and-Privacy-Guide>

<https://github.com/mas-cli/mas>

<https://github.com/moretension/duti>

<https://github.com/feross/spoof>

<https://virtualenvwrapper.readthedocs.io/en/latest/install.html>

<https://github.com/0xmachos/mOSL>

<https://github.com/ernw/hardening/blob/master/operating_system/osx/10.14/ERNW_Hardening_OS_X_Mojave.md>

<https://github.com/twpayne/chezmoi/>

<https://github.com/MartinSeeler/iterm2-material-design>

<https://github.com/sindresorhus/quick-look-plugins>

<https://objective-see.com/products.html>
