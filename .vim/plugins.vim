filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin("~/.vim/vundle-plugins/")

" Let vundle manage vundle (required)
Plugin 'gmarik/vundle'

" Languages
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'
" Plugin 'timcharper/textfile.vim/'

call vundle#end()
filetype plugin indent on
