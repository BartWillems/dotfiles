"""""""""""""""""""""""""""""
"        Behaviour          "
"""""""""""""""""""""""""""""
set nocompatible                " Don't behave like Vi
set wildmenu                    " Enhanced command line completion
set wildmode=longest,list       " Complete the longest match, then list others
set backspace=indent,eol,start  " Allow backspacing over more stuff
set confirm                     " Ask to confirm instead of failing
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive if search term contains capitals
set linebreak                   " Allow linebreaks between words
set scrolloff=2                 " Start scrolling a few lines from the border
set visualbell                  " Use colour blink instead of sound
set display+=lastline           " Always display the last line of the screen
set encoding=utf8               " Use utf8 as internal encoding
set whichwrap+=<,>,h,l          " Allow cursor to wrap lines
set hidden                      " Allow opening new buffers without saving changes
set laststatus=2                " Wider status line, needed for powerline
set splitbelow                  " Split window below
set splitright                  " Split window to the right
set copyindent                  " Preserve copy indentation 
set mouse=a                     " Enable mouse
set colorcolumn=80              " Visual 80 width column

"""""""""""""""""""""""""""""
"        Formatting         "
"""""""""""""""""""""""""""""
set tabstop=4       " Width of the tab character
set expandtab       " Convert tabs to spaces
set softtabstop=0   " How many columns the tab key inserts
set shiftwidth=4    " Width of 1 indentation level
set smartindent     " Smart C-like autoindenting
set smarttab        " Smart tab indentation

" Determine indentation rules by filetype
filetype plugin indent on
autocmd filetype yaml    set tabstop=2
autocmd filetype yaml    set shiftwidth=2

"""""""""""""""""""""""""""""
"        Interface          "
"""""""""""""""""""""""""""""
set number          " Show line numbers
set showmatch       " When inserting brackets, highlight the matching one
set hlsearch        " Highlight search results
set incsearch       " Highlight search results as the search is typed
set showcmd         " Show command on the bottom
set ruler           " Show line and cursor position
set cursorline      " Highlight current line
set listchars=tab:>-,trail:· " Show tabs and trailing space
set list            " Enable the above settings
set hidden          " No need to save the current buffer every time you do a goto-definition
set nosmd
syntax on           " Enable syntax highlighting

"""""""""""""""""""""""""""""
"        Plugins            "
"""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'             " Autocomplete quotes, parens, brackets,...
Plug 'cespare/vim-toml'

call plug#end()

let g:airline_left_sep = ''     " Use simple separators
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_theme='atomic'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 0
let g:racer_cmd = "/home/bart/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" Elm
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

let delimitMate_expand_cr = 1

" Ansible
let g:ansible_unindent_after_newline = 1


"""""""""""""""""""""""""""""
"        Key mapping        "
"""""""""""""""""""""""""""""
" j and k go up/down a row in wrapped lines
nnoremap j gj
nnoremap k gk

" Use space to clear search highlights and any message displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Nice tabs navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Split view
nnoremap vv  :vsplit<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <F8> :TagbarToggle<CR>

" F2 toggles NERDTree view
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :set invpaste paste?<CR>

" F3 toggles paste mode
set pastetoggle=<F3>
set showmode


"""""""""""""""""""""""""""""
"        Custom Edits       "
"""""""""""""""""""""""""""""
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" A trick for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts).
" This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null


"""""""""""""""""""""""""""""
"        Colours and GUI    "
"""""""""""""""""""""""""""""
if &term=='xterm'   " xterm supports 256 colours but doesn't set this
    set t_Co=256
endif
if &t_Co==256
    let base16colorspace=256
    set background=dark     " Use dark background
    colorscheme gruvbox
    endif
if has("gui_running")
    let base16colorspace=256
    set background=dark     " Use dark background
    colorscheme gruvbox
    set guioptions+=TlrbRLe " Bug workaround
    set guioptions-=TlrbRLe " Hide the toolbar and scrollbars, use text tabs
    set guioptions+=c       " Don't open dialogue windows
    if has("linux")
        set guifont=Roboto\ Mono\ for\ Powerline\ 10
    elseif has("Win32")
        set guifont=Consolas:h10
    endif
endif
