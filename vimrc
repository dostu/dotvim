set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'bogado/file-line'
Plugin 'mhinz/vim-startify'
Plugin 'skwp/greplace.vim'

" Languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'

" Themes
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on
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

set cursorline
set number
set nowrap
set scrolloff=2
set showmatch
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set scrolloff=9999
set wildignore=*.png,*.jpg,*.xcf,*.wav,log/*,tmp/*,coverage/*
set viminfo='100,n$HOME/.vim/files/info/viminfo
set background=dark
set noswapfile

" undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

let base16colorspace=256
colorscheme base16-default

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(121,999),",")

let mapleader=','
let g:rspec_command = "!spring rspec {spec}"
let g:ctrlp_custom_ignore = { 'dir': '\v(tmp|coverage|public)$' }
let g:ctrlp_reuse_window  = 'startify'

autocmd BufWritePre * :%s/\s\+$//e " remove trailing space
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Mappings
nmap ; :

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>
map <Leader>r :NERDTreeFind<cr>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
