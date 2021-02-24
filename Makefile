SHELL 				:= /bin/bash
HOMEBREW 			:= $$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
PYTHON_VERSION 		:= 3.8
PYTHON_PIP_BIN_PATH := ~/Library/Python/$(PYTHON_VERSION)/bin

get_homebrew:
	$(SHELL) -c "$(HOMEBREW)"

get_python_pip:
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm -f get-pip.py