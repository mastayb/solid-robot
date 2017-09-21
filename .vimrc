 
set nocompatible
filetype indent plugin on

"Pathogen (runtime plugin manager)
execute pathogen#infect()

"Colors
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1
"colorscheme hybrid
" Solarized 
syntax on
set t_Co=256
set background=dark
colorscheme solarized

" fixing Cygwin cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[0 q"
let &t_te.="\e[0 q"

"General Settings
"Allow switching buffers without saving first
set hidden

set wildmode=full
set wildmenu
set showcmd
set hlsearch
set wildignore+=*.o

set ignorecase
set smartcase
" set backspace=indent,eol,start
set autoindent
set ruler
set laststatus=2
set confirm
set visualbell
"set mouse=a
set cmdheight=2
set number
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Indentation options
set shiftwidth=3
set softtabstop=3
set expandtab

set nowrap



"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)


"set foldmethod=syntax
"set foldcolumn=2
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

" Mappings
let mapleader=","
inoremap jk <esc>
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$
" turn off search highlighting until the next search
nnoremap <leader>l :nohl<CR>
" Ctags shortcut
nnoremap <leader><F12> :!ctags -L cscope.files --c++-kinds=+pl --fields=+iaS --extra=+q <CR>
nnoremap <leader><F12><F12> :!cscope -i cscope.files -b
" Tagbar
"nnoremap <silent><leader>bb :TagbarOpenAutoClose<CR>
nnoremap <silent><leader>bb :TagbarToggle<CR>
"autocmd BufRead *.cpp TagbarOpen
"

nnoremap <leader>p :bp<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>d :bp\|bd#<cr>

"NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent><leader>t :NERDTreeToggle<CR>

"functions
function! s:insert_gates()
   let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
   execute "normal! i#ifndef " . gatename
   execute "normal! o#define " . gatename . " "
   execute "normal! Go#endif /* " . gatename . " */"
   normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()


function! FindInc()
  let oldPath=&path
  set path=$PWD/**

  exe ":find " t:newIncSw

  let &path=oldPath
endfun

function! CurtineIncSw()

  if exists("t:oldIncSw") && expand("%:t:r") == fnamemodify(t:oldIncSw, ":t:r")
    let t:newIncSw=t:oldIncSw
    let t:oldIncSw=expand("%:p")
    exe "e " t:newIncSw
    return 0
  endif

  if match(expand("%"), '\.c') > 0
    let l:hFileName = substitute(expand("%:t"), '\.cpp', '\.h', "")
    let l:hppFileName = substitute(expand("%:t"), '\.c\(.*\)', '.h\1', "")

    if !empty(globpath("**",l:hFileName))
      let t:newIncSw=hFileName
    else
      let t:newIncSw=hppFileName
    endif

  elseif match(expand("%"), "\.h") > 0
    let t:newIncSw=substitute(expand("%:t"), '\.h\(.*\)', '.cpp', "")
  endif

  call FindInc()
endfun

nnoremap <silent><leader>ss :call CurtineIncSw()<CR>

