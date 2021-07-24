# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG $HOME/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
source (brew --prefix asdf)/asdf.fish
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
set -g fish_user_paths "/usr/local/opt/opencv@3/bin" $fish_user_paths
