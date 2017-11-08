set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'jgdavey/vim-blockle'
Plugin 'jremmen/vim-ripgrep'
Plugin 'junegunn/fzf.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'majutsushi/tagbar'
Plugin 'mkitt/tabline.vim'
Plugin 'mxw/vim-jsx'
Plugin 'ngmy/vim-rubocop'
Plugin 'nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/gitignore'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-scripts/nextval'
Plugin 'vim-scripts/regreplop.vim'

let mapleader = ","

cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev WQ wq

map \           :NERDTreeToggle<CR>
map \|          :NERDTreeFind<CR>
map <leader>/   <plug>NERDCommenterToggle
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>
map <MiddleMouse>   <Nop>
imap <MiddleMouse>  <Nop>
map <leader>u :GundoToggle<CR>
map Y yg_

au FocusLost * silent! wa

let python_highlight_all=1
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

set vb    " Silence audio notifications

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost .git/index set nolist

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

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

set hls                            " search with highlights by default
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>""

set autowriteall                   " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wall

if $TERM == 'screen-256color'
  set t_RV=[>c
endif

let g:CommandTWildIgnore=&wildignore . ",node_modules/**/*,vendor/assets/components/**/*,public/**/*"
let g:CommandTMaxHeight=10

let g:Powerline_symbols = 'fancy'
set encoding=utf-8 " Necessary to show unicode glyphs

autocmd FileType javascript let b:surround_36 = "$(\r)"
                        \ | let b:surround_95 = "_(\r)"

let ruby_operators=1

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

runtime macros/matchit.vim

highlight clear SignColumn
call gitgutter#highlight#define_highlights()

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

" Function that does the work
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction
