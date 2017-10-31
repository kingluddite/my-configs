" I like ligatures - https://coderwall.com/p/yiot4q/setup-vim-powerline-and-iterm2-on-mac-os-x
" Download all the Powerfonts
" - https://github.com/powerline/fonts
" Set the code to Fira Code Medium https://i.imgur.com/QPIJmgA.png
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
Bundle 'Powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" TODO: Load plugins here (pathogen or vundle)
Plugin 'scrooloose/nerdtree'
" (conflict with eslint) Plugin 'scrooloose/syntastic'
Plugin 'tyru/open-browser.vim'
Plugin 'stanangeloff/php.vim'
Plugin 'prettier/prettier'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'sirver/ultisnips'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'yuroyoro/vim-autoclose'
Plugin 'kien/ctrlp.vim' "Fuzzy searching if dmenu isn't available
Plugin 'othree/html5.vim'
Plugin 'joom/vim-commentary'
Plugin 'phpfolding.vim'
Plugin 'vim-syntastic/syntastic'

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" add Powerline font
set guifont=Inconsolata\ for\Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Add a bit extra margin to the left
set foldcolumn=1

" Code fold bliss
set foldmethod=indent

" Blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

" Encoding
set encoding=utf-8

" fuzzy search
set runtimepath^=~/.vim/bundle.ctrlp.vim
" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" System default for mappings is now the "," character
let mapleader = ","

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Toggle fold at current position
nnoremap <s-tab> za

" save with zz
nnoremap zz :update<cr>

" Bubble single lines
nmap <c-k> ddkP
nmap <c-j> ddp

" Bubble multiple lines
vmap <c-k> xkP`[V`]
vmap <c-j> xp`[V`]

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" set clipboard to easily copy from vim and paste into OSx
set clipboard=unnamed

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" add closing brace
inoremap {;<CR> {<CR>};<ESC>0
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>0

" easy navigation in split windows
nnoremap <C-L> <C-W><C-L> " focus on left
nnoremap <C-H> <C-W><C-H> " focus on right

" Textmate holdouts

" Formatting
map <leader>q gqip

" map jk to esc
:imap jk <Esc>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" prettier
autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote
autocmd BufWritePre *.js :normal gggqG
autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

" disable autocomments after first // and then hitting return
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Eslint config settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" remove syntastic errors for html
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme solarized

" iterm cursor changes depending on mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

