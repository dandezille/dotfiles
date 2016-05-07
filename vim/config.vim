let mapleader = " "

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  end
endfunc

set backspace=2
set history=500
set ruler
set showcmd
set laststatus=2
set autowrite
set autoindent

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set number
set numberwidth=5

set grepprg=ag

nnoremap j gj
nnoremap k gk

nnoremap <Leader>f mzgg=G`z
nnoremap <Leader>r :!rspec <CR>
nnoremap <Leader>n :call NumberToggle() <CR>
