colorscheme delek
filetype plugin on
filetype indent on
syntax enable

set dir=~/tmp
set nobackup
set nowrap
set ruler

autocmd FileType gitcommit setlocal spell
autocmd FileType svn setlocal spell

" higlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
