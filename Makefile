.PHONY: install
install:
	docker build -t zoom .
	makepkg -sfi
