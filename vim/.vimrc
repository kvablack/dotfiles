call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'maralla/validator.vim'

call plug#end()

syntax on

let mapleader = " "

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set breakindent
set incsearch

set showcmd
set mouse=a
set clipboard=unnamedplus

"split navigations
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"tab navigations
nnoremap <S-L> gt
nnoremap <S-H> gT

"persistent undo
set undofile
set undodir=$HOME/.vim_undo

"shortcuts
inoremap kj <Esc>
nmap <Leader>p :w<CR>:!python %<CR>
nmap <Leader>c :w<CR>:!g++ -std=c++14 %<CR>:!./a.out<CR>
map <Leader>f :NERDTreeToggle<CR>
map <leader>g  :YcmCompleter GoTo<CR>
map <leader>d :YcmCompleter GetDoc<CR>

"NERDTree mappings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


let g:ycm_autoclose_preview_window_after_completion = 1

let g:syntastic_python_checkers = ['pylint']

let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

let g:validator_python_checkers = ['flake8']
let g:validator_python_flake8_args = '--ignore=E5,E3'
highlight SignColumn ctermbg=None
