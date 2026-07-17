# OH-MY-ZSH Config
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""                      # starship owns the prompt
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
DISABLE_MAGIC_FUNCTIONS="true"    # faster pasting

plugins=(git podman)

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

# NVM
export NVM_DIR="$HOME/.nvm"
    # 
    # [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# STARSHIP THEME — cached init (regenerates daily)
if [[ ! -f ~/.cache/starship_init.zsh ]] || [[ -n $(find ~/.cache/starship_init.zsh -mtime +1 2>/dev/null) ]]; then
  mkdir -p ~/.cache && starship init zsh >| ~/.cache/starship_init.zsh
fi
source ~/.cache/starship_init.zsh

# Set to use gke-glouc-auth-plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Set PATH to ~/.config/.scripts folder
export PATH=$PATH:~/.config/.scripts

# source ~/completion-for-pnpm.zsh

# Lazy terraform completion — only loads bashcompinit when terraform is first used
terraform() {
  unfunction terraform
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C /opt/homebrew/bin/terraform terraform
  command terraform "$@"
}

# opencode
export PATH=/Users/bockdar/.opencode/bin:$PATH

. "$HOME/.local/bin/env"
