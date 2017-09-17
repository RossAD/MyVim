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
" Syntastic Syntax checking
Plug 'vim-syntastic/syntastic'
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
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

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
" set showtabline=2

" Lightline Configuration
" let g:lightline#bufferline#show_number  = 1
" let g:lightline#bufferline#shorten_path = 0
" let g:lightline#bufferline#unnamed      = '[No Name]'

" let g:lightline                         = {}
" let g:lightline.tabline                 = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand        = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type          = {'buffers': 'tabsel'}
" let g:lightline.colorscheme             = 'powerline'
" let g:lightline.active                  = {'left':[['mode', 'paste'],['gitbranch','readonly','filename','modified']]}
" let g:lightline.component               = {'lineinfo': 'Ln %3l:%-2v'}
" let g:lightline.component_function      = {'gitbranch': 'fugitive#head'}
" let g:lightline.seperator               = {'left': '>', 'right': '<'}
" let g:lightline.subseperator            = {'left': '>', 'right': '<'}

" Airline Configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_javascript_checkers      = ['eslint']
let g:syntastic_enable_signs             = 1
set signcolumn=yes

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
