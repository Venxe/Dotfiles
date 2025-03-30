set fish_greeting ""

clear && myfetch -c 8 -C " █"
starship init fish | source

if not status is-interactive
    return
end

alias lsd='eza --icons'
alias pacup='sudo pacman -Rns (pacman -Qdtq)'
alias grep='grep --color=auto'
alias pool='clear && asciiquarium'
alias f='clear && myfetch -i e -f -c 16 -C "  "'
alias bye='sudo shutdown -h now'
alias loop='sudo reboot'
alias h='dbus-launch Hyprland'
alias fonts='fc-list -f "%{family}\n"'
alias tasks='btm'
alias Docs="cd ~/Documents && nvim"
alias Settings="cd ~/.config/hypr && nvim"
alias spot="ncspot"
alias untar="tar -xf"
alias n="nvim"

set -gx NVM_DIR "$HOME/.nvm"
if test -s "$NVM_DIR/nvm.sh"
    bass source "$NVM_DIR/nvm.sh"
end

set -g PS1 "[\u@\h \W]\$ "

