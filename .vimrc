set mouse=a

filetype on
filetype plugin on
filetype indent on
syntax on

colorscheme default

set showcmd
set ruler

set number
set relativenumber

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

set encoding=UTF-8

set nobackup

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set completeopt=menu,menuone,noinsert

" Mappings
inoremap <C-@> <C-N>
" @ is the space-key
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <C-h> <C-wh>
inoremap <C-j> <C-wj>
inoremap <C-k> <C-wk>
inoremap <C-l> <C-wl>
inoremap jk <Esc>
nnoremap <Esc> :noh<CR>

" Highlight colours
highlight Visual ctermfg=black ctermbg=gray guifg=black guibg=gray
highlight Search ctermfg=black ctermbg=yellow guifg=black guibg=yellow

" auto commands
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g`\"" | endif

call plug#begin()
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
