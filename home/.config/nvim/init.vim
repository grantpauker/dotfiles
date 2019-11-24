set encoding=utf-8
set nrformats+=alpha
set t_Co=256
set ignorecase smartcase

set autoindent 
set shiftround
let s:tabwidth=2
exec 'set tabstop=' .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth
set formatoptions=tcroqln

set number
set relativenumber

set ttimeoutlen=10

let mapleader=" "

syntax on
if (has('termguicolors'))
  set termguicolors
endif

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'sbdchd/neoformat'
	Plug 'w0rp/ale'
	Plug 'cespare/vim-toml'
	Plug 'ptzz/lf.vim'
	Plug 'rbgrouleff/bclose.vim'
	Plug 'kaicataldo/material.vim'
call plug#end()

let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
colorscheme material

let g:airline_symbols = {}
let g:airline_theme='base16color'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_section_warning=''
let g:airline_skip_empty_sections = 1

command W w !sudo tee % > /dev/null

no ; :
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map Q <Nop>
command Q q!
no <leader>o o<Esc>
no <leader>O O<Esc>
no <leader>r ^Di
no <MiddleMouse> <LeftMouse>
vno <leader><Tab> <Esc>/<++><Enter>:noh<CR>"_c4l
no <leader><Tab> <Esc>/<++><Enter>:noh<CR>"_c4l
no <leader>b ggO#!/usr/bin/env bash<Esc><C-O>
no Q @q
no <leader>h :noh<CR>
no <leader>n :Neoformat<CR>
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P
