set fish_greeting ""

clear && myfetch -c 8 -C " █"
starship init fish | source

if not status is-interactive
    return
end

alias s='clear && myfetch -i s -f -c 16 -C "  "'
alias pclean='sudo pacman -Rns (pacman -Qdtq)'
alias lsd='eza --icons'
alias grep='grep --color=auto'
alias fonts='fc-list -f "%{family}\n"'
alias bye='sudo shutdown -h now'
alias Docs="cd ~/Documents && nvim"
alias Settings="cd ~/.config/hypr && nvim"

set -gx NVM_DIR "$HOME/.nvm"
if test -s "$NVM_DIR/nvm.sh"
    bass source "$NVM_DIR/nvm.sh"
end

set -g PS1 "[\u@\h \W]\$ "
