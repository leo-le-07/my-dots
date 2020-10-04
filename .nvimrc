" plugins
call plug#begin('~/.config/nvim/plugged')

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" auto-close
Plug 'jiangmiao/auto-pairs'

" added nerdtree
Plug 'scrooloose/nerdtree'

" commenter
Plug 'scrooloose/nerdcommenter'

" themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'haishanh/night-owl.vim'

" navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plug 'christoomey/vim-tmux-navigator'

" repeat
Plug 'tpope/vim-repeat'

" easy-motion
Plug 'easymotion/vim-easymotion'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

call plug#end()

" === remapping leader character
let mapleader = ","

" === THEMS/COLORS
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
let g:one_allow_italics = 1

" === === enable dark theme
set background=dark
let g:dracula_italic=0
colorscheme dracula

" === === background transparency
hi Normal ctermbg=NONE guibg=NONE

" === easymotion
nmap <Leader>f <Plug>(easymotion-bd-w)

" === scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1

" === airblade/vim-gitgutter
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0 " remove mapping keys vim-gitgutter

" === alvan/vim-closetag
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

" === vim-airline/vim-airline-themes
let g:airline_theme='papercolor'

" === vim-airline
let g:airline#extensions#branch#enabled = 0

" === NERDTree
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1 " hide hidden file by default
map <leader>n :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

" === end NERDTree

" === nvim-lspconfig
lua << EOF
require'nvim_lsp'.gopls.setup{}
EOF

set completeopt-=preview
" === end nvim-lspconfig

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" === MAPPING KEYS
imap jj <esc>
nmap j gj
nmap k gk
nmap <leader><Space> :w<cr> " save file
nmap <leader>vs :vsp<cr>
nmap <leader>hs :sp<cr>
map <Leader>nvim :tabe ~/.config/nvim/init.vim<CR>
nmap <leader>tn :tabe<cr>
nmap <leader>te :tabe %<cr>
" === end MAPPING KEYS

" === EDITOR SETTINGS
" === === Common settings
set relativenumber
set number
set colorcolumn=80
set hlsearch
set ignorecase
set smartcase
set list
set tabstop=2 shiftwidth=2 expandtab

" === === Set hightlight current row and column
set cursorline
set cursorcolumn

" === === Cursor settings
set termguicolors
hi Cursor guifg=white guibg=black
hi Search guibg=peru guifg=wheat

" === end EDITOR SETTINGS

" === quick source neovim and install plug plugins
nmap <leader>so :source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
