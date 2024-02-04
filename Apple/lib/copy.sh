_clipboard_get() {
	pbpaste
}

_clipboard_clear() {
	pbcopy </dev/null
}

_clipboard_copy() {
	_require "$1" "_clipboard_copy"

	pbcopy $1
}
