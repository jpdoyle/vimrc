" .vimrc of Joe Doyle (Ginto8)

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

au!

let s:vim_path = fnameescape(escape(expand('<sfile>:p'), '\')) . "/"
" echo s:vim_path

" Reload .vimrc automatically on save
au BufWritePost .vimrc so $MYVIMRC

" Setting up Vundle
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Plugin 'gmarik/vundle'
    "Add your bundles here
    "uber awesome syntax and errors highlighter
    Plugin 'Syntastic'
    "Tim pope is a god.
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-surround'
    " Plugin 'tpope/vim-vinegar'

    "...All your other bundles...
    Plugin 'a.vim'
    Plugin 'minibufexpl.vim'
    Plugin 'The-NERD-Tree'
    Plugin 'itchyny/lightline.vim'
    Plugin 'Markdown'
    Plugin 'javacomplete'
    Plugin 'Shougo/vimproc.vim'
    Plugin 'tommcdo/vim-lion'
    Plugin 'osyo-manga/vim-over'
    Plugin 'justinmk/vim-sneak'
    " Plugin 'goldfeld/vim-seek'
    Plugin 'Rip-Rip/clang_complete'
    Plugin 'airblade/vim-gitgutter'
    " Plugin 'eagletmt/ghcmod-vim'
    Plugin 'raichoo/haskell-vim'
    "
    " Plugin 'FredKSchott/CoVim'
    Plugin 'jelera/vim-javascript-syntax'
    Bundle 'digitaltoad/vim-jade'
    Plugin 'vimwiki/vimwiki'

    "My own stuff
    Plugin 'ginto8/vim-darkcolors'
    Plugin 'ginto8/vim-syntax'
    Plugin 'ginto8/vim-build'

    " Bundle 'noahfrederick/vim-noctu'
    "Bundle 'Valloric/YouCompleteMe'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif
" Setting up Vundle - the vim plugin bundler end

" Hack to prevent the above au! from fucking up lightline
if exists('g:resourced')
    execute lightline#colorscheme()
endif
let g:resourced=1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified'
      \ }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "x"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

filetype on
filetype indent plugin on
syntax on


set hidden
set wildmenu
set showcmd
set incsearch
set hlsearch
set ignorecase smartcase
set backspace=indent,eol,start
set autoindent nostartofline
set ruler
set laststatus=2
set confirm
set visualbell t_vb=
set mouse=a
set number norelativenumber
set timeout ttimeout
set timeoutlen=400 ttimeoutlen=400
set shiftwidth=4 softtabstop=4 expandtab shiftround
set nocursorline
set completeopt=menu,menuone,longest
set pumheight=15

let mapleader=';'
noremap ;; ;

nnoremap / /\v
vnoremap / /\v

noremap <Leader>i :set relativenumber!<CR>

noremap <F1> <nop>
inoremap <F1> <nop>
set pastetoggle=<F1>
au InsertLeave * set nopaste

" Better escape
inoremap <Leader>n <Esc>
noremap <Leader>n <Esc>
inoremap <C-n> <Esc>
noremap <C-n> <Esc>

" Unlimited tabbing
vnoremap > >gv
vnoremap < <gv

nnoremap U <C-R>
noremap <C-R> <C-A>
noremap H ^
noremap L $

" Insert mode home-row movement
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" Easy window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Movement is visual
map j gj
map k gk

map Y y$

map ~ :NERDTreeToggle<CR>

" quick-saving/quitting
noremap <Leader>w :w<CR>
inoremap <Leader>w <Esc>:w<CR>a
noremap <Leader>wa :wa<CR>
inoremap <Leader>wa <Esc>:wa<CR>a

noremap <Leader>q :q<CR>
inoremap <Leader>q <Esc>:q<CR>a
noremap <Leader>qa :qa<CR>
inoremap <Leader>qa <Esc>:qa<CR>

noremap <Leader>wq :wq<CR>
inoremap <Leader>wq <Esc>:wq<CR>a
noremap <Leader>wqa :wqa<CR>
inoremap <Leader>wqa <Esc>:wqa<CR>a

noremap <Leader>d :bd<CR>

noremap <Leader>l :nohl<CR><C-L>

noremap <Leader>t :clo<CR>

noremap <Leader>k :bn<CR>
noremap <Leader>j :bp<CR>
" noremap <C-l> :bn<CR>
" noremap <C-h> :bp<CR>

noremap <Leader>f gq
nnoremap <Leader>f {gq}

" Word count, TeX and non
noremap <Leader>tc :! detex % \| wc -w<CR>
noremap <Leader>c :! wc -w %<CR>

" Spell-checking
noremap <Leader>sp :set spell!<CR>

" Switch header/source
noremap <Leader>a :A<CR>

" fugitive mappings
noremap <Leader>gs :Gstatus<CR>

noremap <Leader>gc :Gcommit<CR>

noremap <Leader>gw :Gwrite<CR>

noremap <Leader>gr :Gremove<CR>

noremap <Leader>gk :! tig<CR>

noremap <Leader>g :GitGutterToggle<CR>

noremap <Leader>y "+y
inoremap <Leader>y <Esc>"+ya

noremap <Leader>p "+p
inoremap <Leader>p <Esc>"+pa

noremap <Leader>P "+P
inoremap <Leader>P <Esc>"+Pa

noremap <Leader>m :Build<CR>

noremap <Leader>r :Run<CR>

map <Leader>s @a
nnoremap Q @q
vnoremap Q :norm @q<cr>

" splitting
noremap <Leader>\ :vs<CR>
noremap <Leader>- :sp<CR>

" Automatic brackets
inoremap {<CR> {<CR>}<Esc>O

" Nicer completion prompting
imap <Leader><Tab> <C-X><C-U>

" Highlight trailing whitespace
highlight eolWS ctermbg=Red guibg=Red
match eolWS /\s\+$/
au! BufWinEnter * match eolWS /\s\+$/
au! InsertEnter * match eolWS /\s\+\%#\#<!$/
au! InsertLeave * match eolWS /\s\+$/
au! BufWinLeave * call clearmatches()

au BufEnter *.tex setl tw=70

au BufNewFile,BufRead *.hpp,*.cpp set syntax=cpp11 ft=cpp11 cindent
au BufNewFile,BufRead *.hpp,*.cpp,*.h,*.c,*.c0 map <buffer> <Leader>f {=}

au BufNewFile,BufRead *.c0 set syntax=c ft=c cindent

au FileType haskell nnoremap <buffer> <Leader>s :GhcModType<CR>

" make <CR> in normal mode behave the way I expect it to
au BufNewFile,BufRead * map <CR> j

" Make gitgutter background same as line numbers
highlight clear SignColumn

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let g:NERDTreeDirArrows = 0

let g:clang_close_preview=1
let g:clang_user_options="-std=c++11"

colorscheme Dim

