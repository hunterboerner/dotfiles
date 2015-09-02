# name: nai
# Display the following bits on the left:
# * Current directory name
# * Git branch and dirty state (if inside a git repo)

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _prompt_rubies -a sep_color -a ruby_color -d 'Display current Ruby (rvm/rbenv)'
  [ "$theme_display_ruby" = 'no' ]; and return
  set -l ruby_version
  if type rvm-prompt >/dev/null 2>&1
    set ruby_version (rvm-prompt i v g)
  else if type rbenv >/dev/null 2>&1
    set ruby_version (rbenv version-name)
    # Don't show global ruby version...
    [ "$ruby_version" = (rbenv global) ]; and return
  end
  [ -z "$ruby_version" ]; and return

  echo -n -s $sep_color ' ' $ruby_color $ruby_version
end

function fish_prompt
  z --add "$PWD"
  set -l yellow (set_color yellow)
  set -l green (set_color green)
  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l red (set_color blue)

  set -l cwd (basename (prompt_pwd))

  echo -e ""

  echo -n -s ' ' $cwd $normal

  _prompt_rubies $red $blue

  git-radar --fish
  set_color normal

  echo -n -s ' ' $normal

end
