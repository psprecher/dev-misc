set nocompatible              " be iMproved, required
filetype off                  " required

" ***** VUNDLE *****

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

Plugin 'bazelbuild/vim-bazel'

Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ***** VUNDLE END *****

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

source $VIMRUNTIME/mswin.vim
behave mswin

" autocmd BufRead,BufNewFile *.ts set filetype=javascript
" autocmd FileType javascript autocmd BufWritePre <buffer> Prettier

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  " vim-codefmt prettier ignores prettierrc, use Prettier instead
  " autocmd FileType javascript AutoFormatBuffer prettier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

" autocmd BufWritePre *.py execute ':silent !yapf3 -i %'

noremap <C-e> :FormatLine<CR>
map <C-e> :FormatLine<CR>
nmap t :tabn<CR>
nmap T :tabp<CR>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

let g:ycm_extra_conf_globlist = ['~/foxbots/*']
let g:ycm_always_populate_location_list = 1
let g:ycm_server_python_interpreter = '/usr/bin/python3.10'
let g:ycm_goto_buffer_command = 'split'
let g:ycm_filter_diagnostics = {
  \ "cpp": {
  \     "regex": [ "BOOST_FALLTHROUGH", "external" ]
  \ }}

set encoding=utf-8

set spelllang=en
set spell

hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl
