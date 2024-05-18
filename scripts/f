#!/usr/bin/env bash

# f - quickly find files and open then in vim.
#
# Author: Yago Furuta
# Email: yagofuruta@protonmail.com
#
#------------------------------------------------------------------------------
# This script uses fzf and vim to achieve it's goal.
#
# Exemple:
#   $ ./f .
#   This will use f in the current directory.
#------------------------------------------------------------------------------
# Testes in:
#   GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)

TARGET_DIR="$1"

[ $# -ne 1 ] && {
	TARGET_DIR="."
}

CURRENT_DIR=$(pwd)
cd "$TARGET_DIR"
FILE=$(fzf)
[[ "$(echo $?)" != "0" ]] && exit 1
$EDITOR $FILE
cd "$CURRENT_DIR"

