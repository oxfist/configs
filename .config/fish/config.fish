set fish_greeting
zoxide init fish | source
set -U fish_user_abbreviations 'll=ls -la --group-directories-first'

# Only if on Linux
eval (keychain --agents ssh --eval --quiet id_rsa)

if status is-interactive
    # Commands to run in interactive sessions can go here
end
