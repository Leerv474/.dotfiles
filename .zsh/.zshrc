#
# ██╗░░░░░███████╗███████╗███╗░░██╗██╗░░░██╗██╗░░██╗  ███████╗░██████╗██╗░░██╗
# ██║░░░░░██╔════╝██╔════╝████╗░██║██║░░░██║╚██╗██╔╝  ╚════██║██╔════╝██║░░██║
# ██║░░░░░█████╗░░█████╗░░██╔██╗██║██║░░░██║░╚███╔╝░  ░░███╔═╝╚█████╗░███████║
# ██║░░░░░██╔══╝░░██╔══╝░░██║╚████║██║░░░██║░██╔██╗░  ██╔══╝░░░╚═══██╗██╔══██║
# ███████╗███████╗███████╗██║░╚███║╚██████╔╝██╔╝╚██╗  ███████╗██████╔╝██║░░██║
# ╚══════╝╚══════╝╚══════╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝  ╚══════╝╚═════╝░╚═╝░░╚═╝
#

### AUTOSTART
autoload -Uz compinit promptinit
compinit
promptinit
fastfetch

export LC_ALL=en_US.UTF-8
export EDITOR=nvim

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

### ALIASES
# scripts
alias psd="${HOME}/.dotfiles/scripts/psd.sh"
alias trash="${HOME}/.dotfiles/scripts/trash.sh"
alias quick-git="${HOME}/.dotfiles/scripts/quick-git.sh"
alias dupterm="${HOME}/.dotfiles/scripts/dupterm.sh"
alias note="${HOME}/.dotfiles/scripts/note.sh"
alias open="${HOME}/.dotfiles/scripts/open.sh"
alias todo="${HOME}/.dotfiles/scripts/todo.sh"
todo
alias translate="${HOME}/.dotfiles/scripts/translate.sh"

# directories
alias bmstu="cd ~/Documents/BMSTU"
alias downloads="cd ~/Downloads"
alias docs="cd ~/Documents"
alias javacourse="cd ~/Documents/LeeRV-JAVA314/module-5-spring"
alias config="cd ~/.config"
alias home="cd ~"
alias dotfiles="cd ~/.dotfiles"
alias projects="cd ~/Documents/projects"
alias practice="cd ~/Documents/practice"

# directory management
alias la='ls -ahq --color=auto --no-group'
alias ls='ls -hq --color=auto --no-group'
alias ..='cd ..'
alias ~='cd ~'
alias св='cd'

# file management
alias vim="nvim"
alias nv="nvim"
alias v="nvim"

# system management
alias :q="exit"
alias cdate='date "+%Y-%m-%d %A %H:%M"'
alias sd='shutdown now'
alias cls='clear'
alias ssh='kitten ssh'
alias cat='bat -p'
alias lg='lazygit'
alias py='python'
alias log-out="hyprctl dispatch exit"

usb() {
    sudo mount -o gid=users,fmask=113,dmask=002 $1 ~/media/usb
}

mkhtml() {
    mkdir -p $1/css
    touch $1/index.html
    touch $1/css/style.css
}

### INFO: ZSH settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

setopt nocaseglob
setopt autocd 
setopt globdots 
setopt nomatch 
setopt menucomplete
setopt interactive_comments

# ctrl+backspace to kill word
bindkey '^H' backward-kill-word
# unbind ctrl+t
bindkey -r '^S'

bindkey -e

stty stop undef
zle_highlight=('paste:none')
unsetopt BEEP
zstyle ':completion:*' menu select completer _history

source ~/.dotfiles/.zsh/fzf.zsh
source <(fzf --zsh)
