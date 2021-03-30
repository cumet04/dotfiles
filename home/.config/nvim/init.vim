set number
set t_Co=256
syntax enable

" 明示的に指定することで'+'レジスタをlemonade対象外にする; クリップボード履歴汚染対策
let g:clipboard = {
  \ 'copy': {
  \   '*': 'lemonade copy',
  \ },
  \ 'paste': {
  \   '*': 'lemonade paste',
  \ },
  \}
set backspace=indent,eol,start
set expandtab
set nobackup
set noswapfile
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set smartindent
set nowrap

set cursorline
highlight clear CursorLine

inoremap {<Enter> {<Enter>}<ESC><S-o>
set formatoptions=q
