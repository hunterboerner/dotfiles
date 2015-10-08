# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
set fish_color_command green
set fish_color_param white
set --universal fish_user_paths $fish_user_paths $HOME/bin
# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Plugin "rvm"

alias g=git
alias gb='git branch'
alias gco='git checkout'
alias gcs='git show'
alias gs='git status -sb'
alias git=hub
alias gz='tar -zcvf'
alias l=less
alias less='less -r'
alias lh='ls -alt | head'
alias ll='ls -alGh'
alias ls='ls -Gh -a'
alias rgs='rvm gemset list; and rvm list'
alias run-help=man
alias s='fasd -si'
alias screen='TERM=screen screen'
alias t='fasd_cd -d -i'
alias tf='tail -f'
alias which-command=whence
alias zz='fasd_cd -d -i'
alias c='clear'
alias gup='rvm ruby-2.1.1 do git up'

eval (opam config env)
eval (direnv hook fish)
