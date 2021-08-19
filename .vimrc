" .vimrc of Joe Doyle (Ginto8)

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

au!

let s:vim_path = fnameescape(escape(expand('<sfile>:p'), '\')) . "/"
" echo s:vim_path

" Header guard macro: i#ifndef "%p:s/\./_/g:s: \(.*/\)\?: :g;l$vaWUyyplciwdefineoki#endifkO

" Reload .vimrc automatically on save
au BufWritePost .vimrc so $MYVIMRC

" Setting up vim-plug
let plugInstalled=1
let plug_file=expand('~/.vim/autoload/plug.vim')
if !filereadable(plug_file)
    echo "Installing vim-plug.."
    echo ""
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let plugInstalled=0
endif
call plug#begin('~/.vim/plugged')
    Plug 'jpdoyle/vim-verifast'
    Plug 'junegunn/vim-plug'
    "Add your bundles here
    "uber awesome syntax and errors highlighter
    Plug 'vim-scripts/Syntastic'
    "Tim pope is a god.
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    "...All your other bundles...
    Plug 'vim-scripts/a.vim'
    Plug 'vim-scripts/minibufexpl.vim'
    Plug 'vim-scripts/industry.vim'
    Plug 'vim-scripts/The-NERD-Tree', {'on':'NERDTreeToggle'}
    " Plug 'jvoorhis/coq.vim', {'for':'coq'}
    Plug 'let-def/vimbufsync', {'for':'coq'}
    " Plug 'jpdoyle/coquille', {'for':'coq', 'branch': 'pathogen-bundle'}
    Plug 'whonore/coqtail', {'for':'coq'}

    Plug 'itchyny/lightline.vim'
    Plug 'vim-scripts/Markdown'
    Plug 'vim-scripts/javacomplete'
    Plug 'vim-scripts/Align'
    Plug 'osyo-manga/vim-over'
    Plug 'justinmk/vim-sneak'
    " Plug 'Rip-Rip/clang_complete'
    Plug 'airblade/vim-gitgutter'
    " Plug 'raichoo/haskell-vim'
    " Plug 'lukerandall/haskellmode-vim'
    Plug 'Twinside/vim-hoogle'
    Plug 'LnL7/vim-nix'

    Plug 'jelera/vim-javascript-syntax', {'for':'javascript'}
    Plug 'digitaltoad/vim-jade', {'for':'javascript'}

    Plug 'rust-lang/rust.vim', {'for':'rust'}

    Plug 'fatih/vim-go', {'for':'go' }

    Plug 'vim-scripts/avr.vim'

    Plug 'vim-scripts/camelcasemotion'
    Plug 'kien/ctrlp.vim'
    Plug 'rking/ag.vim'
    Plug 'bronson/vim-visual-star-search'

    "My own stuff
    Plug 'jpdoyle/vim-darkcolors'
    Plug 'jpdoyle/vim-syntax'
    Plug 'jpdoyle/vim-build'

    if plugInstalled == 0
        echo "Installing plugins"
        echo ""
        :PlugInstall
    endif
call plug#end()

filetype on
filetype indent plugin on
syntax on


set hidden
set wildmenu
set showcmd
set incsearch
set hlsearch
set nojoinspaces
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
set timeoutlen=300 ttimeoutlen=300
set shiftwidth=4 softtabstop=4 expandtab shiftround
set nocursorline
set completeopt=menu,menuone,longest
set pumheight=15
set tw=70

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end



let mapleader=';'
noremap ;; ;

" set background=dark
colorscheme industry

" Make gitgutter background same as line numbers
highlight clear SignColumn

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

nnoremap / /\v
vnoremap / /\v

noremap <Leader>i :set relativenumber!<CR>

noremap <F1> <nop>
inoremap <F1> <nop>
set pastetoggle=<F1>
au InsertLeave * set nopaste

" Better escape
" inoremap <Leader>n <Esc>
" noremap <Leader>n <Esc>
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
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Movement is visual
noremap j gj
noremap k gk

noremap Y y$

noremap ~ :NERDTreeToggle<CR>

" quick-saving/quitting
noremap <Leader>w :w<CR>
inoremap <Leader>w <Esc>:w<CR>a
noremap <Leader>wa :wa<CR>
inoremap <Leader>wa <Esc>:wa<CR>a

noremap <Leader>q :q<CR>
noremap <Leader>qa :qa<CR>

noremap <Leader>wq :wq<CR>
noremap <Leader>wqa :wqa<CR>

noremap <Leader>d :bd<CR>

noremap <Leader>l :nohl<CR><C-L>

noremap <Leader>t :clo<CR>

noremap <Leader>k :bn<CR>
noremap <Leader>j :bp<CR>
" noremap <C-l> :bn<CR>
" noremap <C-h> :bp<CR>

" noremap <Leader>f :Ag<Space>

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

nnoremap Q @q
vnoremap Q :norm @q<cr>

" splitting
noremap <Leader>\ :vs<CR>
noremap <Leader>- :sp<CR>

" Automatic brackets
inoremap {<CR> {<CR>}<Esc>O

" Nicer completion prompting
imap <Leader><Tab> <C-X><C-U>

" Syntastic errors
map <silent> <Leader>e :Errors<CR>

noremap <Leader>xz :%!xxd<CR>
noremap <Leader>xm :%!xxd -r<CR>
noremap <Leader>cx :CoqLaunch<CR>
noremap <Leader>h :CoqToCursor<CR>
inoremap <Leader>h <Esc>:CoqToCursor<CR>a
noremap <Leader>s :CoqUndo<CR>
au BufNewFile,BufRead *.v set ft=coq

" Highlight trailing whitespace
highlight eolWS ctermbg=Red guibg=Red
match eolWS /\s\+$/
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
2match OverLength /\%>75v.\+/

au! BufWinEnter * 2match OverLength /\%>75v.\+/
au! InsertEnter * 2match OverLength /\%>75v.\+/
au! InsertLeave * 2match OverLength /\%>75v.\+/

au! BufWinEnter * match eolWS /\s\+$/
au! InsertEnter * match eolWS /\s\+\%#\#<!$/
au! InsertLeave * match eolWS /\s\+$/
au! BufWinLeave * call clearmatches()

au BufEnter *.tex setl tw=70

au BufNewFile,BufRead *.hpp,*.cpp set syntax=cpp11 ft=cpp11 cindent

au BufNewFile,BufRead *.c0 set syntax=c ft=c cindent
au BufNewFile,BufRead *.c,*.h,*.gh set syntax=verifast ft=verifast cindent

au BufRead,BufNewFile *.sig setlocal filetype=sml

au BufWritePost *.tex exe "Build" | redr!

" au FileType haskell compiler ghc
let g:haddock_browser="dwb"

" make <CR> in normal mode behave the way I expect it to
au BufNewFile,BufRead * map <CR> j

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let g:NERDTreeDirArrows = 0

let g:clang_close_preview=1
let g:clang_user_options="-std=c++11"
let g:ag_working_path_mode="r"

let g:tex_flavor='latex'

let g:syntastic_mode_map = { 'passive_filetypes': ['hs'] }

" ggO�ku#define "*"%pcawuvaWUf.:s/./_/gu:�ku�kl�kl�kl�kl�kb\.yyplciwe�kbd�kbukciwifndefGo�ku$e�kb�kb#endif;w

