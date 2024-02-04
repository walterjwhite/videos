_clipboard_get() {
	xsel -bo
}

_clipboard_clear() {
	xsel -bc
}

_clipboard_copy() {
	_require "$1" "_clipboard_copy"

}
