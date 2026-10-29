# Homebrew (macOS or Linuxbrew, whichever exists)
for brew_prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
  [[ -x $brew_prefix/bin/brew ]] && eval "$($brew_prefix/bin/brew shellenv)" && break
done
unset brew_prefix

# OH-MY-ZSH Config
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""                      # starship owns the prompt
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
DISABLE_MAGIC_FUNCTIONS="true"    # faster pasting

plugins=(git)
(( $+commands[docker] )) && plugins+=(docker)
(( $+commands[podman] )) && plugins+=(podman)

source $ZSH/oh-my-zsh.sh

# Aliases
alias zshconfig="cat ~/.zshrc"
alias ohmyzsh="cat ~/.oh-my-zsh"
alias kkd='kubectx proco-dev; k9s'
alias kki='kubectx proco-int; k9s'
alias kkq='kubectx proco-qa; k9s'
alias kkp='kubectx proco-prod; k9s'
alias pn=pnpm
alias work='cd ~/dev/mediamarktsaturn/proco-frontend'
alias kerygma='cd ~/dev/darikletter/kerygma-live-translation'
alias load-nvm='export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm'

# GPG
## Ref.: https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

# SSH agent — start one when the system does not provide it (e.g. WSL)
if [[ -z $SSH_AUTH_SOCK ]]; then
  export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"
  ssh-add -l &>/dev/null
  if (( $? == 2 )); then
    mkdir -p -m 0700 "$HOME/.ssh" && rm -f "$SSH_AUTH_SOCK"
    eval "$(ssh-agent -a "$SSH_AUTH_SOCK")" >/dev/null
  fi
fi

# NVM
export NVM_DIR="$HOME/.nvm"

# STARSHIP THEME — cached init (regenerates daily)
if [[ ! -f ~/.cache/starship_init.zsh ]] || [[ -n $(find ~/.cache/starship_init.zsh -mtime +1 2>/dev/null) ]]; then
  mkdir -p ~/.cache && starship init zsh >| ~/.cache/starship_init.zsh
fi
source ~/.cache/starship_init.zsh

# Set to use gke-glouc-auth-plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Set PATH to ~/.config/.scripts folder
export PATH=$PATH:~/.config/.scripts

# Lazy terraform completion — only loads bashcompinit when terraform is first used
if (( $+commands[terraform] )); then
  terraform() {
    unfunction terraform
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C "$(whence -p terraform)" terraform
    command terraform "$@"
  }
fi

# opencode
[[ -d $HOME/.opencode/bin ]] && path=($HOME/.opencode/bin $path)

[[ -f $HOME/.local/bin/env ]] && . "$HOME/.local/bin/env"

# Machine-specific settings, never tracked
[[ -f $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"

# Add bin to PATH
export PATH="$HOME/.local/bin:$PATH"
