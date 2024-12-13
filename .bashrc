# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="eza"
alias cat="bat"
alias ll="ls -l --color"
alias grep="grep --color=auto"
alias k="kubectl"
alias vi="nvim"

export PATH="$PATH:$HOME/go/bin:${KREW_ROOT:-$HOME/.krew}/bin:$HOME/.local/bin"
export EDITOR="vi"
export PASSWORD_STORE_DIR="$HOME/github.com/yagoyudi/pass";
export KUBECONFIG="$HOME/homelab/z/kubeconfig"
export TALOSCONFIG="$HOME/homelab/z/talosconfig.yaml"

source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

eval "$(starship init bash)"
