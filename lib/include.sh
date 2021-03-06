#!/bin/sh

. _LIBRARY_PATH_/git/include.sh

_PROJECT_PATH=_APPLICATION_DATA_PATH_
_PROJECT=data/_APPLICATION_NAME_

# TODO: move to configuration
_VIDEO_FORMAT=mp4
_AUDIO_FORMAT=ogg

_target() {
	date +%Y/%m/%d/%H.%M.%S
}

_video_info() {
	local _f=$f
	if [ "$#" -gt "0" ]; then
		_f=$1
	fi

	if [ -e $_f ]; then
		debug $_f
		info "$(sed -n 1p $_f) - $(sed -n 2p $_f) @ $(sed -n 3p $_f)"
	fi
}

_video_meta() {
	_URL=$(head -1 $f)
	_KEY=$(echo $_URL | sed -e "s/^.*\=//")
}

_videos_git() {
	_git "$_GIT_FILES" "$_ACTION - $(head -1 $f)"
}

_git_init
