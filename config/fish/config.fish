set -gx fish_user_paths ".git/safe/../../bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)
