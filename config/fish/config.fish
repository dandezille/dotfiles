status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -gx fish_user_paths ".git/safe/../../bin" $fish_user_paths
starship init fish | source
