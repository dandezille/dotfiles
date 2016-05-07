set nocompatible
filetype off

" Vundle config
source $HOME/.vim/vundle.vim

" Vim config
source $HOME/.vim/general.vim
source $HOME/.vim/undo.vim
source $HOME/.vim/backup_files.vim
source $HOME/.vim/search.vim

" Tools
source $HOME/.vim/git.vim

" Language specific config
source $HOME/.vim/markdown.vim
source $HOME/.vim/go.vim

" Do this last, otherwise highlighting goes wonky...
source $HOME/.vim/colours.vim

filetype plugin indent on
