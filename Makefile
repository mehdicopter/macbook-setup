SHELL 				:= /bin/bash
HOMEBREW 			:= $$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)

get_homebrew:
	$(SHELL) -c "$(HOMEBREW)"