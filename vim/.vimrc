set nocompatible

syntax enable
filetype plugin on

set path+=**
set wildmenu

set encoding=utf-8
set background=dark
set clipboard=
set mouse=a

" Indentation
" default
set expandtab ts=4 sw=4 softtabstop=4

set noswapfile

set nowrap
set cindent
set nojoinspaces

set hlsearch
set incsearch
set smartcase ignorecase
set autoread

nnoremap <Leader>l :nohlsearch<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

autocmd InsertEnter,InsertLeave * set cul!

" Set indentation rules for JS, TS, TSX
autocmd FileType javascript,typescript,typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent smartindent

" Use Prettier for formatting
autocmd FileType javascript,typescript,typescriptreact setlocal formatprg=prettier\ --stdin-filepath\ %\ --parser\ babel-ts

" Need to set this up for OSX, see 
" https://stackoverflow.com/questions/69145357/vim-almost-hangs-with-100-line-typescript-file
set regexpengine=0
filetype plugin indent on

