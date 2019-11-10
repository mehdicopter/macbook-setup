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
brew install duti
brew install mas
brew install jq
brew install bat
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
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro
brew cask install iterm2
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```