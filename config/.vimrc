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
Bundle 'FuzzyFinder'
Plugin 'mjohns/list'
Plugin 'mjohns/vimenv'
Plugin 'vim-misc'
Bundle 'altercation/vim-colors-solarized'


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

source /usr/share/vim/google/google.vim
" prevent auto line wrapping that comes from google.vim
autocmd BufNewFile,BufRead * set tw=2000

let mapleader=","

command! Jade !/google/data/ro/teams/jade/jade %

Glug blaze

map <leader>t :tabn<CR>
set showtabline=0

" open the BUILD file in the dir for the current file
map <leader>e :e %%/BUILD<CR>

map <leader>d :BlazeLoadErrors<CR>:copen<CR>

" set up find and run commands:
" ,f - search for all files matching the pattern given.  A trailing * is
"      automatically added to the regex and it is case insensitive
" " ,g - search for all files matching the current word under the cursor
"
" ,a - grep all files for the current word under the cursor
"
" ,r - run an arbitrary shell command and have the output displayed in a temp
"      buffer
command! -nargs=1 Find :call RunCmdAutoOpen("fa <args>")
nmap <leader>f :Find 
nmap <leader>g :call RunCmdWithHistory("fa " . expand("<cword>"))<CR>
command! -nargs=1 RunCmd :call RunCmd("<args>")
nmap <leader>r :RunCmd 
nmap <leader>x :call RunCmd("g4 edit " . expand("<C-r>%"))<CR>
nmap <leader>a :call RunCmdWithHistory("all " . expand("<cword>"))<CR>

" Eclim
"let g:EclimFileTypeValidate = 1
"let g:SuperTabDefaultCompletionType = "context"
"let g:EclimJavaSearchSingleResult = "edit"
"let g:EclimCSearchSingleResult = "edit"
"let g:EclimCCallHierarchyDefaultAction = "edit"
" performance
"let g:EclimShowCurrentError = 0
"let g:EclimShowQuickfixSigns = 0
"let g:EclimShowLoclistSigns = 0
"let g:EclimQuickfixSignText = 0
"let g:EclimLoclistSignText = 0
"let g:EclimUserSignText = 0
"let g:EclimUserSignHighlight = 0
"let g:EclimSignLevel = 0
"map <leader>d :CSearchContext<CR>
"map <leader>c :CCallHierarchy<CR>

map <leader>m :call ShiftBuffer()<CR>

" switch back to the previously loaded file
map zb <C-^>

nmap <leader>i :call FindImports(expand("<cword>"))<CR>
function! FindImports(name)
  call histadd("cmd", "FindImports " . a:name)
  call RunCmd("find_imports " . a:name)
  if !&modifiable
    map <buffer> <Enter> Yqggjpsh
  endif
endfunction
command! -nargs=1 FindImports :call FindImports("<args>")

function! RunCmd2(name)
  edit temporary_buffer
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  setlocal modifiable
  map <buffer> <Enter> gF
  map <buffer> q <C-^>
  map <buffer> :q q
  exe "silent r!" . a:name
  etlocal nomodifiable
endfunction

map ss oif (status != Status::SUCCESS) {<CR>return status;<CR>}<CR>

set verbosefile=~/vim.log

augroup Binary
  au!
  au BufReadPre  *.glb,*.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM let &bin=1
  au BufReadPost *.glb,*.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM if &bin | %!xxd -g1
  au BufReadPost *.glb,*.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM set ft=xxd | endif
  au BufWritePre *.glb,*.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM if &bin | %!xxd -r
  au BufWritePre *.glb,*.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM endif
  au BufWritePost *.glb,*.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM if &bin | %!xxd -g1
  au BufWritePost *.glb,*.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM set nomod | endif
augroup END


