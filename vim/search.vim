set incsearch
set ignorecase

Plugin 'ctrlpvim/ctrlp.vim'

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
endif
