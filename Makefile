fname_bin=sirubo
fpath_bin=/usr/local/bin/$(fname_bin)
dpath_conf=/usr/local/etc
fpath_conf=$(dpath_conf)/$(fname_bin).conf
fpath_ruleset=$(dpath_conf)/$(fname_bin).ruleset
fname_service_linux=$(fname_bin).service
fpath_service_linux=/etc/systemd/system/$(fname_bin).service
fpath_service_openbsd=/etc/rc.d/$(fname_bin)
dpath_doc=/usr/local/share/doc
fpath_doc=/usr/local/share/doc/$(fname_bin)/README.md
os := $(shell uname -s)

install:

	@# Configuration

	if ! [ -d "$(dpath_conf)" ]; then \
		mkdir -p "$(dpath_conf)"; \
		chown 0:0 "$(dpath_conf)"; \
		chmod u=rwx,go=rx "$(dpath_conf)"; \
	fi

	touch "$(fpath_conf)"
	chown 0:0 "$(fpath_conf)"
	chmod u=rw,go= "$(fpath_conf)"

	@# Program
	
	cp -vf "$(fname_bin)" "$(fpath_bin)"
	chown 0:0 "$(fpath_bin)"
	chmod ugo=rx "$(fpath_bin)"

	@# Documentation

	if ! [ -d "$(dpath_doc)" ]; then \
		mkdir "$(dpath_doc)"; \
		mkdir "$(dpath_doc)/$(fname_bin)"; \
		chown -R 0:0 "$(dpath_doc)"; \
		chmod u=rwx,go=rx "$(dpath_doc)"; \
	fi

	cp -vf "README.md" "$(fpath_doc)"
	chown 0:0 "$(fpath_doc)"
	chmod ugo=r "$(fpath_doc)"

uninstall:

ifeq ($(os), Linux)
	-systemctl -q stop "$(fname_service_linux)"
	-systemctl -q disable "$(fname_service_linux)"
	systemctl -q daemon-reload
	-nft delete table inet "$(fname_bin)"
	rm -f "$(fpath_service_linux)"
endif

ifeq ($(os), OpenBSD)
	-rcctl disable "$(fname_bin)"
	-pfctl -a "$(fname_bin)" -F rules > /dev/null 2>&1
	rm -f "$(fpath_service_openbsd)"
endif

	rm -f "$(fpath_bin)"
	rm -rf "$(dpath_doc)"

clean: uninstall

	rm -f "$(fpath_conf)"
	-rm -f "$(fpath_ruleset)"
	-rm -f "$(fpath_ruleset).backup"
