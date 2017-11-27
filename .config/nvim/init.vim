set number
colorscheme molokai
set t_Co=256
syntax enable

" set clipboard+=unnamed
set clipboard=unnamed
set backspace=indent,eol,start
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
" set ambiwidth=double " 全角文字表示バグを治す

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


function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call HandleURI()<CR>
