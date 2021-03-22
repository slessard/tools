#!/bin/zsh

# Find broken symbolic links on the current volume. Only look at files. directories, etc. and ignore devices.

find -x / -type l -fstype apfs | (while read FN ; do test -e "$FN" || ls -ld "$FN"; done) 
