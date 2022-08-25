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
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias kkd='kubectx PROCO-DEV; k9s'
alias kkt='kubectx PROCO-TEST; k9s'
alias kkp='kubectx PROCO-PROD; k9s'

# NVM
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bockdar/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bockdar/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bockdar/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bockdar/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# RUBY
export PATH="/usr/local/opt/ruby/bin:$PATH"

# STARSHIP THEME
eval "$(starship init zsh)"
