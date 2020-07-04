
FILE_BIN=asnreject
PATH_BIN=/usr/local/bin/$(FILE_BIN)
PATH_CONFIG=/usr/local/etc/$(FILE_BIN).conf

install:
	umask u=rw,go=r

	cp -vf "$(FILE_BIN)" "$(PATH_BIN)"
	chown 0:0 "$(PATH_BIN)"
	chmod u=rx,go= "$(PATH_BIN)"
	touch "$(PATH_CONFIG)"

uninstall:
	rm -f "$(PATH_BIN)"

clean: uninstall
	rm -f "$(PATH_CONFIG)"

