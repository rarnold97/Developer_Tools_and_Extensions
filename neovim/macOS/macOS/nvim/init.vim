set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

let mapleader = ","

" ~~~~~~~~~~~~~~~ Terminal settings
" tt for commandline, ts for split first, te to exit
:tnoremap <ESC> <C-\><C-n>
if has("win32")
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  nnoremap <Leader>tt :term<CR>adoskey.cmd<CR>cmd.exe /c "C:\Users\rarnold\AppData\Local\Programs\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>ts :sp<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>cmd.exe /c "C:\Users\rarnold\AppData\Local\Programs\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>td :term<CR>adoskey.cmd<CR>cls<CR>
  nnoremap <Leader>tsd :sp<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>
else
  nnoremap <Leader>tt :term<CR>A
  nnoremap <Leader>ts :sp<CR>:wincmd j<CR>:term<CR>A
endif

augroup TerminalMappings
  autocmd!
  if has("win32")
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>exit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>exit<CR>
  else
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>
  endif
augroup END

" Make the split bigger
nnoremap <Leader>b 8<C-W>+<CR>
nnoremap <Leader>B 50<C-W>+<CR>
" Make the split wider
nnoremap <Leader>w 8<C-W>><CR>
nnoremap <Leader>W 56<C-W>><CR>
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Tells vim-plug where to install plugins.
call plug#begin('/Users/rarnold/.config/nvim/Plugged')

" Tells vim-plug where to download plugins.
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-tree/nvim-tree.lua'
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/romgrk/barbar.nvim'
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim'
Plug 'https://github.com/nvim-lualine/lualine.nvim'
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'https://github.com/sindrets/diffview.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'https://github.com/marko-cerovac/material.nvim'
Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
Plug 'windwp/nvim-autopairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'towolf/vim-helm'
Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'terryma/vim-multiple-cursors'
Plug 'https://github.com/ghillb/cybu.nvim'
Plug 'famiu/nvim-reload'
Plug 'folke/todo-comments.nvim'
Plug 'rmagatti/goto-preview'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'https://github.com/nvim-tree/nvim-web-devicons'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/kkoomen/vim-doge.git'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'projekt0n/github-nvim-theme'

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" ~~~~~~~~~~~~~~~~~~~~~~~~ GENERAL

" Tells vim-plug to stop looking for plugins.
call plug#end()

inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

nnoremap j gj
nnoremap k gk

nnoremap gw <C-w>w
nnoremap gW <C-w>W

"add space to multple lines
nnoremap <leader><space> :'<,'> norm I <CR>

nnoremap <leader>w :CocList diagnostics<CR>

nnoremap <leader>o <cmd>jumps<cr>

" ~~~~~~~~~~~~~~~~ PLUGINS
nnoremap <leader>do <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <leader>dd <cmd>Telescope diagnostics<CR>

let g:doge_doc_standard_python = 'numpy'
let g:doge_python_settings = {
\  'single_quotes': 0,
\  'omit_redundant_param_types': 1
\}

nnoremap <silent> <C-T> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20

" ctrl+space to suggest auto complete
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab to complete selection
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

command Bd bp | sp | bn | bd
command Bsp bo split | resize -7
command W w ++ff=unix

nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
" magma-nvim
nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"

" ~~~~~~~~~~~~~~~~ BUFFERS
set hidden
set confirm
set autowriteall
set wildmenu wildmode=full

" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <C-l> :bn<CR>

" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
" https://github.com/neovim/neovim/issues/2048
nnoremap <C-h> :bp<CR>

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>

" list buffers
nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" hide buffers
nnoremap <silent> <S-h> :hide<CR>

" decrease vertical split size
nnoremap <silent> <leader>vd :vertical resize -5<CR>
" increase vertical split size
nnoremap <silent> <leader>vi :vertical resize +5<CR>

" ~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~ KEYBOARD NAV
" improved keyboard navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
" ~~~~~~~~~~~~~~~~

set nojoinspaces
set nowrap

" jump to the previous function
nnoremap <silent> [f :call search('^\s*\(\i\+\_[ \t\*]\+\)\+\i\+\_s*(\_[^)]*)\_s*{', "bw")<CR>
" jump to the next function
nnoremap <silent> ]f :call search('^\s*\(\i\+\_[ \t\*]\+\)\+\i\+\_s*(\_[^)]*)\_s*{', "w")<CR>

nmap oo o<Esc>k
nmap OO O<Esc>j

set hlsearch

colorscheme github_dark_default

if exists(':GuiFont')
	GuiFont! Hack NF:h12
endif

lua << EOF
require("nvim-autopairs").setup {}
EOF

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ LUA CODE

" telescope setup
lua << EOF
require('telescope').setup {
  defaults = {
    prompt_prefix = '$:: ',
    selection_caret = '>>',
}
}
EOF

" recently used cycling
lua << EOF
require('cybu').setup({
  position = {
    relative_to = "win",          -- win, editor, cursor
    anchor = "topcenter",         -- topleft, topcenter, topright,
                                    -- centerleft, center, centerright,
                                    -- bottomleft, bottomcenter, bottomright
    vertical_offset = 10,         -- vertical offset from anchor in lines
    horizontal_offset = 0,        -- vertical offset from anchor in columns
    max_win_height = 5,           -- height of cybu window in lines
    max_win_width = 0.5,          -- integer for absolute in columns
                                    -- float for relative to win/editor width
  },
  style = {
    path = "relative",            -- absolute, relative, tail (filename only)
    path_abbreviation = "none",   -- none, shortened
    border = "rounded",           -- single, double, rounded, none
    separator = " ",              -- string used as separator
    prefix = "…",                 -- string used as prefix for truncated paths
    padding = 1,                  -- left & right padding in number of spaces
    hide_buffer_id = true,        -- hide buffer IDs in window
    devicons = {
      enabled = true,             -- enable or disable web dev icons
      colored = true,             -- enable color for web dev icons
      truncate = true,            -- truncate wide icons to one char width
    },
    highlights = {                -- see highlights via :highlight
      current_buffer = "CybuFocus",       -- current / selected buffer
      adjacent_buffers = "CybuAdjacent",  -- buffers not in focus
      background = "CybuBackground",      -- window background
      border = "CybuBorder",              -- border of the window
    },
  },
  behavior = {                    -- set behavior for different modes
    mode = {
      default = {
        switch = "immediate",     -- immediate, on_close
        view = "rolling",         -- paging, rolling
      },
      last_used = {
        switch = "on_close",      -- immediate, on_close
        view = "paging",          -- paging, rolling
      },
      auto = {
        view = "rolling",         -- paging, rolling
      },
    },
    show_on_autocmd = false,      -- event to trigger cybu (eg. "BufEnter")
  },
  display_time = 750,             -- time the cybu window is displayed
  exclude = {                     -- filetypes, cybu will not be active
    "neo-tree",
    "fugitive",
    "qf",
  },
  fallback = function() end,      -- arbitrary fallback function
                                    -- used in excluded filetypes
})
EOF

" Material Setup
lua << EOF
require('lualine').setup {
  options = {
    theme = 'material'
  }
}
EOF

" cycle through recently used
nnoremap <silent> <C-Tab> :CybuLastusedPrev<CR>
nnoremap <silent> <Tab><Tab> :CybuNext<CR>
nnoremap <silent> <S-Tab> :CybuPrev<CR>

" TODO highlighting
"lua << EOF
  "require("todo-comments").setup {
  "}
"EOF

" goto previewing
lua << EOF
  require('goto-preview').setup{
  }
EOF

" not working currently
nnoremap gp <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>

:set cmdheight=1

