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
let g:cakephp_enable_fix_mode = 1
let g:cakephp_app = "~nick/ihav/app"
