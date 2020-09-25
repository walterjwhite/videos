#!/bin/sh

. _LIBRARY_PATH/git-helpers/include.sh

# TODO: support video providers other than youtube
_VIDEO_BASE_PATH=~/videos
_PROJECT=$_VIDEO_BASE_PATH

trap _cleanup INT

_LOCKFILE=/tmp/$(basename $0).lock

_lock() {
  while [ -e $_LOCKFILE ]
  do
    echo "$_LOCKFILE exists, sleeping"
    sleep 5
  done

  touch $_LOCKFILE
}

_cleanup() {
  rm -f $_LOCKFILE
}

_target() {
  f=$_TARGET/$(date +%Y/%m/%d/%H.%M.%S)
}

_video_info() {
  local _f=$f
  if [ "$#" -gt "0" ]
  then
    _f=$1
  fi

  if [ -e $_f ]
  then
    echo $_f
    echo "$(sed -n 1p $_f) - $(sed -n 2p $_f) @ $(sed -n 3p $_f)"
  fi
}

_video_meta() {
  _URL=$(head -1 $f)
  _KEY=$(echo $_URL | sed -e "s/^.*\=//")
}

_videos_git() {
  _git "$_GIT_FILES" "$_TARGET - $(head -1 $f)"
}
