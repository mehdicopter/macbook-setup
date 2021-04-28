SHELL 				:= /bin/bash
HOMEBREW 			:= $$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)

get_homebrew:
	$(SHELL) -c "$(HOMEBREW)"

get_python_pip:
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm -f get-pip.py
	python3 -m pip install --upgrade --user pip

install_virtualenv:
	python3 -m pip install --user virtualenv virtualenvwrapper
