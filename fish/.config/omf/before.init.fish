set fish_color_command green
set fish_color_param white
set -x PATH $PATH $HOME/.rvm/bin $HOME/bin $HOME/google-cloud-sdk/bin $HOME/.local/bin
set -g fish_user_abbreviations ''

alias git=hub
abbr -a g git
abbr -a gb 'git branch'
abbr -a gco 'git checkout'
abbr -a gcs 'git show'
abbr -a gs 'git status -sb'
abbr -a gz 'tar -zcvf'
abbr -a l less
abbr -a less 'less -r'
abbr -a lh 'ls -alt | head'
abbr -a ll 'ls -alGh'
abbr -a ls 'ls -Gh -a'
abbr -a rgs 'rvm gemset list; and rvm list'
abbr -a run-help man
abbr -a s 'fasd -si'
abbr -a screen 'TERM screen screen'
abbr -a t 'fasd_cd -d -i'
abbr -a tf 'tail -f'
abbr -a which-command whence
abbr -a zz 'fasd_cd -d -i'
abbr -a c 'clear'
abbr -a gup 'rvm ruby-2.1.1 do git up'

eval (opam config env)
eval (direnv hook fish)
