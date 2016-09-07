set number
colorscheme molokai
set t_Co=256
syntax enable

if has('unix')
    set clipboard+=unnamedplus
    let $PYTHONPATH='/usr/lib/python3.5/site-packages'
endif
if has('mac')
    set clipboard+=unnamed
    set backspace=indent,eol,start
    let $PYTHONPATH='/Users/medalhkr/Library/Python/3.5/lib/python/site-packages'
endif
set expandtab
set nobackup
set noswapfile
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set smartindent
set textwidth=80
set nowrap
set ambiwidth=double " 全角文字表示バグを治す
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

" spell check
set spell
set spelllang=en,cjk
hi clear SpellBad
hi SpellBad cterm=underline

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
