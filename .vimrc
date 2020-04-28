" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'itchyny/lightline.vim'
Plug 'junegunn/seoul256.vim'
Plug 'lervag/vimtex'
Plug 'zxqfl/tabnine-vim'

" Initialize plugin system
call plug#end()

syntax on
set nocompatible
filetype plugin indent on
set mouse=a
set ttymouse=sgr
set whichwrap=b,s,<,>,[,]
set number relativenumber
" set colorcolumn=80
set ignorecase
set smartcase

set laststatus=2
set noshowmode

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 234
colo seoul256

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

:command Q q
:command W w

" xml formatting
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
nnoremap = :FormatXML<Cr>
