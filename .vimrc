set nocompatible
call plug#begin('~/.vim/plugs/')
" Load Plugins here

" Commenting Plugin
Plug 'tomtom/tcomment_vim'
" Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
" Airline status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Polyglot syntax highlighting
" Plug 'sheerun/vim-polyglot'
" More full-featured JS syntax support
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
" Javascript language support including Angular
Plug 'othree/javascript-libraries-syntax.vim'
" TypeScript Support
Plug 'leafgarland/typescript-vim'
Plug 'quramy/tsuquyomi'
" Better JSON support
Plug 'elzr/vim-json'
" Editorconfig support
Plug 'editorconfig/editorconfig-vim'
" A.L.E. Aysnc Linting
Plug 'w0rp/ale'
" Tabularize alignment
Plug 'godlygeek/tabular'
" Gutter Git status
Plug 'airblade/vim-gitgutter'
" Neocomplete completion engine
Plug 'shougo/neocomplete.vim'
" Surround, [],{},"",'',etc
Plug 'tpope/vim-surround'
" Plugin for Auto-complete for quotes, parenthesis, brackets
Plug 'raimondi/delimitmate'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Bitbucket support form vim-fugitive
Plug 'tommcdo/vim-fubitive'
" Plugin for multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Plugin for tmux-vim intigration
Plug 'christoomey/vim-tmux-navigator'
" Plugin for HTML/XML tag completion 
Plug 'docunext/closetag.vim'
" Plugin writing enviroment / MD
Plug 'junegunn/goyo.vim'
" Plugin repeatability
Plug 'tpope/vim-repeat'
" Set of sensible defaults
Plug 'tpope/vim-sensible'
" Database Plugin
Plug 'tpope/vim-dadbod'
" Code tracking
Plug 'wakatime/vim-wakatime'
" Graphql file detection
Plug 'jparise/vim-graphql'
" NERDTree File Explorer
Plug 'scrooloose/nerdtree'
" NERDTree Git Plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Vim Icons
Plug 'ryanoasis/vim-devicons'
" Nerdtree Icon Highlighting
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Grep for vim
Plug 'vim-scripts/grep.vim'

call plug#end()

" General configuration options

" Clear any autocmd out
" augroup myvim
"   autocmd!
" augroup
set encoding=utf8
set guifont=DroidSansMono_Nerd_Font:h11
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add

" reload files changed outside vim
set autoread

if !exists("g:syntax_on")
  syntax enable
endif

let mapleader = ','

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" no lines longer than 80 cols
autocmd FileType javascript setlocal textwidth=80 formatoptions+=t

" make backspace delete sensibly
set backspace=indent,eol,start

" Turn on autocomplete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Python Configuration
let python_highlight_all = 1

" tag completion
:iabbrev </ </<c-x><c-o>

" Don't unload buffers when abandond, keep in the backround
set hidden

" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"   .less files use less syntax
autocmd BufNewFile,BufRead *.less setlocal ft=less

set listchars=tab:>.,trail:.,extends:#,nbsp:.

" select all mapping
noremap <leader>a ggVG

set smartcase
set ignorecase

filetype on
filetype plugin on
filetype plugin indent on

if $TMUX == ''
  set clipboard+=unnamed
endif

set number

" Indentation
set expandtab     " use spaces instead of tabs
set autoindent    " autoindent based on the line above, works most of the time
set smartindent   " smarter indent for c-like languages
set shiftwidth=2  " when reading, tabs are 2 spaces
set softtabstop=2 " in insert mode, tabs are 2 spaces

" absolute width of netrw window
let g:netrw_winsize = -28

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" open file in a new tab
let g:netrw_browse_split = 3

" TComment mapping
noremap <silent> <Leader>cc :TComment<CR>

" CtrlP Mappings
" Leader F for file related mappings (open, browse...)
nnoremap <silent> <Leader>f :CtrlP<CR>
nnoremap <silent> <Leader>fm :CtrlPMRU<CR>

" Ctrl B buffer related mappings
nnoremap <silent> <Leader>b :CtrlPBuffer<CR> "cycle between buffer"
nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer"
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete current buffer"
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload current buffer"
nnoremap <silent> <Leader>bl :setnomodifiable<CR> "(L)ock the current buffer"

" reloads the .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Statusline General
set laststatus=2
set noshowmode

" Airline Configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='base16color'
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

" Tabularize settings
vnoremap <silent> <Leader>cee :Tabularize /=<CR>
vnoremap <silent> <Leader>cet :Tabularize /#<CR>
vnoremap <silent> <Leader>ce :Tabularize /

" Vim-JSX settings
let g:jsx_ext_required = 0

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" suggestion for normal mode commands
set wildmode=list:longest

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" Neocomplete settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Enable heavy omni-completion
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Multiple cursor options
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" ALE settings
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {'javascript': ['eslint'],'jsx': ['eslint']} 
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" Vim Splits: Window nav Keymappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Current line marker
:set number
:set cursorline
:hi cursorline cterm=none
:hi cursorlinenr ctermfg=green

" Tag completion options

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Javascript Syntax Libraries
let g:used_javascript_libs = 'angularjs,d3'

" NERDTree
" autocmd vimenter * NERDTree
map <C-d> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" TypeScript
let g:tsuquyomi_completion_detail = 1
