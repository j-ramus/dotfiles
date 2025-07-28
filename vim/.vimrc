set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=a
set spell

let mapleader = " " 

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'dense-analysis/ale'
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'LunarWatcher/auto-pairs'

call plug#end()

set termguicolors
set laststatus=2 ""enables airline

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
""color seoul256

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
inoremap jk <esc>
vnoremap jk <esc>
noremap <leader>ee :Explore<CR>
noremap	<leader>nh :noh<CR>
noremap <leader>tt :tabnew<CR>
noremap <leader>tx :tabclose<CR>
noremap <leader>tn :tabn<CR>
noremap <leader>tp :tabp<CR>

noremap <leader>sx :close<CR>
noremap <leader>sh :new<CR>
noremap <leader>sv :split<CR>
noremap <leader>so :only<CR>
noremap <leader>r <C-w>r
noremap <leader>o :browse oldfiles<CR>

noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>bl :Startify<CR>
