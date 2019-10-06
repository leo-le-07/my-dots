" plugins
call plug#begin('~/.config/nvim/plugged')

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" auto-close
Plug 'jiangmiao/auto-pairs'

" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" added nerdtree
Plug 'scrooloose/nerdtree'

" commenter
Plug 'scrooloose/nerdcommenter'

" themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'

" tag
Plug 'ludovicchabant/vim-gutentags'

" navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plug 'christoomey/vim-tmux-navigator'

" repeat
Plug 'tpope/vim-repeat'

" easy-motion
Plug 'easymotion/vim-easymotion'

" syntax highlighting and impoved indentation javascript
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'

" highlighting and indenting for JSX
Plug 'mxw/vim-jsx'

" vue syntax
Plug 'posva/vim-vue'

" typescript syntax
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" ruby (rails)
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

Plug 'alvan/vim-closetag'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

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

" === === enable light theme
" set background=light
" colorscheme one

" === end THEMS/COLORS

" === fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-p> :Files<Cr>
nnoremap <C-e> :History<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-f> :Rg<Cr>
nnoremap K :Rg! <C-R><C-W><CR>

" === end fzf

" === coc.nvim
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes


" use <tab> for trigger completion and navigate to next complete item
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
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" === end coc.nvim

" === easymotion
nmap <Leader>f <Plug>(easymotion-bd-w)

" === pangloss/vim-javascript plugin
let g:javascript_plugin_flow = 1

" === mxw/vim-jsx
let g:jsx_ext_required = 0

" === scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1

" === airblade/vim-gitgutter
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0 " remove mapping keys vim-gitgutter

" === alvan/vim-closetag
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

" === vim-airline/vim-airline-themes
" let g:airline_theme='cobalt2'
let g:airline_theme='papercolor'

" === vim-airline
" hide branch
let g:airline#extensions#branch#enabled = 0

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

" === NERDTree
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1 " hide hidden file by default
map <leader>n :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

" === end NERDTree

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

" === Clipboard
set clipboard+=unnamedplus
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" === end Clipboard

" === Shortcuts
" === === This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR>

