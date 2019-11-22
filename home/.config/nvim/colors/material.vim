" Vim color file
hi clear

let g:colors_name = "material"

" Normal should come first
" hi  Normal   guifg=Red  guibg=White
" hi  Cursor   guifg=bg     guibg=fg
" hi  lCursor  guifg=NONE   guibg=Cyan

" Note: we never set 'term' because the defaults for B&W terminals are OK
hi  DiffAdd       ctermbg=LightBlue
hi  DiffChange    ctermbg=LightMagenta
hi  DiffDelete    ctermfg=Blue          ctermbg=LightCyan
hi  DiffText      ctermbg=Red           cterm=bold
hi  Directory     ctermfg=DarkBlue
hi  ErrorMsg      ctermfg=White         ctermbg=DarkRed
hi  FoldColumn    ctermfg=DarkBlue      ctermbg=Grey
hi  Folded        ctermbg=Grey          ctermfg=DarkBlue
hi  IncSearch     cterm=reverse
hi  LineNr        ctermfg=LightGray
hi  CursorLineNr  ctermfg=Yellow

hi  ModeMsg   cterm=bold
hi  MoreMsg   ctermfg=DarkGreen
hi  NonText   ctermfg=Blue

hi  Question  ctermfg=DarkGreen
hi  Search		ctermfg=Black  ctermbg=Yellow

hi  SpecialKey    ctermfg=DarkBlue
hi  StatusLine    cterm=bold            ctermbg=blue        ctermfg=yellow
hi  StatusLineNC  cterm=bold            ctermbg=blue        ctermfg=black
hi  Title         ctermfg=DarkMagenta
hi  VertSplit     cterm=reverse
hi  Visual        ctermbg=NONE          cterm=reverse
hi  VisualNOS     cterm=underline,bold
hi  WarningMsg    ctermfg=DarkRed
hi  WildMenu      ctermfg=Black         ctermbg=Yellow

" syntax highlighting
hi  Comment     cterm=NONE  ctermfg=7
hi  Constant    cterm=NONE  ctermfg=DarkGreen
hi  Identifier  cterm=NONE  ctermfg=DarkCyan
hi  PreProc     cterm=NONE  ctermfg=DarkMagenta
hi  Special     cterm=NONE  ctermfg=LightRed
hi  Statement   cterm=bold  ctermfg=Blue
hi  Type        cterm=NONE  ctermfg=Blue

hi MatchParen cterm=NONE				ctermbg=Cyan ctermfg=Black
hi ALEWarning ctermfg=Black			ctermbg=Cyan
hi SignColumn ctermbg=LightGray

hi Pmenu				ctermbg=Blue  ctermfg=Black
hi PmenuSel			ctermbg=Green ctermfg=Black
hi PmenuSbar		ctermbg=Black
hi PmenuThumb		ctermbg=Green
