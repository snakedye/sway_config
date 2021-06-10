" Set compatibility to Vim only.
set nocompatible

set termguicolors

" Helps force plug-ins to load correctly when it is turned back on below.
filetype on

" 4 space tabs
set tabstop=4

call plug#begin('~/.vim/plugged')

" Polyglot
Plug 'sheerun/vim-polyglot'

" Galaxyline
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" barbar
Plug 'romgrk/barbar.nvim'

"Markdown plugins
Plug 'gabrielelana/vim-markdown'

"Illuminate
Plug 'oknozor/illumination', { 'dir': '~/.illumination', 'do': '.install.sh' }

" Highlite
Plug 'Iron-E/nvim-highlite'

" Goyo
Plug 'junegunn/goyo.vim'

" Fish syntax highlightning
Plug 'aliva/vim-fish'

" File explorer
Plug 'scrooloose/nerdtree'

" Commentary
Plug 'tpope/vim-commentary'

" Autoclose
Plug 'townk/vim-autoclose'

" Rust
Plug 'rust-lang/rust.vim'

"CoC
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

" Vim icons
Plug 'ryanoasis/vim-devicons'

call plug#end()

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    shorten_path = true,
    layout_strategy = "vertical",
    width = 0.4,
    use_less = true,
    previewer = false,
    prompt_title = false,
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" File explorer shortcut
:nnoremap <C-space> :lua require('telescope.builtin').find_files()<CR>

" Colorscheme
colorscheme soil

" Goyo configuration
let g:goyo_width = '120'
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
autocmd VimEnter * Goyo

" Massive CoC
let g:coc_global_extensions = [ 'coc-rls', 'coc-stylelintplus', 'coc-xml' ]

" Galaxyline
luafile ~/.vim/plugged/galaxyline.nvim/example/eviline.lua

" Barbar
let bufferline = {}
let bufferline.animation = v:true
let bufferline.icons = v:false

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Move between split windows
:nmap <silent> <A-h> :wincmd h<CR>
:nmap <silent> <A-j> :wincmd j<CR>
:nmap <silent> <A-k> :wincmd k<CR>
:nmap <silent> <A-l> :wincmd l<CR>

" Move between tabs
:nmap <silent> <C-j> :BufferPrevious<CR>
:nmap <silent> <A-j> :BufferPrevious<CR>
:nmap <silent> <C-k> :BufferNext<CR>
:nmap <silent> <A-k> :BufferNext<CR>

" Exit Goyo
:nmap <silent> <C-c> :Goyo<CR>

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Set this to have long lines wrap inside comments.
setlocal textwidth=79

" Enable folding of block structures in fish.
setlocal foldmethod=expr

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Wayland clipborad
set clipboard+=unnamedplus

" Fixes common backspace problems
set backspace=indent,eol,start

"Delay vim

" Speed up scrolling in Vim
set ttyfast
" standard shortcuts
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" colorscheme nvim-highlite

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" " Automatically save and load folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview"
