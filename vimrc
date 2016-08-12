set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Peeja/vim-cdo'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'jgdavey/vim-blockle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'mkitt/tabline.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/gitignore'
Bundle 'vim-scripts/nextval'
Bundle 'vim-scripts/regreplop.vim'
Bundle 'wincent/Command-T'
Bundle 'Valloric/YouCompleteMe'
Bundle '1995eaton/vim-better-javascript-completion'


let mapleader = ","

cabbrev W w
cabbrev Q q
cabbrev Wq wq

map \           :NERDTreeToggle<CR>
map \|          :NERDTreeFind<CR>
map <D-N>       :CommandTFlush<CR>:CommandT<CR>
map <leader>F   :CommandTFlush<CR>:CommandT<CR>
map <leader>/   <plug>NERDCommenterToggle
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>
map <MiddleMouse>   <Nop>
imap <MiddleMouse>  <Nop>
map <leader>u :GundoToggle<CR>
map Y yg_

au FocusLost * silent! wa

syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme Tomorrow-Night-Eighties

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost .git/index set nolist

let g:gundo_close_on_revert = 1

autocmd BufRead,BufNewFile *.json set filetype=javascript

function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

autocmd BufWritePre *.* call StripTrailingWhitespace()

let NERDSpaceDelims = 1

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set guifont=Menlo\ for\ Powerline:h16
set guioptions-=T                  " Remove GUI toolbar
set guioptions-=e                  " Use text tab bar, not GUI
set guioptions-=rL                 " Remove scrollbars
set guicursor=a:blinkon0           " Turn off the blinking cursor

set notimeout                      " No command timeout
set showcmd                        " Show typed command prefixes while waiting for operator
set mouse=a                        " Use mouse support in XTerm/iTerm.

set expandtab                      " Use soft tabs
set tabstop=2                      " Tab settings
set autoindent
set smarttab                       " Use shiftwidth to tab at line beginning
set shiftwidth=2                   " Width of autoindent
set number                         " Line numbers
set nowrap                         " No wrapping
set backspace=indent,eol,start     " Let backspace work over anything.
set wildignore+=tags,tmp/**        " Ignore tags when globbing.

set list                           " Show whitespace
set listchars=trail:·

set showmatch                      " Show matching brackets
set hidden                         " Allow hidden, unsaved buffers
set splitright                     " Add new windows towards the right
set splitbelow                     " ... and bottom
set wildmode=list:longest          " Bash-like tab completion
set scrolloff=3                    " Scroll when the cursor is 3 lines from edge
set cursorline                     " Highlight current line

set laststatus=2                   " Always show statusline

set incsearch                      " Incremental search
set history=1024                   " History size
set ignorecase
set smartcase                      " Smart case-sensitivity when searching

set autoread                       " No prompt for file changes outside Vim

set swapfile                       " Keep swapfiles
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

set sessionoptions-=options

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set hls                            " search with highlights by default
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>""

set autowriteall                   " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wall

if $TERM == 'screen-256color'
  set t_RV=[>c
endif

let g:CommandTWildIgnore=&wildignore . ",node_modules/**/*"
let g:CommandTMaxHeight=10

let g:syntastic_error_symbol = '❌'
let g:syntastic_warning_symbol = '🌀'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:Powerline_symbols = 'fancy'
set encoding=utf-8 " Necessary to show unicode glyphs

autocmd FileType javascript let b:surround_36 = "$(\r)"
                        \ | let b:surround_95 = "_(\r)"

let ruby_operators=1

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

runtime macros/matchit.vim

highlight clear SignColumn
call gitgutter#highlight#define_highlights()

let g:ackprg = 'ag --vimgrep'

let g:rails_projections = {
  \ "frontend/javascripts/app/*.js": {
  \   "alternate": "spec/javascripts/{}_spec.js"
  \ },
  \ "spec/javascripts/*_spec.js": {
  \   "alternate": "frontend/javascripts/app/{}.js"
  \},
  \ "frontend/javascripts/app/*.coffee": {
  \   "alternate": "spec/javascripts/{}_spec.coffee"
  \ },
  \ "spec/javascripts/*_spec.coffee": {
  \   "alternate": "frontend/javascripts/app/{}.coffee"
  \}}
