#!/bin/zsh
SCRIPT_FILE=$0
SCRIPT_PATH=$(dirname $SCRIPT_FILE)
source ${SCRIPT_PATH}/base.zsh

TARGET="${HOME}/.vim"
link_dir ${0} ${TARGET}
