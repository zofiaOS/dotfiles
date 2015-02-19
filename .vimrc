syntax on
" Settings  ---------------------- {{{
set background=dark
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Deletes trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.xml :%s/\s\+$//e
autocmd BufWritePre *.cs :%s/\s\+$//e

" Highlight spaces and tabs in a more convenint way
set list listchars=tab:>.,trail:.,extends:#,nbsp:.

set showcmd   " Show (partial) command in status line.
set showmatch " Show matching brackets.

set ignorecase " Do case insensitive matching
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set hlsearch

set scrolloff=5
set sidescrolloff=5

set mouse=a
set backspace=2

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

set number        " always show line numbers
set history=1000
set undolevels=1000      " use many levels of undo
set title                " change the terminal's title
set wildmenu
set wildignore=*.swp,*.bak,*.pyc
set ruler

" set colorcolumn=80
" highlight ColorColumn ctermbg=lightgrey
" }}}

" Leader ---------------------- {{{
let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <leader>l :CtrlPMRU<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>sq :wq<CR>
nnoremap <Leader>a ggVG
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader><space> :set hlsearch!<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <leader>sp :set paste!<CR>
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Copy to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Ctags
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <Leader>ttp :TagbarTogglePause<CR>
nnoremap <leader>. :CtrlPTag<CR>
" }}}

" Mappings  ---------------------- {{{
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
noremap N Nzz
noremap n nzz

inoremap <esc> <nop>
inoremap jj <Esc>
inoremap kk <esc>
inoremap jk <esc>

" move vertically by visual line
noremap j gj
noremap k gk

" move on line
noremap H ^
noremap L $

nnoremap Y y$

map ; :
noremap ;; ;

" map up/down arrow keys to unimpaired commands
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

" map left/right arrow keys to indendation
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

" Copy to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Convert the current word to uppercase
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" Ctags
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <Leader>ttp :TagbarTogglePause<CR>
nnoremap <leader>. :CtrlPTag<CR>

" searching for selected text
vnorem // y/<c-r>"<cr>
" }}}

" Autocmds and Abbrevations ---------------------- {{{
augroup python
    autocmd!
    autocmd BufNewFile,BufRead *.py iabbrev <buffer> pumpum with open("/tmp/pum", "a") as f:<cr>f.write("\n{}\n".format("pum"))
augroup END
augroup python
    autocmd!
    autocmd BufNewFile,BufRead *.clj iabbrev <buffer> pumpum (spit "/tmp/pum" (str "\npum" "\n") :append true)
augroup END

" Deletes trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.xml :%s/\s\+$//e
autocmd BufWritePre *.cs :%s/\s\+$//e
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Plugins file settings ---------------------- {{{
" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Syntax checking
Plugin 'https://github.com/scrooloose/syntastic'

" Clojure syntax highlighting
Plugin 'https://github.com/vim-scripts/VimClojure'

Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/tpope/vim-unimpaired'

" search forward with f and backward with F
let g:clever_f_fix_key_direction=1
Plugin 'https://github.com/rhysd/clever-f.vim'

" Full path fuzzy file finder
Plugin 'https://github.com/kien/ctrlp.vim'

" Filesystem
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/tpope/vim-vinegar'
Plugin 'git://github.com/majutsushi/tagbar'

" Git integration
Plugin 'https://github.com/tpope/vim-fugitive'

" Status bar
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
Plugin 'https://github.com/bling/vim-airline'

" Number of matches
Plugin 'https://github.com/henrik/vim-indexed-search'
" Showing marks
Plugin 'https://github.com/kshenoy/vim-signature'
Plugin 'https://github.com/scrooloose/nerdcommenter'

" Completition
Plugin 'https://github.com/davidhalter/jedi-vim'
let g:neocomplete#enable_at_startup = 1
" Jedi complete for python
autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    " alternative pattern: '\h\w*\|[^. \t]\.\w*'
Plugin 'https://github.com/Shougo/neocomplete.vim'

" Alternative autocomplete
" let g:neocomplcache_enable_at_startup = 1
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" Plugin 'https://github.com/Shougo/neocomplcache.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
