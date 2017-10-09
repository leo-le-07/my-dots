runtime macros/matchit.vim

" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

" added nerdtree
Plug 'scrooloose/nerdtree'

" search find
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'

" surrounding
Plug 'tpope/vim-surround'

" search file global
Plug 'dkprice/vim-easygrep'

" repeat
Plug 'tpope/vim-repeat'

" comment
Plug 'tpope/vim-commentary'

" vim theme
Plug 'altercation/vim-colors-solarized'
Plug 'jpo/vim-railscasts-theme'

" rails plugin vim
Plug 'tpope/vim-rails'

" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'

" haml, sass, scss
Plug 'tpope/vim-haml'

" rails refactoring tool
Plug 'ecomba/vim-ruby-refactoring'

" Indent for jst/ejs syntax
Plug 'briancollins/vim-jst'

" CSS colors
Plug 'ap/vim-css-color'

" JSX syntax
Plug 'mxw/vim-jsx'

" RuboCop
Plug 'ngmy/vim-rubocop'

" Reek
Plug 'rainerborene/vim-reek'

" bundler
Plug 'tpope/vim-bundler'

" rspec
Plug 'thoughtbot/vim-rspec'

" javascript syntax
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'

" javascript ctags
Plug 'ramitos/jsctags'

" coffeescript syntax
Plug 'kchmck/vim-coffee-script'

" ejs syntax
Plug 'nikvdp/ejs-syntax'

" git
Plug 'tpope/vim-fugitive'

" Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-eunuch'

" SnipMate manage code snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

Plug 'vim-scripts/AutoComplPop'
Plug 'alvan/vim-closetag'

" Airline tabline/status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" Enable theme
syntax enable
set background=dark
" set background=light
" colorscheme railscasts
colorscheme solarized

set timeoutlen=1000 ttimeoutlen=0

" for intending
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" Set hightlight current row and column
set cursorline
set cursorcolumn
highlight CursorLine gui=underline cterm=underline
" highlight CursorColumn ctermbg=16
set colorcolumn=80
set hlsearch
" highlight ColorColumn ctermbg=16
highlight Search cterm=NONE ctermfg=16 ctermbg=100
" hi Search guibg=Yellow guifg=Black ctermbg=Yellow ctermfg=Black

" for ctags
set tags=./tags;

set relativenumber 
set ignorecase " Case insensitive pattern matching
set smartcase " Overrides ignorecase if pattern contains upcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" remapping leader character
let mapleader = ","

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Set default size window NERDTree
" let g:NERDTreeWinSize=40

" Show hidden file NERDTree
let NERDTreeShowHidden=0

let g:javascript_plugin_jsdoc = 1

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.ejs,*.js"

" Only show Reek's message when open the location list
let g:reek_always_show = 0
let g:reek_on_loading = 0

" RuboCop binding key
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
nmap <Leader>ra :RuboCop -a<CR>

" Allow JSX in normal JS files
let g:jsx_ext_required = 0 

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

imap jj <esc>
nmap j gj
nmap k gk
nmap <leader><Space> :w<cr> " save file
nmap <leader>vs :vsp<cr>
nmap <leader>hs :sp<cr>
map <Leader>vi :tabe ~/.vimrc<CR>
nmap <leader>so :source ~/.vimrc<cr>:PlugInstall<cr>
nmap <leader>tn :tabe<cr>
nmap <leader>te :tabe %<cr>
nmap <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>

" set for clipboard
set clipboard=unnamed
if $TMUX == ''
  set clipboard+=unnamed
endif
map <F1> :.!pbcopy<CR>
map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>

vnoremap <Leader>c "*y
vnoremap <Leader>x "*d
vnoremap <Leader>p "*p

" puts the caller for debug
nnoremap <leader>wtf oputs "#{"#" * 90}BEGIN message"<cr>puts caller<cr>puts "#{"#" * 90}END message"<esc>
