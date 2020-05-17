" Set leader to comma
let mapleader = ','

" Edit and source vim config
map <leader>ce :execute "edit " . $MYVIMRC<CR>
map <leader>cs :execute "source " . $MYVIMRC<CR>

" Enable relative line numbers
set relativenumber

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

Plug 'thoughtbot/vim-rspec'
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

call plug#end()
