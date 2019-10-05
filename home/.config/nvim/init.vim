set number
colorscheme molokai
set t_Co=256
syntax enable

set clipboard=unnamedplus
set backspace=indent,eol,start
set expandtab
set nobackup
set noswapfile
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set smartindent
set textwidth=80
set nowrap

set cursorline
highlight clear CursorLine

highlight Normal ctermbg=none
highlight LineNr ctermbg=none

let loaded_matchparen = 1
if exists('&colorcolumn')
    set colorcolumn=+1
endif

inoremap {<Enter> {<Enter>}<ESC><S-o>
set formatoptions=q

hi IndentGuidesOdd  ctermbg=233
hi IndentGuidesEven ctermbg=234
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
