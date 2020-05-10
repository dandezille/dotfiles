" Set leader to comma
let mapleader = ','

" Edit and source vim config
map <leader>ec :execute "edit " . $MYVIMRC<CR>
map <leader>sc :execute "source " . $MYVIMRC<CR>

" Enable relative line numbers
set relativenumber

" (normal) Toggle spellcheck with ,s
nnoremap <leader>s :set invspell<CR>

" First install vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then :PlugInstall to install plugins

call plug#begin('~/.vim/plugged')

Plug 'thoughtbot/vim-rspec'
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

call plug#end()
