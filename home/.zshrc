export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

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

export EDITOR="nvim"
export VISUAL="nvim"

export MANPAGER="nvim +Man!"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias ls="eza --color=auto --icons"
alias l="eza -a --color=auto --icons"
alias la="eza -alh --color=auto --icons"

alias cat="bat"
alias rcat="cat"

cd() {
  __zoxide_z "$@" && ls
}

alias cp="cp -v"
alias mv="mv -v"

alias grep="rg -P -i --color=auto"

alias ip="ip -c=auto"

alias ff="kitten icat -n --place 30x30@0x2 --scale-up --align left ~/Downloads/bober-kurwa.gif | fastfetch --logo-width 30 --raw -"

alias neovim="nvim"
alias nano="nvim"
alias mini="nvim"

alias rm="trash"

alias shutdown="shutdown now"
alias reboot="shutdown -r now"

alias loginpi="ssh pipi4@192.168.11.128"

alias yay="paru"

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
  local before=$(df --output=used / | tail -n1)

  paccache -rk1
  sudo systemd-tmpfiles --clean
  sudo pacman -Scc --noconfirm
  paru -Scc --noconfirm
  sudo journalctl --vacuum-time=7d
  rm -rf ~/.cache/paru/clone/
  yes | trash-empty

  clear
  echo  'Wait briefly for disk IO to settle'
  sleep 1

  local after=$(df --output=used / | tail -n1)

  local freed_kb=$((before - after))
  local freed_hr=$(numfmt --to=iec --suffix=B <<< $((freed_kb * 1024)))

  clear
  echo "Cleanup complete. Freed $freed_hr."
}

wifi() {
  if [[ -z "$1" ]]; then
    echo "Usage: wifi <SSID>"
    return 1
  fi
  nmcli d wifi connect "$1"
}

zsh_install() {
  sudo pacman -S --needed neovim starship zoxide bat eza fastfetch trash-cli ripgrep pacman-contrib fzf fd
}

refresh() {
  source ~/.zshrc && exec zsh
}

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
