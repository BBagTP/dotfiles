" VIM-PLUG {{{
" Automatic Download {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p "$HOME/.vim/autoload"
    silent !curl -fLo "$HOME/.vim/autoload/plug.vim" 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
" }}}
call plug#begin(expand('~/.vim/plugged'))
" Defaults {{{
"Plug 'tpope/vim-sensible'
"call plug#load('vim-sensible')
" }}}
" Colours {{{
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'arcticicestudio/nord-vim'
" }}}
" Highlighting / Syntax {{{
Plug 'Valloric/MatchTagAlways'
Plug 'guns/xterm-color-table.vim'
Plug 'junegunn/limelight.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'valloric/vim-operator-highlight'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'pallets/jinja'
" }}}
" UI {{{
Plug 'itchyny/lightline.vim'
Plug 'pgdouyon/vim-evanesco'
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/defx-icons'
"Plug 'terryma/vim-expand-region'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'junegunn/goyo.vim'
" }}}
" Editing {{{
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'ogier/guessindent'
"Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'chaoren/vim-wordmotion'
Plug 'dietsche/vim-lastplace'
" }}}
" Navigation {{{
Plug 'wincent/ferret'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'simnalamburt/vim-mundo'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" }}}
" Source Control {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'whiteinge/diffconflicts'
Plug 'chrisbra/vim-diff-enhanced'
" }}}
" System Tools {{{
Plug 'tpope/vim-eunuch'
" }}}
" Code Evaluation {{{
Plug 'nicwest/vim-http'
Plug 'metakirby5/codi.vim'
" }}}
" Exporting {{{
Plug 'mattn/webapi-vim'
" }}}
" Snippets {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}
" Ansible {{{
Plug 'pearofducks/ansible-vim'
" }}}
" YAML {{{
Plug 'stephpy/vim-yaml'
" }}}
" Ruby {{{
Plug 'vim-ruby/vim-ruby'
" }}}
" Markdown {{{
Plug 'plasticboy/vim-markdown'
" }}}
" Speech {{{
Plug 'phongvcao/vim-stardict'
" }}}
" Writing {{{
Plug 'junegunn/vim-journal'
Plug 'fmoralesc/vim-pad', {'branch': 'devel'}
" }}}
call plug#end()
" }}}

" Lightline - lighter status bar {{{
let g:deespace_italics = 1
"let g:lightline = { 'colorscheme': 'nord', }
" }}}
" pearofducks/ansible settings {{{
let g:ansible_unindent_after_newline = 1 " Reset indentation after two newlines
let g:ansible_extra_keywords_highlight = 1
let g:ansible_yamlKeyName = "yamlkey"
" }}}
" whatyouhide/vim-lengthmatters settings {{{
let g:lengthmatters_on_by_default = 0
" }}}
" junegunn/goyo settings {{{
let g:goyo_width = '90%'
let g:goyo_height = '90%'
autocmd! User GoyoEnter LimeLight
autocmd! User GoyoLeave LimeLight!
let g:limelight_conceal_ctermfg = 1
" }}}
" General Settings {{{
colorscheme nord
if !has('gui_running')
  set t_Co=256
endif
set background=dark
set laststatus=2 " enable lightline
set hidden " hide buffer without notice
"set mouse=a " enable mouse - enables visual mode when highlighting text with the mouse
set autoread " auto read external file changes
set hlsearch " highlight last searched term
set vb t_vb= " no visual bell
set noshowcmd " disable blinking cmd beedback in bottom-right corner
set noshowmode " disable mode showing - not needed with lightline
set guicursor= " disable cursor shape
set noswapfile " disable swap files
set pumheight=32 " limit popup menu height
set updatetime=300 " shorter updatetime value
"set foldmethod=marker " fold on marks
set nofoldenable " disable folding
set spelllang=en_au " default spelling language
set spellfile=$HOME/.vim/spell/en.utf-8.add " personalised spell file
set number
set relativenumber " show relative line to cursor
set expandtab shiftwidth=2 " space for tabs by default
set tabstop=2 softtabstop=2 " double-space for a tab
set shiftwidth=4
set shiftround " rounds indents to the value of shiftwidth
set expandtab
"set diffopt+=internal,algorithm:patience
set bs=2 " make backspace behave like most other programs
set so=7 " set 7 lines to the cursor - when moving vertically using j/k
set ruler " show the ruler
"set cmdheight=2 " set the height for the command bar
set ignorecase " search case insensitive
set smartcase " when searching try to be smart about case
set incsearch " makes search act like search in modern browsers
set magic " for regular expressions turn magic on

syntax on
" Spelling (On) {{{
autocmd BufNewFile,BufRead *.txt :set spell
autocmd BufNewFile,BufRead *.tex :set spell
autocmd BufNewFile,BufRead *.md :set spell
" }}}
" }}}
" Shortcuts, etc. {{{
cmap w!! w !sudo tee % > /dev/null
noremap <C-T> :tabnew<CR>
noremap <C-L> :NERDTreeTabsToggle<CR>
noremap <C-Left> :tabprevious<CR>
noremap <C-Right> :tabnext<CR>
noremap <F8> :setl noai nocin nosi inde=<CR>
noremap <F9> :Goyo<CR>
" }}}
