SHELL 				:= /bin/bash
HOMEBREW 			:= $$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
OHMYZSH 			:= $$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)

bootstrap: get_homebrew get_python_pip install_virtualenv ohmyzsh

get_homebrew:
	@test -f /usr/local/bin/brew && echo "Homebrew is already installed." || $(SHELL) -c "$(HOMEBREW)"

get_python_pip:
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm -f get-pip.py
	python3 -m pip install --upgrade --user pip

install_virtualenv:
	python3 -m pip install --user virtualenv virtualenvwrapper

ohmyzsh:
	@test -d $(HOME)/.oh-my-zsh && echo "Oh-my-zsh already exists." || $(SHELL) -c "$(OHMYZSH)"
