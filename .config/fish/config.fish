set fish_greeting
eval (keychain --agents ssh --eval --quiet id_rsa)
set -gx PATH $PATH /var/lib/snapd/snap/bin
set -U fish_user_abbreviations 'll=ls -la --group-directories-first'
zoxide init fish | source
