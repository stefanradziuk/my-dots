" plugins {{{
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Chiel92/vim-autoformat' (currently using coc instead)

" Initialize plugin system
call plug#end()

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background=234
colo seoul256

" {{{ coc

" coc jsonc support
autocmd FileType json syntax match Comment +\/\/.\+$+

" Configuration for coc.nvim from https://scalameta.org/metals/docs/editors/vim.html

" If hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
xmap <leader>a  <Plug>(coc-codeaction-line)
nmap <leader>a  <Plug>(coc-codeaction-line)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

" }}}

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
" highlight trailing whitespace
set list lcs=trail:~,extends:@,precedes:@,tab:\·\ 
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

" markdown {{{

" markdown to html compilation
" :command MdCompile !filename=% ; filename=${filename:0:-3} ; markdown -\o "$filename.html" %
:command MdCompile !pandoc -s -f markdown --katex -t html -o '%:r.html' --metadata title='%:t:r' %

" compile markdown on save
" autocmd BufWrite *.md :silent MdCompile

" enable and set spellcheck to polish without capitalisation rules
autocmd FileType markdown set spell | set spelllang=pl | set spellcapcheck=

" don't highlight katex underscores
autocmd FileType markdown syn match MarkdownIgnore "\$.*_.*\$"

" }}}

:command Mailgen !cd /home/stefan/documents/docsoc/mailgen/ && ./mailgen.js %:p

" vim:foldmethod=marker:foldlevel=0
