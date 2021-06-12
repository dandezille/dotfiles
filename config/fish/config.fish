status is-login; and pyenv init --path | source
pyenv init - | source

status --is-interactive; and source (rbenv init -|psub)

status --is-interactive; and source (nodenv init -|psub)

set -gx FZF_DEFAULT_COMMAND 'rg --files'

set -gx fish_user_paths "$HOME/.cargo/bin" $fish_user_paths

set -gx fish_user_paths "$HOME/.dotfiles/bin" $fish_user_paths
set -gx fish_user_paths ".git/safe/../../bin" $fish_user_paths

starship init fish | source

# opam configuration
source /Users/dan/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
