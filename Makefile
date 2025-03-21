FORMULA = Formula/icp-cli.rb

all: reinstall

reinstall:
	brew reinstall --build-from-source $(FORMULA)
