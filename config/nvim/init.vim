" Set leader to comma
let mapleader = ','

" Edit and source vim config
map <leader>ce :execute "edit " . $MYVIMRC<CR>
map <leader>cs :execute "source " . $MYVIMRC<CR>

" Enable relative line numbers
set relativenumber

" Safe undo info across restarts
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Don't write backup files
set nobackup
set nowritebackup

" First install vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then :PlugInstall to install plugins

call plug#begin('~/.vim/plugged')

" More useful status
Plug 'vim-airline/vim-airline'

" Add `end` as require
Plug 'tpope/vim-endwise'

" Add/remove comments (gcc and gcgc to toggle)
Plug 'tpope/vim-commentary'

" More powerful motions 
" <Leader><Leader>w move to word
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map <Leader>m <plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Integrate git
Plug 'tpope/vim-fugitive'

" Run specs
Plug 'thoughtbot/vim-rspec'
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

call plug#end()
