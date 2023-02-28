set noswapfile

syntax enable

set incsearch
set hlsearch
set ignorecase
set smartcase

set autoindent
set shiftround

set tabstop=3
set shiftwidth=3
set expandtab

set scrolloff=5
set wildmenu

set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

set foldenable
set foldlevelstart=99
set foldnestmax=10
set foldmethod=syntax

inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

nnoremap j gj
nnoremap k gk

nnoremap gw <C-w>w
nnoremap gW <C-w>W

set nojoinspaces

set nowrap

" jump to the previous function
nnoremap <silent> [f :call search('^\s*\(\i\+\_[ \t\*]\+\)\+\i\+\_s*(\_[^)]*)\_s*{', "bw")<CR>
" jump to the next function
nnoremap <silent> ]f :call search('^\s*\(\i\+\_[ \t\*]\+\)\+\i\+\_s*(\_[^)]*)\_s*{', "w")<CR>

nmap oo o<Esc>k
nmap OO O<Esc>j

set hlsearch
