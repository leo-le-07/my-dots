" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" added nerdtree
Plug 'scrooloose/nerdtree'

" commenter
Plug 'scrooloose/nerdcommenter'

" surround
Plug 'tpope/vim-surround'

" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" helps to end certain structures automatically
Plug 'tpope/vim-endwise'

" mutiple cursors
Plug 'terryma/vim-multiple-cursors'

" themes
Plug 'iCyMind/NeoSolarized'
Plug 'NLKNguyen/papercolor-theme'

" search find
Plug 'ctrlpvim/ctrlp.vim'

" tag
Plug 'ludovicchabant/vim-gutentags'

" run shell commands in background and read output in the quickfix window in
" realtime
Plug 'skywind3000/asyncrun.vim'

" codeclimate
Plug 'wfleming/vim-codeclimate'

" navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plug 'christoomey/vim-tmux-navigator'

" asynchronous keyword completion system in the current buffer
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" repeat
Plug 'tpope/vim-repeat'

" this makes font tmux and vim error - fix later
" Plug 'edkolev/tmuxline.vim'

" === BEGINNING javascript pluggins 
" syntax highlighting and impoved indentation javascript
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'

" highlighting and indenting for JSX
Plug 'mxw/vim-jsx'

" ejs syntax
Plug 'nikvdp/ejs-syntax'

" asynchronously run programs
Plug 'neomake/neomake'
" END javascript pluggins

" === BEGINNING ruby / rails pluggins
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-haml'

" ruby block
runtime macros/matchit.vim
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'thoughtbot/vim-rspec'
" === END ruby / rails pluggins

" === BEGINNING git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" === END git

call plug#end()

" themes / colors
syntax enable
set background=dark
colorscheme NeoSolarized
" set background=light
" colorscheme PaperColor

" for Shougo/deoplete.nvim plugin
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
let deoplete#tag#cache_limit_size = 5000000

" for LanguageClient-neovim plugin
let g:LanguageClient_serverCommands = {
\ 'javascript': ['flow-language-server', '--try-flow-bin', '--stdio'],
\ 'javascript.jsx': ['flow-language-server', '--try-flow-bin', '--stdio'],
\ }
let g:LanguageClient_autoStart = 1
au FileType javascript nnoremap <silent> <c-]> :call LanguageClient_textDocument_definition()<cr>
au FileType javascript nnoremap <silent> <leader>rn :call LanguageClient_textDocument_rename()<cr>
let g:LanguageClient_diagnosticsList='location'

" for pangloss/vim-javascript plugin
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" for mxw/vim-jsx plug
let g:jsx_ext_required = 0

" for scrooloose/nerdcommenter plugin
let g:NERDSpaceDelims = 1

" for airblade/vim-gitgutter plugin
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0 " remove mapping keys vim-gitgutter

" for multiple-cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_next_key='<C-s>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" for vim-multiple-cursors works with neocomplete plugin
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" for vim-airline/vim-airline-themes for
let g:airline_theme='papercolor'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'

" for neomake/neomake plugin
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']
let g:neomake_java_enabled_makers = []
let g:neomake_open_list = 0
let g:neomake_error_sign = {'text': '✖', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '⚠','texthl': 'WarningMsg'}
let g:neomake_message_sign = {'text': '➤','texthl': 'MessageMsg'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'InfoMsg'}

" for flow and eslint
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
if g:flow_path != 'flow not found'
"  let g:deoplete#sources#flow#flow_bin = g:flow_path
  let g:neomake_javascript_flow_exe = g:flow_path
"  let g:flow#flowpath = g:flow_path
endif

let g:eslint_path = StrTrim(system('PATH=$(npm bin):$PATH && which eslint'))
if g:eslint_path != 'eslint not found'
  let g:neomake_javascript_eslint_exe = g:eslint_path
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" remapping leader character
let mapleader = ","

" mapping keys
imap jj <esc>
nmap j gj
nmap k gk
nmap <leader><Space> :w<cr> " save file
nmap <leader>vs :vsp<cr>
nmap <leader>hs :sp<cr>
map <Leader>nvim :tabe ~/.config/nvim/init.vim<CR>
nmap <leader>tn :tabe<cr>
nmap <leader>te :tabe %<cr>

" NERDTree
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=0 " hide hidden file by default
map <leader>n :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

" settings editor
set relativenumber
set number
set colorcolumn=80
set hlsearch
set ignorecase
set smartcase
highlight Search cterm=NONE ctermfg=16 ctermbg=100
set list
set tabstop=2 shiftwidth=2 expandtab

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Set hightlight current row and column - SLOW_VIM
" set cursorline
" set cursorcolumn

" quick source neovim and install plug plugins
nmap <leader>so :source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>

" clipboard
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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
