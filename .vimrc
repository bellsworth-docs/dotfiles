set nocompatible                " not compatible with vi
"set background=light            " I like light
set background=dark
"colorscheme delek              " these are also interesting colors
"colorscheme peachpuff
"colorscheme solarized
set t_Co=256                    " I use modern terminals

"====== Set up plugins
execute pathogen#infect()
filetype plugin indent on

syntax on                       " syntax highlighting

" Code Folding
set foldmethod=indent
set foldlevel=1000

" various settings I like
set showmatch                   " show matching parenthesis
set hlsearch                    " highlight matching searches
let @/ = ""                     " but set string to empty
set incsearch                   " highlight searches as you type
set backspace=indent,eol,start  " backspace smartly in insert mode
set ruler                       " turn on the bottom ruler
set number                      " turn on line numbers
highlight LineNr term=bold ctermfg=White ctermbg=blue
set relativenumber
set shortmess=I                 " short startup message
set scrolloff=5
set showcmd                     " show when leader key is active

" smart tabbing features
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set smarttab autoindent

set textwidth=80
set colorcolumn=+1,+2,+3
highlight ColorColumn ctermbg=gray guibg=gray9

" jump to the last position we were at when we last closed this file
:au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Remove trailing white spaces.
autocmd BufWritePre * :%s/\s\+$//e

set spelllang=en_us

" Turn on spell check automatically
autocmd BufRead,BufNewFile *.md setlocal spell

set encoding=utf-8

" Statusline settings for use without vim-airline
"set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file

" statusline settings for use with vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='light'
set laststatus=2

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Explicitly set the Leader to comma. You can use '\' (the default),
" or anything else (some people like ';').
" let mapleader=','

" reload vimrc with \RR
nnoremap <leader>RR :source ~/.vimrc<CR>

" clear search register
nnoremap <leader>cs :let @/=''<CR>

" toggle relative line numbers
nnoremap <leader>rl :set rnu!<CR>

" toggle absolute line numbers
nnoremap <leader>al :set nu!<CR>

" map F2 to list and switch buffers
map <F2> :ls<CR>:b<Space>

" map F3 to list buffers
map <F3> :ls<CR>

" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

" hilight current line
"hi cursorline cterm=NONE ctermbg=darkred ctermfg=white
"nnoremap <leader>cl :set cursorline!<CR>

"autoclose html tags after I type '</'
:iabbrev </ </<C-X><C-O>


" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
