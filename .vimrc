execute pathogen#infect()
syntax on
filetype plugin indent on

color codeschool
set guifont=Monaco:h16
let g:NERDTreeWinPos = "right"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp', '\.DS_Store', '\.CFUserTextEncoding']

set number
set numberwidth=1
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
