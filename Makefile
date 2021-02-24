SHELL 				:= /bin/bash
HOMEBREW 			:= $$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
PYTHON_VERSION 		:= 3.8
PYTHON_PIP_BIN_PATH := ~/Library/Python/$(PYTHON_VERSION)/bin

bootstrap: get_homebrew get_python_pip install_virtualenv

get_homebrew:
	$(SHELL) -c "$(HOMEBREW)"

get_python_pip:
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm -f get-pip.py

install_virtualenv:
	pip3 install --user virtualenv virtualenvwrapper

ansible: install_ansible play_ansible

install_ansible:
	pip3 install -r ansible-requirements.txt
	ansible-galaxy install -r requirements.yml

play_ansible:
	ansible-playbook -v main.yml --ask-become-pass