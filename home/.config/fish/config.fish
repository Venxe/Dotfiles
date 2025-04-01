set fish_greeting ""

clear && myfetch -c 8 -C " █"
starship init fish | source

if not status is-interactive
    return
end

alias lsd='eza --icons'
alias pacup='sudo pacman -Rns (pacman -Qdtq)'
alias grep='grep --color=auto'
alias s='clear && myfetch -i s -f -c 16 -C "  "'
alias bye='sudo shutdown -h now'
alias fonts='fc-list -f "%{family}\n"'
alias Docs="cd ~/Documents && nvim"
alias Settings="cd ~/.config/hypr && nvim"

set -gx NVM_DIR "$HOME/.nvm"
if test -s "$NVM_DIR/nvm.sh"
    bass source "$NVM_DIR/nvm.sh"
end

set -g PS1 "[\u@\h \W]\$ "

