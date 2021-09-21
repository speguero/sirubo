
fname_bin=sirubo
fpath_bin=/usr/local/bin/$(fname_bin)
fpath_conf=/usr/local/etc/$(fname_bin).conf
fpath_ruleset=/usr/local/etc/$(fname_bin).ruleset
fname_service_linux=$(fname_bin).service
fpath_service_linux=/etc/systemd/system/$(fname_bin).service
os := $(shell uname -s)

install:
	touch "$(fpath_conf)"
	chown 0:0 "$(fpath_conf)"
	chmod u=rw,go= "$(fpath_conf)"
	
	cp -vf "$(fname_bin)" "$(fpath_bin)"
	chown 0:0 "$(fpath_bin)"
	chmod ugo=rx "$(fpath_bin)"

uninstall:
	-systemctl -q stop "$(fname_service_linux)"
	-systemctl -q disable "$(fname_service_linux)"
	systemctl -q daemon-reload
	-nft delete table inet "$(fname_bin)"
	rm -f "$(fpath_service_linux)"
	rm -f "$(fpath_bin)"

clean: uninstall
	rm -f "$(fpath_conf)"
	-rm -f "$(fpath_ruleset)"
	-rm -f "$(fpath_ruleset).backup"
