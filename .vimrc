"""""""""""""""""""" Plugins """"""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-sensible'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'jpalardy/vim-slime'
call plug#end()

"""""""""""""""""""" Plugin Settings """"""""""""""""""""
let g:ale_fixers = {
    \   'python': ['yapf'] 
    \   }

let g:slime_target = 'tmux'

"""""""""""""""""""" Default settings """"""""""""""""""""
set t_Co=256
set background=dark
colorscheme solarized
set hidden
set wildmode=full
set wildmenu
set showcmd
set hlsearch
set wildignore+=*.o,*.pyc
set ignorecase
set smartcase
set autoindent
set ruler
set laststatus=2
set confirm
set visualbell
set cmdheight=2
set number
set pastetoggle=<F11>
set incsearch
set scrolloff=1
set sidescrolloff=5
set notimeout ttimeout ttimeoutlen=200
set nowrap
set shiftwidth=3
set softtabstop=3
set expandtab
call matchadd('ColorColumn', '\%81v', 100)

"""" Python options """"
au FileType python 
   \ set tabstop=4 |
   \ set softtabstop=4 |
   \ set shiftwidth=4 |
   \ set textwidth=79 |
   \ set fileformat=unix |
   \ set encoding=utf-8
"""" Cygwin Cursor fix """"
if has("win32unix")
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[0 q"
  let &t_te.="\e[0 q"
endif
"""""""""""""""""""" Mappings """"""""""""""""""""
let mapleader=","
inoremap jk <esc>
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
map Y y$
nnoremap <leader>l :nohl<CR>
nnoremap <leader><F12> :!ctags -L cscope.files --c++-kinds=+pl --fields=+iaS --extra=+q <CR>
nnoremap <leader><F12><F12> :!cscope -i cscope.files -b
nnoremap <silent><leader>n :NERDTreeToggle<CR>
nnoremap <silent><leader>ss :call CurtineIncSw()<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>

"""""""""""""""""""" autocmds """""""""""""""""""" 
