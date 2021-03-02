#!/bin/sh

. _LIBRARY_PATH_/install/logging.sh

if [ $(env | grep -c ^OS=Windows.*$) -gt 0 ]; then
	warn "Unsupported"
elif [ $(uname | grep -c FreeBSD) -gt 0 ]; then
	pkg info -e npm

	if [ $? -eq 1 ]; then
		info "installing npm"
		$_SUDO_PROGRAM pkg install -y npm
	else
		warn "npm is already installed"
	fi

	npm list -g castnow >/dev/null

	if [ $? -eq 1 ]; then
		info "installing castnow"
		npm install -g castnow
	else
		warn "castnow is already installed"
	fi
else
	warn "Unsupported OS"
fi
