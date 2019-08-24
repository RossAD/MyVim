" Python IDE vimrc file
set nocompatible
set encoding=utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugs/')
" Load Plugins here

" Set of sensible defaults
Plug 'tpope/vim-sensible'
" A.L.E. Aysnc Linting
" Plug 'w0rp/ale'
" C.O.C Async Linting/Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Vim Snippets
Plug 'honza/vim-snippets'
" Javascript language support including Angular
Plug 'othree/javascript-libraries-syntax.vim'
" More full-featured JS syntax support
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
" Better JSON support
Plug 'elzr/vim-json'
" Go Language Plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
" TERN for vim
" Plug 'ternjs/tern_for_vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
" VimCompletesMe
" Plug 'ajh17/vimcompletesme'
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
" Javascript docstring
Plug 'heavenshell/vim-jsdoc'
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
" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" General configuration options
let mapleader = ','
set nu
set clipboard=unnamed
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
" Vim OmniComplete
" set omnifunc=syntaxcomplete#Complete
" set redrawtime=10000

" Fuzzy Finder
set rtp+=/usr/local/opt/fzf
" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" select all mapping
noremap <leader>a ggVG
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
set expandtab     " use spaces instead of tabs
set softtabstop=2
set shiftwidth=2
set autoindent    " autoindent based on the line above, works most of the time
" set smartindent

set smartcase
set ignorecase

filetype on
" filetype plugin on
filetype plugin indent on

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
" let g:pymode_python = 'python3'
" let python_highlight_all=1
" syntax on
" let g:jedi#force_py_version=3
" let g:jedi#auto_close_doc = 0

" tag completion
" :iabbrev </ </<c-x><c-o>
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
" autocmd FileType vim let b:vcm_tab_complete = 'vim'
" autocmd FileType javascript let b:vcm_tab_complete = 'javascript'
" autocmd FileType python let b:vcm_tab_complete = 'python'
" autocmd FileType java let b:vcm_tab_complete = 'java'
" autocmd FileType php let b:vcm_tab_complete = 'php'

" suggestion for normal mode commands
set wildmode=list:longest

" Turn on autocomplete
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=jedi#completions
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ALE settings
" let g:ale_python_pylint_executable = 'python3'
" let g:airline#extensions#ale#enabled = 1
" let g:ale_sign_column_always = 1
" let g:ale_linters = {
"       \   'javascript': ['eslint'],
"       \   'jsx': ['eslint'], 
"       \   'python': ['autopep8', 'flake8'],
"       \   'php': ['php', 'phpcs'],
"       \   'html': ['tidy']
"       \} 
" let g:ale_linter_aliases = {'jsx': 'css'}
" let g:ale_fixers = {
"       \   '*': ['remove_trailing_lines', 'trim_whitespace'],
"       \   'javascript': ['eslint'],
"       \   'python' : ['autopep8'],
"       \   'php' : ['php_cs_fixer'],
"       \   'html': ['prettier']
"       \}
" let g:ale_cache_executable_check_failures = 1

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

" JSDOC config
let g:jsdoc_enable_es6 = 1
nmap <silent> <C-l> <Plug>(jsdoc)

" GoLang Options
let g:polyglot_disabled = ['go']

" C.O.C. option
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
