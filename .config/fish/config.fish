set fish_greeting
set -U fish_user_abbreviations 'll=ls -la --group-directories-first'

zoxide init fish | source
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
