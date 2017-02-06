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
set laststatus=2
set nobackup
set nowrap
set ruler
set t_Co=256

nnoremap <silent> <F2> :NERDTree<CR>
nnoremap <silent> <F12> :BufExplorer<CR>
nnoremap <silent> <C-B><Right> :bnext!<CR>
nnoremap <silent> <C-X> :bnext!<CR>
nnoremap <silent> <C-B><Left> :bprevious!<CR>
nnoremap <silent> <C-Z> :bprevious!<CR>
nnoremap <silent> <C-B>d :bdelete<CR>
nnoremap <silent> <C-T>n :tabnew<CR>
nnoremap <silent> <C-T>c :tabclose<CR>
nnoremap <silent> <C-T><Left> :tabprevious<CR>
nnoremap <silent> <C-T><Right> :tabnext<CR>

autocmd FileType gitcommit setlocal spell
autocmd FileType svn setlocal spell

"highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
