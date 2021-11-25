#!/bin/sh

# emoji file
_unicode="${XDG_LOCAL_DATA:-$HOME/.local/data}/unicode"
_dir="$HOME/code/dmoji/"
_file='unicode_14.0'

[ -e "$_unicode" ] && _filepath="$_unicode" || _filepath="$_dir$_file"

# dmenu command
_dmenu="dmenu -l 20 -c -bw 2 -p dmoji"

_emoji=$(cut -d ';' -f1 $_filepath | $_dmenu | sed 's/ .*//')
echo $_emoji

[ -z "$_emoji" ] && exit

#notify-send -a dmoji copied "'$_emoji' copied."
xdotool type "$_emoji"


#if [ -n "$1" ]; then
#    xdotool type "$_emoji"
#else
#    printf "$_emoji" | xclip -selection clipboard
#    notify-send "'$_emoji' copied to clipboard." &
#fi
