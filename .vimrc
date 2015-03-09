" Settings  ---------------------- {{{
syntax on
set background=dark
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

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

set fillchars-=vert:\|

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif
" }}}

" Leader ---------------------- {{{
let mapleader = "\<Space>"
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <leader>rr :CtrlPMRU<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>sq :wq<CR>
nnoremap <Leader>s :mksession<CR>
nnoremap <Leader>a ggVG
nnoremap <Leader>v :vsplit .<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>co :call ToggleColumn()<CR>

" Copy to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Ctags
nnoremap <leader>. :CtrlPTag<CR>

" Mappings to access buffers
nnoremap <Leader>sl :ls<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Mappings for splits
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
" }}}

" Mappings  ---------------------- {{{
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
noremap N Nzz
noremap n nzz
noremap * *zz
noremap # #zz

inoremap jj <Esc>
inoremap kk <esc>
inoremap jk <esc>

" move vertically by visual line
noremap j gj
noremap k gk

" move on line
noremap H ^
noremap ^ H
noremap L $
noremap $ L

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

" Convert the current word to uppercase
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" searching for selected text
vnorem // y/<c-r>"<cr>
" select last insert area
nnoremap gV `[v`]
" }}}

" Autocmds and Abbrevations ---------------------- {{{
augroup python
    autocmd!
    autocmd BufNewFile,BufRead *.py iabbrev <buffer> pumpum with open("/tmp/pum", "a") as f:<cr>f.write("\n{}\n".format("pum"))
augroup END
augroup clojure
    autocmd!
    autocmd BufNewFile,BufRead *.clj iabbrev <buffer> pumpum (spit "/tmp/pum" (str "\npum" "\n") :append true)
    autocmd BufEnter *.clj setlocal tabstop=2
    autocmd BufEnter *.clj setlocal shiftwidth=2
    autocmd BufEnter *.clj setlocal softtabstop=2
augroup END

" Deletes trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.xml :%s/\s\+$//e
autocmd BufWritePre *.cs :%s/\s\+$//e
" }}}

" Functions ---------------------- {{{
function! ToggleColumn()
    if &colorcolumn != ''
        set colorcolumn&
    else
        set colorcolumn=80
    endif
endfunction
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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
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

" Git integration
Plugin 'https://github.com/tpope/vim-fugitive'

" Status bar
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#tabline#buffer_nr_show = 1
Plugin 'https://github.com/bling/vim-airline'

" Number of matches
Plugin 'https://github.com/henrik/vim-indexed-search'

Plugin 'https://github.com/scrooloose/nerdcommenter'

" Completition
Plugin 'https://github.com/davidhalter/jedi-vim'
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
Plugin 'https://github.com/Shougo/neocomplcache.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
