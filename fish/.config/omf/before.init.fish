set fish_color_command green
set fish_color_param white
set fish_pager_color_progress cyan
set -x PATH $PATH $HOME/.rvm/bin $HOME/bin $HOME/google-cloud-sdk/bin $HOME/.local/bin $HOME/packlane/pack/bin
set -g fish_user_abbreviations ''

alias git=hub
abbr -a g git
abbr -a gb 'git branch'
abbr -a gco 'git checkout'
abbr -a gcs 'git show'
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
abbr -a e 'emacsclient'

set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")

eval (direnv hook fish)
