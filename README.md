# Dan's dotfiles

These dotfiles are managed using Thoughtbot's [rcm](https://github.com/thoughtbot/rcm).

Clone to ~/.dotfiles

Run rcup

mkrc to add file to dotfiles

# Fish
Show fish_user_path entries with line numbers:
`echo $fish_user_paths | tr " " "\n" | nl`

Remove a fish_user_path entry
set --erase --global fish_user_paths[3]


# Homebrew
https://github.com/Homebrew/homebrew-bundle


Run `brew bundle`

# Vim
To install vim plugins:
`vim +PluginInstall +qall`
