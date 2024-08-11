# use @<command> to supress make echoing command
CC = g++
LANG = cpp
CFLAGS = -g

OUT_FILE = Hello

default: build

install: build copy

test: build run

build: src/main.$(LANG)
	@if [ ! -d bin ]; then mkdir bin; fi
	$(CC) $(CFLAGS) src/main.$(LANG) -o bin/$(OUT_FILE)

copy: bin/$(OUT_FILE)
	cp -rf bin/$(OUT_FILE) /usr/bin

uninstall: bin/$(OUT_FILE)
	rm -f /usr/bin/$(OUT_FILE)

run:
	./bin/$(OUT_FILE)

clean veryclean:
	rm -f bin/*
