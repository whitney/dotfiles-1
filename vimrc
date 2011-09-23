""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VIM, not VI
set nocompatible

" pathogen bundles
filetype off
call pathogen#runtime_append_all_bundles()

" General appearance and behaviour
filetype plugin indent on
syntax on
set visualbell t_vb=
set noerrorbells
set ruler
set showcmd
set showmatch
set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start
set nowrap
set linebreak

set nomodeline

" MOUSE with VIM ! (YES)
" set mouse=a
" set ttymouse=xterm2
set scrolloff=1

" Indentation options
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set virtualedit=block

set equalprg=
set grepprg=ack\ -ai

" don't insert 2 spaces after punctuation
set nojoinspaces

" Search options
set incsearch
set hlsearch
set ignorecase

" Print options ...
set printoptions=header:0

" vimdiff
set diffopt=filler,iwhite

" This is useful for debugging
" set verbose=9

set spellcapcheck=

if has('gui_running')
  set guioptions=
  set guifont=Inconsolata\ 16
endif

if $TERM == "xterm-256color"
  if $TMUX == ""
    colorscheme 256_xoria
  else
    colorscheme 256_xoria_black " until tmux fixes BCE problems
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACEHI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:spacehi_tabcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"
let g:spacehi_spacecolor="ctermfg=Black ctermbg=Yellow guifg=Blue guibg=Yellow"

autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * SpaceHi
au FileType help NoSpaceHi
au FileType diff NoSpaceHi
au FileType man  NoSpaceHi
au FileType scratchy NoSpaceHi

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $VIMRUNTIME/ftplugin/man.vim

" used by :TOhtml
let g:html_use_css=0

" set in variables.sh
let g:sql_type_default=$DB_ADAPTER

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.vim/mappings.vim

