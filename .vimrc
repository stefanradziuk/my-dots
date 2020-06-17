" plugins {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"Plug 'itchyny/lightline.vim'
Plug 'junegunn/seoul256.vim'
Plug 'lervag/vimtex'
Plug 'zxqfl/tabnine-vim'
Plug 'Chiel92/vim-autoformat'
"Plug 'glacambre/firenvim', { 'do' : { _->firenvim #install(0) } }

" Initialize plugin system
call plug#end()

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background=234
colo seoul256

"let g:lightline = {
"      \ 'colorscheme': 'seoul256',
"      \ }
" more lightline settings
"set laststatus=2
"set noshowmode

" auto close tabnine preview windows
autocmd CompleteDone * pclose

" }}}

" set* {{{

syntax on
set nocompatible
filetype plugin indent on

set mouse=a

if !has('nvim')
	set ttymouse=sgr
endif

" cursor wrapping
set whichwrap=b,s,<,>,[,]

" ui
set display=lastline "@@@ on wrap
set number relativenumber
"set colorcolumn=80
"set cursorline

" indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" :command tab completions
set wildmenu

set lazyredraw
set timeoutlen=1000 ttimeoutlen=0

" find (and replace) settings
set ignorecase
set smartcase
set incsearch
set nohlsearch

" }}}

" common typos {{{

:nnoremap q: :q
:command! Q q
:command! W w
:command! Wq wq

" }}}

" theming {{{

" override the LineNr bar bg
highlight LineNr ctermbg=bg
highlight LineNr ctermfg=244
highlight CursorLineNr ctermbg=bg
highlight CursorLineNr ctermfg=244

highlight NonText ctermfg=244
highlight ModeMsg ctermfg=244
" highlight ModeMsg ctermfg=101

" disable inactive tab underline
highlight TabLine cterm=none
highlight TabLine ctermbg=bg
highlight TabLine ctermfg=244
highlight TabLineSel ctermbg=bg
highlight TabLineSel ctermfg=fg
highlight TabLineFill ctermbg=bg
highlight TabLineFill ctermfg=bg
highlight Title ctermbg=bg
highlight Title ctermfg=244

highlight Search cterm=none
highlight Search ctermbg=fg
highlight Search ctermfg=bg
highlight IncSearch cterm=reverse
highlight IncSearch ctermbg=bg
highlight IncSearch ctermfg=fg

highlight WildMenu ctermbg=fg
highlight WildMenu ctermfg=bg

highlight StatusLine ctermbg=fg
highlight StatusLine ctermfg=bg
"highlight StatusLine ctermbg=fg
"highlight StatusLine ctermfg=236
highlight StatusLineNC ctermbg=245
highlight StatusLineNC ctermfg=bg
"highlight StatusLineNC ctermfg=236

"highlight Visual ctermbg=13
"highlight Visual ctermfg=bg

" }}}

au BufWrite *.c,*.h :Autoformat

" vim:foldmethod=marker:foldlevel=0
