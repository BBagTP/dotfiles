" Setup pathogen to manage plugins
call pathogen#infect()

" Bundles
"
" Bundle: tpope/vim-sensible
" Bundle: tpope/vim-rails
" Bundle: tpope/vim-fugitive
" Bundle: tpope/vim-dispatch
" Bundle: tpope/vim-airline
" Bundle: airblade/vim-gitgutter
" Bundle: mattn/emmet-vim
" Bundle: endwise.vim
" Bundle: scrooloose/syntastic
" Bundle: tpope/vim-surround
" Bundle: tpope/vim-commentary
" Bundle: scrooloose/nerdtree
" Bundle: altercation/vim-colors-solarized
" Bundle: kien/ctrlp.vim
" Bundle: ervandew/supertab
" Bundle: "rizzatti/funcoo.vim"
" Bundle: "rizzatti/dash.vim"
" Bundle: "amiel/vim-tmux-navigator"
" Bundle: "digitaltoad/vim-jade"
" Bundle: romainl/flattened

" Vundle plugins file
source ~/.vim/plugins.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy/paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a
set bs=2

" Abbreviations (autocorrect)
abbr funciton function
abbr funicton function
abbr teh the
abbr tempalte template
abbr temaplte template

" Highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set nocompatible

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab-complete
set wildmenu

" Rebind <Leader> key
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Code snippet keymaps 
" Inserts a skeleton html code block and positions the cursor within the <title> tag.
nnoremap <Leader>html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a   

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-j> <c-w>k
map <c-j> <c-w>l
map <c-j> <c-w>h

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Colour scheme
set t_Co=256
syntax enable
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"colorscheme solarized
:color flattened_dark
set modelines=0
set cursorline
set ttyfast
set ruler

" Enable syntax highlighting
filetype on
filetype plugin indent on
filetype plugin on

" Showing line numbers and length
set relativenumber
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=85
highlight ColorColumn guibg=#073642

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" undo settings
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events for file
" system watchers
set nobackup
set nowritebackup
set noswapfile

" Nerdtree if no file is specified
autocmd vimenter * if !argc() | NERDTree | endif
