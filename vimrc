set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/SearchComplete'

call vundle#end()
filetype plugin indent on

colorscheme delek
syntax enable

let g:airline_theme='murmur'

set backspace=indent,eol,start
set dir=~/tmp
set hidden
set ignorecase
set laststatus=2
set list
set listchars=tab:»\ ,trail:·
set nobackup
set nowrap
set path+=**
set ruler
set shiftwidth=2
set smartcase
set t_Co=256
set tabstop=2

nnoremap <silent> <F2> :NERDTree<CR>
nnoremap <silent> <F3> :set spell!<CR>
nnoremap <silent> <F12> :BufExplorer<CR>
nnoremap <silent> <C-B><Right> :bnext<CR>
nnoremap <silent> <C-X> :bnext<CR>
nnoremap <silent> <C-B><Left> :bprevious<CR>
nnoremap <silent> <C-Z> :bprevious<CR>
nnoremap <silent> <C-B>d :bdelete<CR>
nnoremap <silent> <C-S> :write<CR>
nnoremap <silent> <C-T>n :tabnew<CR>
nnoremap <silent> <C-T>c :tabclose<CR>
nnoremap <silent> <C-T><Left> :tabprevious<CR>
nnoremap <silent> <C-T><Right> :tabnext<CR>

highlight Normal ctermbg=black ctermfg=white
highlight SpellBad ctermfg=red ctermbg=NONE guifg=red guibg=NONE
autocmd FileType gitcommit,svn setlocal spell syntax=off
autocmd FileType make setlocal shiftwidth=8 tabstop=8

"highlight extra whitespace
call matchadd("SpellBad", '\s\+$')
autocmd BufWinEnter * call matchadd("SpellBad", '\s\+$')
autocmd InsertEnter * call matchadd("SpellBad", '\s\+\%#\@<!$')
autocmd InsertLeave * call matchadd("SpellBad", '\s\+$')
autocmd BufWinLeave * call clearmatches()
