scriptencoding utf-8
set nocompatible

if has('vim_starting')
	filetype plugin off
	filetype indent off
	execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'git://github.com/kien/ctrlp.vim.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'violetyk/neocomplete-php.vim'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/itchyny/lightline.vim.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'https://github.com/mattn/emmet-vim'
NeoBundle 'https://github.com/comeonly/php.vim-html-enhanced'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'tobyS/pdv'

syntax on
filetype plugin on
filetype indent on

" SSH クライアントの設定によってはマウスが使える（putty
" だと最初からいける）
"set mouse=n

if has('mouse')
  set mouse=a
endif

set noswapfile
set nobackup
set hidden

" 他で書き換えられたら自動で読み直す
set autoread
set clipboard=unnamed,autoselect
set showmode

syntax enable
filetype on
filetype plugin on
filetype indent on
set vb t_vb=
set number
set tabstop=4
set shiftwidth=4
set smarttab
set t_vb=
set novisualbell

colorscheme zenburn
set t_Co=256
noremap ; :
noremap : ;
set encoding=utf-8
set title

"カッコの保管設定
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
inoremap jj <Esc>
set ambiwidth=double

"少し多めに移動
nmap <C-j> 5j
nmap <C-h> 5h
nmap <C-k> 5k
nmap <C-l> 5l
noremap nt :NERDTreeToggle<CR>

" 0, 9で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $

"Search
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase

" tabで対応括弧に移動する
nnoremap <Tab> %
vnoremap <Tab> %

" ESCキー2度押しでハイライトを消す
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

"emmetの設定
""ctrl + e で展開
let g:user_emmet_expandabbr_key = '<c-e>'

source $HOME/.vim/bundle/PDV--phpDocumentor-for-Vim/plugin/php-doc.vim
"PhpDocの生成
inoremap <C-q> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-q> :call PhpDocSingle()<CR>
vnoremap <C-q> :call PhpDocRange()<CR>
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
set nowrap

"新しい行のインデントを現在行と同じにする
set autoindent

"sass,scss Syntax設定
au BufRead,BufNewFile *.scss set filetype=sass
let g:neocomplete_php_locale = 'ja'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"-------------------------------------------------
"" neocomplcache設定
"-------------------------------------------------
""辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 0 
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 行末の空白文字を可視化
highlight WhitespaceEOL term=underline ctermbg=red guibg=red
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", '\s\+$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", '\s\+$')

" 行頭のTAB文字を可視化
highlight TabString ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" 全角スペースの表示
highlight ZenkakuSpace term=underline ctermbg=LightMagenta guibg=LightMagenta
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '▶')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '▶')

" Vim起動時にNERDTREEコマンドを実行する
" autocmd VimEnter * execute 'NERDTree'


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
	  \ 'component_function':{
	  \  'fugitive': 'MyFugitive',
	  \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
      return '⭠ ' . fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction
