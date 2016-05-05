let mapleader = " "

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  end
endfunc

set backspace=2
syntax on
set nobackup
set nowritebackup
set noswapfile
set history=500
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set autoindent

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" set textwidth=80
" set colorcolumn=+1

set number
set numberwidth=5

set grepprg=ag

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

nnoremap j gj
nnoremap k gk

nnoremap <Leader>f mzgg=G`z
nnoremap <Leader>r :!rspec <CR>
nnoremap <Leader>n :call NumberToggle() <CR>
