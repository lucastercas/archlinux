.PHONY: build clean

build:
	sudo ./build.sh -v

clean:
	sudo rm -rf work out AUR_BUILDER