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
Plug 'sheerun/vim-polyglot'
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
" Git wrapper
Plug 'tpope/vim-fugitive'
" Plugin for Auto-comlete for quotes, parenthesis, brackets
Plug 'raimondi/delimitmate'
" Plugin for multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Plugin for tmux-vim intigration
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" General configuration options

" Clear any autocmd out
" augroup myvim
"   autocmd!
" augroup

if !exists("g:syntax_on")
  syntax enable
endif

let mapleader = ','

" make backspace delete sensibly
set backspace=indent,eol,start

" Turn on autocomplete
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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
filetype indent on

set clipboard=unnamed

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
let g:airline_theme='wombat'

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
let g:neocomplete#enable_at_startup = 1
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
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
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
let g:ale_linters = {'javascript': ['eslint']} 

" Vim Splits: Window nav Keymappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
