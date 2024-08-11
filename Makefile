# use @<command> to supress make echoing command
CC = g++
LANG = cpp
CFLAGS = -g

OUT_FILE = Hello

TERM_WIDTH = $$(tput cols)

default: all

all: build install

test: build run

build: src/main.$(LANG)
	@if [ ! -d bin ]; then mkdir bin; fi
	@$(CC) $(CFLAGS) src/main.$(LANG) -o bin/$(OUT_FILE)
	@echo -e "\x1b[92mCompiled\x1b[m bin/$(OUT_FILE)"

install: bin/$(OUT_FILE)
	@echo -e "\x1b[94mInstalling\x1b[m bin/$(OUT_FILE)"
	@sudo cp -rf bin/$(OUT_FILE) /usr/bin
	@echo -e "\x1b[92mInstalled\x1b[m $(OUT_FILE)"

uninstall: bin/$(OUT_FILE)
	@sudo rm -f /usr/bin/$(OUT_FILE)
	@echo -e "\x1b[91mUninstalled \x1b[m$(OUT_FILE)"

run:
	@echo -en "\x1b[94m"
	@yes "=" | head -n $(TERM_WIDTH) | tr -d "\n"
	@echo -en "\x1b[m"
	@./bin/$(OUT_FILE)

clean veryclean:
	@rm -f bin/*
	@echo -e "\x1b[91mCleaned \x1b[mbin/"
