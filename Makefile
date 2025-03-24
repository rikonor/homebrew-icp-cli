NAME    = icp-cli
FORMULA = Formula/icp-cli.rb

all: reinstall

reinstall:
	brew reinstall --build-from-source $(FORMULA)

uninstall:
	brew uninstall $(NAME)
