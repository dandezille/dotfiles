status is-login; and pyenv init --path | source
pyenv init - | source

status --is-interactive; and source (rbenv init -|psub)

status --is-interactive; and source (nodenv init -|psub)

set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx HOMEBREW_CASK_OPTS '--appdir=~/Applications'

set -gx fish_user_paths "/usr/local/sbin" $fish_user_paths
set -gx fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.dotfiles/bin" $fish_user_paths
set -gx fish_user_paths ".git/safe/../../bin" $fish_user_paths

starship init fish | source
