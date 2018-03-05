set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth
cmap w!! w !sudo tee > /dev/null %
syntax on


map <Left> :echo 'Bruh'<CR>
map <Right> :echo 'Bruh'<CR>
map <Up> :echo 'Bruh'<CR>
map <Down> :echo 'Bruh'<CR>
set number
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'chrisbra/Colorizer'
" Plugin 'ap/vim-css-color'
Plugin 'Chiel92/vim-autoformat'
call vundle#end()
let g:formatdef_my_shfmt = "shfmt -i 2 -ci"
let g:formatters_shell = ['my_shfmt']
