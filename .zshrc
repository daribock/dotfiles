# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-15-openjdk-amd64
export JAVA_PATH=$PATH:$JAVA_HOME/bin

# Path to your oh-my-zsh installation.
export ZSH="/home/daribock/.oh-my-zsh"

# Path to nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Path to balena-cli
export export PATH=$PATH:/opt/balena-cli

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose node yarn npm pip cargo)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [ -n $SSH_CONNECTION ]; then
   export EDITOR='vim'
fi

SPACESHIP_BATTERY_SHOW=false
