# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename $HOME:/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/antigen-hs/init.zsh
source ~/.zsh/aliases.zsh
source "$HOME/.nvm/nvm.sh"  # This loads nvm
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export GOPATH=$HOME/code/gopath

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/localbins
export PATH=$HOME/.npm/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$GOPATH/bin:$PATH

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.zshrc-local
