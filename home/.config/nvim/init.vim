set number
set t_Co=256
syntax enable

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

autocmd InsertLeave * :call system('/mnt/c/bin/zenhan.exe 0')
autocmd CmdlineLeave * :call system('/mnt/c/bin/zenhan.exe 0')
