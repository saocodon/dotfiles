" Vim configuration for manim, LaTeX and C++ with SDL2
" --------------------vim-plug--------------------------------
call plug#begin('C:\Users\duy\AppData\Local\nvim\plugged')

" onedark.vim theme from joshdick
Plug 'joshdick/onedark.vim'
" Startify: start screen
Plug 'mhinz/vim-startify'
" File browser
Plug 'scrooloose/nerdtree'
" Syntax highlighting
Plug 'sheerun/vim-polyglot'
" Inserting/deleting brackets in pairs
Plug 'jiangmiao/auto-pairs'
" Status bar
Plug 'itchyny/lightline.vim'

call plug#end()

" -------------------Plugin settings--------------------------
" Startify
nnoremap <c-n> :Startify<cr>
let g:startify_fortune_use_unicode = 1

let g:startify_bookmarks = [
    \ { 'v': 'C:\Users\duy\AppData\Local\nvim\init.vim' }
    \ ]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
" Lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'background': 'dark'
      \ }

" Theme
if has('termguicolors')
 	set termguicolors
endif
set background=dark
syntax on
colorscheme onedark

" ------------------Vim settings------------------------------
set noshowmode	      " Hide status
set relativenumber    " Relative numbering
set smartindent       " Makes indenting smart
set expandtab         " Converts tabs to spaces
set linebreak         " Word wrap
set autoindent
set shiftwidth=4
set tabstop=8         " Tabs are at proper location
set nohlsearch        " Remove searching highlight occurences
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set showtabline=2     " Always show tabline
" ------------------Aliases------------------------------------
cnoremap rp w <bar> !manim -sql % 
cnoremap rv w <bar> !manim -pql % 
cnoremap ev w <bar> !manim -qh % 
cnoremap ep w <bar> !pdflatex %
cnoremap rc tabnew c:\users\duy\appdata\local\nvim\init.vim
cnoremap ws w <bar> !build.bat
" ------------------Keymap-------------------------------------
" Map <leader> to <SPACE>
let mapleader = ' '
" NerdTree
nnoremap <silent><leader>f :NERDTreeFind<CR>
nnoremap <silent><leader>t :NERDTreeToggle<CR>
" Switch tab using TAB
nnoremap <silent><TAB> :bnext<CR>
nnoremap <silent><S-TAB> :bprevious<CR>
nnoremap <silent><C-w> :close<CR>
nnoremap <silent><C-t> :tabnew<CR>
" Switch between multiple files
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Fast navigation
nnoremap m 10j
nnoremap , 10k
" Move a line up/down
nnoremap <F7> :mov +1<CR>
nnoremap <F8> :mov -2<CR>
" Exit terminal
tnoremap <Esc> <C-\><C-n>
