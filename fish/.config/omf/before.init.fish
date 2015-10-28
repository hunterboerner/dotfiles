set fish_color_command green
set fish_color_param white
set -x --universal fish_user_paths $HOME/.rvm/bin $fish_user_paths $HOME/bin $HOME/google-cloud-sdk/bin

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
