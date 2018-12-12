set shiftround
set encoding=utf-8

set ruler
set smartindent 
set autoindent 
set number
set relativenumber
set nrformats+=alpha
set t_Co=256
let mapleader=" "
let s:tabwidth=2
exec 'set tabstop=' .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth
syntax on
colorscheme material
set formatoptions=tcroqln
set com=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-
"
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'sbdchd/neoformat'
	Plug 'w0rp/ale'
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-line'
	Plug 'vim-scripts/argtextobj.vim'
call plug#end()

let g:airline_symbols = {}
let g:airline_theme='base16color'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_section_warning=''
let g:airline_skip_empty_sections = 1

set ttimeoutlen=10
autocmd BufRead,BufNewFile *.txt,*.md setlocal spell

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
no <C-Q> :wq<CR>
no <C-S> :w<CR>
vno <leader>t :%!column -t<CR>
no <leader>t :%!column -t<CR>
no Q @q
no <leader>h :noh<CR>
map <leader>c val"+y
no <leader>C gg"+yG
no <leader>n :Neoformat<CR>
map <leader>s :setlocal spell!<CR>
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

autocmd FileType markdown ino -> →
autocmd FileType markdown set tabstop=2 shiftwidth=2 expandtab

command! -range -nargs=0 ToggleStrikethrough call s:ToggleCombineSelection(<line1>, <line2>, '0336')
command! -range -nargs=0 ToggleUnderline call s:ToggleCombineSelection(<line1>, <line2>, '0332')
no <leader>s V:ToggleStrikethrough<CR>
no <leader>u V:ToggleUnderline<CR>

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

function! s:UncombineSelection(line1, line2, cp)
  execute a:line1.','.a:line2.'s/\%V\%u'.a:cp.'//ge'
endfunction

function! s:ToggleCombineSelection(line1, line2, cp)
	try
  	execute a:line1.','.a:line2.'s/\%V\%u'.a:cp.'//gn'
		call s:UncombineSelection(a:line1, a:line2, a:cp)
	catch /^Vim\%((\a\+)\)\=:E486/
		call s:CombineSelection(a:line1, a:line2, a:cp)
	endtry
endfunction
