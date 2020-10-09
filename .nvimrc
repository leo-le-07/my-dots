" plugins
call plug#begin('~/.config/nvim/plugged')

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" added nerdtree
Plug 'scrooloose/nerdtree'

" navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-repeat'

" easy-motion
Plug 'easymotion/vim-easymotion'

" theme
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
" Plug 'mhartington/oceanic-next'

" LanguageClient-neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" ale
Plug 'dense-analysis/ale'

" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" javascript syntax highlighting
" Plug 'pangloss/vim-javascript'
" syntax highlighting
Plug 'sheerun/vim-polyglot'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" === remapping leader character
let mapleader = ","

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
set hlsearch
set ignorecase
set smartcase
set list
set tabstop=2 shiftwidth=2 expandtab
" clear highlighting
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

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
nnoremap <silent> p :call ClipboardPaste()<cr>p

" === end Clipboard

" === vim-airline/vim-airline-themes
let g:airline_theme='papercolor'
" let g:airline_theme='oceanicnext'

" === vim-airline
let g:airline#extensions#branch#enabled = 0

" == theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
 set termguicolors
endif
syntax on

" gruvbox
autocmd vimenter * colorscheme gruvbox

" oceanic-next
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" if (has("termguicolors"))
"  set termguicolors
" endif
" syntax on
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

" dracula
" let g:one_allow_italics = 1
" set background=dark
" let g:dracula_italic=0
" colorscheme dracula

" == end theme

" === easymotion
nmap <Leader>f <Plug>(easymotion-bd-w)

" === fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-o> :Files<Cr>
nnoremap <C-f> :Rg<Cr>
nnoremap <C-e> :History<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap K :Rg! <C-R><C-W><CR>

" === end fzf

" === NERDTree
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1 " hide hidden file by default
map <leader>n :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

" === end NERDTree

" === LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'go': ['gopls'],
    \ }

nmap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nmap <silent> gr :call LanguageClient#textDocument_rename()<CR>
nmap <silent> gx :call LanguageClient#textDocument_references()<CR>
nmap <silent> gc :call LanguageClient#textDocument_completion()<CR>
nmap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nmap <silent> gm :call LanguageClient_contextMenu()<CR>
nmap <silent> gf :call LanguageClient#textDocument_formatting()<CR>
nmap <silent> gt :call LanguageClient#textDocument_typeDefinition()<CR>

" === end LanguageClient-neovim

" === deoplete
let g:deoplete#enable_at_startup = 1

" === golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
