" Set leader to comma
let mapleader = ','

" Edit and source vim config
map <leader>ec :execute "edit " . $MYVIMRC<CR>
map <leader>sc :execute "source " . $MYVIMRC<CR>

" (normal) Toggle spellcheck with ,s
nnoremap <leader>s :set invspell<CR>

" (insert) Insert date 
inoremap <leader>d <C-R>=strftime("%Y-%m-%dT%H:%M")<CR>

" First install vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Initialise vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
