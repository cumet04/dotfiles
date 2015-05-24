let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> <MiddleMouse>
nnoremap <silent>  :NERDTreeToggle
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)
map <S-Insert> <MiddleMouse>
inoremap { {}<Left>O
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set clipboard=unnamedplus
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Ricty\ 16
set helplang=en
set imdisable
set iminsert=0
set imsearch=0
set nomore
set mouse=a
set ruler
set runtimepath=~/.vim,~/.vim/bundle/nerdtree/,~/.vim/bundle/.neobundle,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,~/.vim/after,~/.vim/bundle/neobundle.vim/
set shiftwidth=4
set noshowmode
set smartindent
set softtabstop=4
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg,.class
set noswapfile
set tabstop=4
set termencoding=utf-8
set textwidth=80
set ttimeoutlen=100
set window=34
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Dropbox/program/jRemocon/OperatorService
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Dropbox/program/201501_IA_inomoto/utf8/201501_IA_inomoto.tex
badd +1 ~/.bash_history
badd +1 ~/Dropbox/program/test_mysql/src/test_mysql/Main.java
badd +1 ~/Dropbox/program/test_mysql/src/test_mysql/testsql.java
badd +1 ~/Dropbox/program/test_mysql/build.xml
badd +1 ~/Dropbox/program/test_mysql/deploy/web.xml
badd +1 src/jp/kobe_u/cs27/jremocon_operator/WalletLogService.java
badd +74 src/jp/kobe_u/cs27/jremocon_operator/jRemoconOperator.java
badd +1 src/META-INF/services.xml
badd +1 build.xml
badd +1 src/jp/kobe_u/cs27/jremocon_operator/jRemoconOperatorService.java
badd +1 src/log4j2.xml
badd +1 src/jp/kobe_u/cs27/test/TEST_jRemoconOperator.java
badd +1 ~/Dropbox/program/WalletLog/src/jp/kobe_u/cs27/test/TEST_WalletLogService.java
badd +13 src/jp/kobe_u/cs27/dao/DaoFactory.java
badd +1 src/jp/kobe_u/cs27/dao/DaoItem.java
badd +1 src/jp/kobe_u/cs27/dao/MemoryDaoItem.java
badd +1 src/jp/kobe_u/cs27/dao/MongoDaoItem.java
badd +36 src/jp/kobe_u/cs27/dao/DeviceClass.java
badd +1 src/jp/kobe_u/cs27/dao/DeviceOperation.java
badd +21 src/jp/kobe_u/cs27/dao/MysqlDaoItem.java
badd +4 ~/.latexmkrc
badd +8 ~/Dropbox/program/201501_IA_inomoto/clean.sh
badd +1 ~/Dropbox/program/201501_IA_inomoto/utf8/clean.sh
badd +17 ~/lircd.conf
argglobal
silent! argdel *
edit src/jp/kobe_u/cs27/dao/DaoItem.java
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=j1
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=+1
setlocal colorcolumn=+1
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=//%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'java'
setlocal filetype=java
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal indentexpr=GetJavaIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=extends,0=implements
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,/usr/include,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.java
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'java'
setlocal syntax=java
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=80
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
