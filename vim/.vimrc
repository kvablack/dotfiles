call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"cosmetic settings
highlight SignColumn ctermbg=None
highlight SpellBad cterm=underline,bold ctermfg=red ctermbg=None
highlight SpellCap cterm=underline,bold ctermfg=yellow ctermbg=None
highlight ALEErrorSign ctermfg=red ctermbg=None
highlight ALEWarningSign ctermfg=yellow ctermbg=None
syntax on


"general settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set breakindent
set incsearch
set splitbelow

"text wrap width
set textwidth=120
set formatoptions-=t
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2

set showcmd
set mouse=a
set clipboard=unnamedplus

"keyboard shortcuts
let mapleader = " "

"split navigations
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"tab navigations
nnoremap <S-L> gt
nnoremap <S-H> gT

"other shortcuts
inoremap kj <Esc>
nmap <Leader>p :w<CR>:!python %<CR>
nmap <Leader>c :w<CR>:!g++ -std=c++14 %<CR>:!./a.out<CR>
map <Leader>f :NERDTreeToggle<CR>
map <Leader>g  :YcmCompleter GoTo<CR>
map <Leader>d :YcmCompleter GetDoc<CR>
map <Leader>q :pc<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <Leader>s <Plug>(ale_fix)

"persistent undo
set undofile
set undodir=$HOME/.vim_undo

"ale settings
let g:ale_sign_error = '·'
let g:ale_sign_warning = '-'
let g:ale_python_flake8_options = '--ignore=E5,E3'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

"airline settings
let g:airline_powerline_fonts=1
let g:airline_theme="bubblegum"
let g:airline#extensions#tabline#enabled = 1

"NERDTree settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd h | endif

"YCM settings
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
