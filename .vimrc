" Get pathogen doing its job
execute pathogen#infect()

language messages en_US.UTF-8

set nocompatible
filetype plugin indent on
syntax on
set t_Co=256

" Speedup vim
set ttyfast
set lazyredraw
set synmaxcol=400
set colorcolumn=

" Show the current mode
set showmode

" Enable switching across unsaved buffers
set hidden

" Show line numbers
set nonumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set nowrap
set nojoinspaces
set title
set tags+=.git/tags
set nolist
"set cursorline
set listchars=eol:¶,tab:\»\·

set guioptions=acgi

set noignorecase

" Use "backspace" instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Always show the status line
set laststatus=2

set wildmenu
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.png,*.gif,*.jpeg
set wildignore+=*.o,*.obj,*.beam,*.exe,*.pyc
set wildignore+=tags

" 'cw' will put a '$' char at the end of a word
set cpoptions=ces$

" Keep 8 lines visible before/after cursor on page scrolling
set scrolloff=8

" To see highlighted matches when typing text to search
set incsearch
set hlsearch

" better clipboard
if has("linux")
  set clipboard=unnamedplus
endif

" Turn off backups
set nobackup
set nowritebackup
set noswapfile

" Per filetype settings of tabs and spaces
autocmd FileType ruby    setlocal sw=2 ts=2 sts=2 et
autocmd FileType erlang  setlocal sw=2 ts=2 sts=2 et
autocmd FileType c       setlocal sw=4 ts=4 sts=4 et
autocmd FileType java    setlocal sw=4 ts=4 sts=4 et
autocmd FileType clojure setlocal sw=2 ts=2 sts=2 et
autocmd FileType make    setlocal sw=4 ts=4 sts=4 noet

autocmd BufRead,BufNewFile *.md setlocal textwidth=80

highlight ExtraWhitespace ctermbg=darkred guibg=pink
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=pink
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

if has('mac') && has("gui_running")
  set macmeta
endif

" vim-signify config
let g:signify_vcs_list = ['git']

" Rainbow Parentheses
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Some Buffergator configuration
let g:buffergator_viewport_split_policy = "T"
let g:buffergator_show_full_directory_path = 0
let g:buffergator_sort_regime = "filepath"
let g:buffergator_display_regime = "filepath"

" ag everywhere
if executable('ag')
  " ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column\ --ignore-dir=log
  let g:ackprg = 'ag --nogroup --nocolor --column --ignore-dir=log'

  " ag for CtrlP
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  let g:ctrlp_use_caching = 0
end

" NERDTree filter
let NERDTreeIgnore = ['\.swp$', '\~$', '\.o$[[file]]']

" Status line
set statusline=%f\ %([%M%R]%)%=%{fugitive#statusline()}\ \|\ %{strlen(&fenc)?&fenc:&enc}\ \|\ %{strlen(&filetype)?&filetype:'no\ ft'}\ \|\ %P\ %4l:%-2v

" Set system mapping to start with comma
let mapleader = ","

" Edit/reload vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

nnoremap <silent> <S-TAB> :bprev<CR>
nnoremap <silent> <TAB> :bnext<CR>

" How 'bout blame somebody?
nmap ,gb :Gblame<CR>
nmap ,gs :Gstatus<CR>

" Change woorking dir to current file's dir
nmap <silent> ,cd :lcd %:h<CR>

" Turn off highlight search
nmap <silent> ,n :nohls<CR>

" Show/hide the NERDTree panel
nmap <silent> <F7> :NERDTreeToggle<CR>

" Find current file in NERDTree
nmap <silent> ,nf :NERDTreeFind<CR>

" Wipe out current buffer
nmap <silent> <F8> :bwipeout<CR>
nmap <silent> <S-F8> :bwipeout!<CR>

" Indentation is easier
vmap < <gv
vmap > >gv

" Wipe 'em all
nmap <silent> ,wa :1,9000bwipeout<CR>

" Grep a word under the cursor
" thanks to http://robots.thoughtbot.com/faster-grepping-in-vim/
nnoremap <F3> byw:silent grep! "<C-R><C-W>"<CR>:cw<CR>
" Make grep command but do not run it
nnoremap <S-F3> byw:silent grep! "<C-R><C-W>"

" Prepare word substitution
nnoremap <F6> byw:%s/<C-R><C-W>//gc<Left><Left><Left>

" Toggle show special chars
nnoremap ,,, :set list! list?<CR>

" Ctrl over ctags
nnoremap <Leader>. :CtrlPTag<CR>

" go forward and back through the Quickfix list
nnoremap ,qf :silent! cn<CR>
nnoremap ,qb :silent! cp<CR>

" Prettifiers
noremap ,xp :silent! %!xmllint --format - 2>/dev/null<CR>
noremap ,jp :silent! %!jsonlint --pretty-print - 2>/dev/null<CR>

" Lints
noremap ,jl :!jsonlint --quiet %<CR>

let g:zenburn_disable_Label_underline = 1
colorscheme solarized

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
