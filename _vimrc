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
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/mattn/emmet-vim`'
syntax on
filetype plugin on
filetype indent on

" SSH クライアントの設定によってはマウスが使える（putty
" だと最初からいける）
set mouse=n

set noswapfile
set clipboard=unnamed,autoselect
syntax on
filetype on
filetype plugin on
filetype indent on
set number
set tabstop=2
set shiftwidth=2
set noexpandtab
colorscheme molokai
set t_Co=256
noremap ; :
noremap : ;
set encoding=utf-8
set title

let g:cakephp_enable_auto_mode = 1

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



"emmetの設定
""ctrl + e で展開
let g:user_emmet_expandabbr_key = '<c-e>'
 


"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"新しい行のインデントを現在行と同じにする
set autoindent

