" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" added nerdtree
Plug 'scrooloose/nerdtree'

" commenter
Plug 'scrooloose/nerdcommenter'

" surround
" Plug 'tpope/vim-surround'

" automatic closing of quotes, parenthesis, brackets, etc.
" Plug 'Raimondi/delimitMate'

" helps to end certain structures automatically
Plug 'tpope/vim-endwise'

" mutiple cursors
Plug 'terryma/vim-multiple-cursors'

" themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'crusoexia/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" typescript
Plug 'leafgarland/typescript-vim'

" search find
Plug 'ctrlpvim/ctrlp.vim'

" tag
Plug 'ludovicchabant/vim-gutentags'

" run shell commands in background and read output in the quickfix window in
" realtime
Plug 'skywind3000/asyncrun.vim'

" navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plug 'christoomey/vim-tmux-navigator'

" asynchronous keyword completion system in the current buffer
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'

" repeat
Plug 'tpope/vim-repeat'

" this makes font tmux and vim error - fix later
" Plug 'edkolev/tmuxline.vim'

" === BEGINNING javascript pluggins
" syntax highlighting and impoved indentation javascript
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'

" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
Plug 'grvcoelho/vim-javascript-snippets'

" highlighting and indenting for JSX
Plug 'mxw/vim-jsx'

" vue
Plug 'posva/vim-vue'

" ejs syntax
Plug 'nikvdp/ejs-syntax'

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

" MQ4 syntax
Plug 'vobornik/vim-mql4'

call plug#end()

" fzf configuration
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>

" themes / colors
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
let g:one_allow_italics = 1

" let g:dracula_italic=0
" colorscheme dracula
" colorscheme NeoSolarized

" colorscheme monokai
" let g:molokai_original = 1

set background=light
colorscheme PaperColor

" set background=light
" colorscheme one

" === for coc.nvim configuration ===
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

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
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>en <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" for ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Uncomment 2 following commands in order to auto reload file changed
" after 4 s of inactivity in normal mode
" set autoread
" au CursorHold * checktime

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

" run time path
set runtimepath+=expand('~/.vim/vim-mql4')

" for vim-airline/vim-airline-themes for
" let g:airline_theme='cobalt2'
" let g:airline_theme='term'
let g:airline_theme='papercolor'
" let g:airline_theme='one'

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
let NERDTreeShowHidden=1 " hide hidden file by default
map <leader>n :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

" settings editor
set relativenumber
set number
set colorcolumn=80
set hlsearch
set ignorecase
set smartcase
set list
set tabstop=2 shiftwidth=2 expandtab

" Set hightlight current row and column - SLOW_VIM
set cursorline
set cursorcolumn

" setting cursor
set termguicolors
" hi CursorColumn guifg=white guibg=black
" highlight CursorLine ctermbg=LightBlue
hi Cursor guifg=white guibg=black
hi Search guibg=peru guifg=wheat

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

" for CtrlP plugin
" (https://stackoverflow.com/questions/21017857/ctrlp-still-searches-the-ignored-directory#answer-23015387)
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage'
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_use_caching = 0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" === BEGINNING alias
" console.log
nnoremap <leader>cl oconsole.log('');<esc>
" === END alias
