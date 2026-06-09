export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export TERM=xterm-256color

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob nomatch
unsetopt autocd beep notify
zstyle :compinstall filename '/home/mango/.zshrc'

autoload -Uz compinit
compinit

source "$HOME/options.conf"

export EDITOR="nvim"
export VISUAL="nvim"

export MANPAGER="nvim +Man!"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias ls="eza --color=auto --icons"
alias l="eza -a --color=auto --icons"
alias la="eza -alh --color=auto --icons"

alias p="python3"

alias cat="bat"
alias rcat="cat"

cd() {
  __zoxide_z "$@" && ls
}

alias cp="cp -v"
alias mv="mv -v"

alias grep="rg -P -i --color=auto"

alias ip="ip -c=auto"

alias ff="fastfetch"

alias neovim="nvim"
alias nano="nvim"
alias mini="nvim"
alias vim="nvim"
alias vi="nvim"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias rm="trash"

alias shutdown="shutdown now"
alias reboot="shutdown -r now"

alias unfuck_trackpad="sudo modprobe -r i2c_hid_acpi && sudo modprobe i2c_hid_acpi"

# Change these if you are not me
alias rpi="ssh $rpi"
alias nuc="ssh $nuc"

alias yay="paru"
alias pary="paru"

alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

whatip() {
  ip a | grep 'inet ' | grep -v '127.0.0.1' | awk '{split($2, a, "/"); print a[1]}'
}

cleantmp() {
  ~/.config/scripts/cleantmp.sh
}

zsh_install() {
  sudo pacman -S --needed neovim starship zoxide bat eza fastfetch trash-cli ripgrep pacman-contrib fzf fd
}

neovim_install() {
  sudo pacman -S --needed neovim lazygit luarocks npm typescript unzip minizip fzf 
}

refresh() {
  source ~/.zshrc && exec zsh
}

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
