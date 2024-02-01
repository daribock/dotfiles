# OH-MY-ZSH Config
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="amuse"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker node)

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

# GPG
## Ref.: https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

# NVM
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# RUBY
export PATH="/usr/local/opt/ruby/bin:$PATH"

# STARSHIP THEME
eval "$(starship init zsh)"

# Set JAVA version to openjdk 17
export JAVA_HOME=`/usr/libexec/java_home -v 17.0`

# Set to use gke-glouc-auth-plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

source /Users/bockdar/.docker/init-zsh.sh || true # Added by Docker Desktop

# Set PATH to ~/.config/.scripts folder
export PATH=$PATH:~/.config/.scripts
