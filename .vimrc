" Python IDE vimrc file
set nocompatible
set encoding=utf-8
filetype off

call plug#begin('~/.vim/plugs/')
" Load Plugins here

" Set of sensible defaults
Plug 'tpope/vim-sensible'
" A.L.E. Aysnc Linting
Plug 'w0rp/ale'
" Javascript language support including Angular
Plug 'othree/javascript-libraries-syntax.vim'
" More full-featured JS syntax support
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
" Polyglot syntax highlighting
Plug 'sheerun/vim-polyglot'
" Commenting Plugin
Plug 'tomtom/tcomment_vim'
" Code folding helper
Plug 'tmhedberg/SimpylFold'
" Python indentation helper
Plug 'vim-scripts/indentpython.vim'
" Additional Python Syntax
Plug 'vim-python/python-syntax'
" Auto-completion
" Plug 'Valloric/YouCompleteMe'
" VimCompletesMe
Plug 'ajh17/vimcompletesme'
" Surround, [],{},"",'',etc
Plug 'tpope/vim-surround'
" Plugin for Auto-complete for quotes, parenthesis, brackets
Plug 'raimondi/delimitmate'
" Plugin for HTML/XML tag completion 
Plug 'docunext/closetag.vim'
" Plugin repeatability
Plug 'tpope/vim-repeat'
" Syntax highlighting
" Plug 'vim-syntastic/syntastic'
" Python Support
Plug 'davidhalter/jedi-vim'
" Python docstring
Plug 'heavenshell/vim-pydocstring'
" Pep 8 Checking
Plug 'nvie/vim-flake8'
" Nerdtree file tree browser
Plug 'scrooloose/nerdtree'
" Fuzzy Search
Plug 'kien/ctrlp.vim'
" Git integration
Plug 'tpope/vim-fugitive'
" Airline status line
Plug 'vim-airline/vim-airline'
" Tabularize alignment
Plug 'godlygeek/tabular'
" Gutter Git status
Plug 'airblade/vim-gitgutter'
" Plugin for multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Tabularize alignment
Plug 'godlygeek/tabular'
" Searching with grep
Plug 'vim-scripts/grep.vim'
" Color Scheme
Plug 'flazz/vim-colorschemes'

call plug#end()

" General configuration options
let mapleader = ','
set nu
set clipboard=unnamed
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" select all mapping
noremap <leader>a ggVG
" fzf binding
set rtp+=/usr/local/opt/fzf
" json formatting
nmap =j :%!python -m json.tool<CR>
" set vim to reletive directory of file
set autochdir
" make backspace delete sensibly
set backspace=indent,eol,start
" tag completion
:iabbrev </ </<c-x><c-o>
" select all mapping
noremap <leader>a ggVG
" reloads the .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
" Current line marker
:set number
:set cursorline
:hi cursorline cterm=none
:hi cursorlinenr ctermfg=green

" Setting splits
set splitbelow
set splitright
" Vim Splits: Window nav Keymappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tabularize settings
vnoremap <silent> <Leader>cee :Tabularize /=<CR>
vnoremap <silent> <Leader>cet :Tabularize /#<CR>
vnoremap <silent> <Leader>ce :Tabularize /

" TComment mapping
noremap <silent> <Leader>cc :TComment<CR>

" Enable Folding
set foldmethod=indent
set foldlevel=99

" Enable Folding with spacebar
nnoremap <space> za

let g:SimplyFold_docstring_preview=1

" Other indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab     " use spaces instead of tabs
set autoindent    " autoindent based on the line above, works most of the time

" Flag unwanted whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

" Python highlighting
let g:pymode_python = 'python3'
let python_highlight_all=1
syntax on
let g:jedi#force_py_version=3
let g:jedi#auto_close_doc = 0

" tag completion
:iabbrev </ </<c-x><c-o>
" Tag completion options

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" Shortcut for closing tags, default is '>'

" Vim-JSX settings
let g:jsx_ext_required = 0

" Statusline General
set laststatus=2
set noshowmode

" Airline Configuration
let g:airline_powerline_fonts = 1
" let g:airline_theme='base16color'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" NERDTree
" autocmd vimenter * NERDTree
map <C-d> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Vim Complete Me Config
autocmd FileType vim let b:vcm_tab_complete = 'vim'
autocmd FileType javascript let b:vcm_tab_complete = 'javascript'
autocmd FileType python let b:vcm_tab_complete = 'python'
autocmd FileType java let b:vcm_tab_complete = 'java'
autocmd FileType php let b:vcm_tab_complete = 'php'

" suggestion for normal mode commands
set wildmode=list:longest

" Turn on autocomplete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ALE settings
let g:ale_python_pylint_executable = 'python3'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {'javascript': ['eslint'],'jsx': ['eslint'], 'python': ['pylint', 'flake8']} 
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python' : ['autopep8']  
\}
let g:ale_cache_executable_check_failures = 1

" Syntastic Settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" Tag completion options

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'
" tag completion
:iabbrev </ </<c-x><c-o>
