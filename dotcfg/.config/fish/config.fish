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

set -gx NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
set -gx NNN_FIFO "/tmp/nnn.fifo" 
set -gx NNN_PLUG "p:preview-tui"

set -gx NVM_DIR "$HOME/.nvm"
if test -s "$NVM_DIR/nvm.sh"
    bass source "$NVM_DIR/nvm.sh"
end
