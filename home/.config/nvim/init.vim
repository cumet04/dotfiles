set number
colorscheme molokai
set t_Co=256
syntax enable

" speed hack
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0} " hack for mac; refs https://github.com/neovim/neovim/issues/8631
let g:ruby_path = "/opt/anyenv/envs/rbenv/shims/ruby"
"let g:ruby_default_path = "/opt/anyenv/envs/rbenv/shims/ruby"

set clipboard=unnamedplus
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

let g:qiita_vim_private = v:true

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
