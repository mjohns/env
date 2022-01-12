syntax enable

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'L9'
Bundle 'mjohns/FuzzyFinder'
Plugin 'mjohns/list'
Plugin 'mjohns/vimenv'
Plugin 'vim-misc'
Bundle 'mjohns/vim-colors-solarized'
Plugin 'mjohns/vim-operator-user'
Plugin 'mjohns/vim-clang-format'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" " see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" prevent auto line wrapping that comes from google.vim
autocmd BufNewFile,BufRead * set tw=2000

let mapleader=","

map <leader>t :tabn<CR>
set showtabline=0

" open the BUILD file in the dir for the current file
map <leader>e :e %%/BUILD<CR>

" set up find and run commands:
" ,f - search for all files matching the pattern given.  A trailing * is
"      automatically added to the regex and it is case insensitive
" " ,g - search for all files matching the current word under the cursor
"
" ,a - grep all files for the current word under the cursor
"
" ,r - run an arbitrary shell command and have the output displayed in a temp
"      buffer
command! -nargs=1 Find :call RunCmdAutoOpen("i <args>")
nmap <leader>f :Find 
nmap <leader>g :call RunCmdWithHistory("i " . expand("<cword>"))<CR>
command! -nargs=1 RunCmd :call RunCmd("<args>")
nmap <leader>r :RunCmd 
nmap <leader>x :call RunCmd("g4 edit " . expand("<C-r>%"))<CR>
nmap <leader>a :call RunCmdWithHistory("all " . expand("<cword>"))<CR>

map <leader>m :call ShiftBuffer()<CR>

set verbosefile=~/vim.log

map <C-f> :ClangFormat<CR>

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
