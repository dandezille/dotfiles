" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://www.benorenstein.com/blog/your-first-vimrc-should-be-nearly-empty/

" Original Author:	 Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Last change:	         2012 Jan 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Copy and overwrite on save, allows guard to work correctly
set backupcopy=yes

" Tab behaviour to 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show matches as you type
set incsearch

" Ignore search case unless uppercase is found
set ignorecase
set smartcase

" Show relative line numbers (have absolute in status and can gg to specific)
set relativenumber

" Move cursor by screen lines, ie. sensibly through wrapped lines
nnoremap j gj
nnoremap k gk

" Highlight current line
set cursorline

" Set leader to space for user shortcuts
let mapleader = ","

" Shortcut to edit and source vimrc
map <leader>ec :execute "edit " . $MYVIMRC<CR>
map <leader>sc :execute "source " . $MYVIMRC<CR>

" Reformat document
map <leader>f gg=G

" Use system clipboard
set clipboard="unnamed"

" Undo history in vim dir
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Plugins
"
" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins, :PlugInstall to install
call plug#begin('~/.vim/plugged')

" Automatically end code structures
Plug 'tpope/vim-endwise'

" Status bar
Plug 'vim-airline/vim-airline'

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" Linting
Plug 'w0rp/ale'
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1

call plug#end()
