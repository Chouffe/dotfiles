" Plugins {{{
call plug#begin('~/.vim/plugged')

" comment out stuff
Plug 'tpope/vim-commentary'
" Readline style insertion
Plug 'tpope/vim-rsi'
" Heuristically set buffer options
Plug 'tpope/vim-sleuth'
" Helpers for Linux
Plug 'tpope/vim-eunuch'
" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" Pairs of handy bracket mapping
Plug 'tpope/vim-unimpaired'
" asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'
" project configuration
Plug 'tpope/vim-projectionist'
" enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'
" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" align with ease
Plug 'junegunn/vim-easy-align'
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Requirements: bash, gawk, fzf
Plug 'tweekmonster/fzf-filemru'
" Asynchronous
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Improved incremental searching
Plug 'haya14busa/incsearch.vim'
" provides improved * motions
Plug 'haya14busa/vim-asterisk'
" displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
" Ctags generator for Vim
Plug 'szw/vim-tags'
" Ag for vim
Plug 'rking/ag.vim'
" Syntax checking hacks for vim
Plug 'scrooloose/syntastic', { 'for': ['python', 'javascript'] }
" Syntax checking for vim
" Plug 'neomake/neomake'
" Some utility functions for vim
Plug 'tomtom/tlib_vim'
" Interpret a file by function and cache file automatically
Plug 'MarcWeber/vim-addon-mw-utils'
" Delete all the buffers except the current/named buffer
Plug 'vim-scripts/BufOnly.vim'
" visually select increasingly larger regions of text using the same key
" combination
Plug 'terryma/vim-expand-region'
" Better Rainbow Parentheses
Plug 'kien/rainbow_parentheses.vim'
" continuously updated session files (to be used with tmux resurect)
Plug 'tpope/vim-obsession'
" help you stop repeating the basic movement keys
Plug 'takac/vim-hardtime'
" Lightweight easy motion
Plug 'justinmk/vim-sneak'
" Indentation level
Plug 'Yggdroot/indentLine'
" Cursor color
Plug 'miyakogi/conoline.vim'

" vim over: :substitute preview
Plug 'osyo-manga/vim-over'

Plug 'chouffe/tslime.vim'
" Plug 'benmills/vimux'
" Plug 'julienr/vimux-pyutils', {'for': 'python' }
" Python
Plug 'klen/python-mode', { 'for': 'python' }

" Ruby, Rails
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'danchoi/ri.vim', { 'for': 'ruby' }

" Graph your Vim undo tree in style.
Plug 'sjl/gundo.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'
" NERDTree and tabs together in Vim, painlessly
Plug 'jistr/vim-nerdtree-tabs'

" Goyo: Distraction free writing in vim
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" vim notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }

" Marks
Plug 'kshenoy/vim-signature'

" Racket Plugins
Plug 'wlangstroth/vim-racket', { 'for' : 'racket' }

" Clojure Plugins
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
" Plug 'honza/vim-clojure-conceal', { 'for' : 'clojure' }
Plug 'guns/vim-sexp', { 'for': ['clojure', 'scheme'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for' : ['clojure', 'scheme'] }
" Extend builtin syntax highlighting to referred and aliased vars in Clojure buffers
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Clojure runtime files
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" provides a repl that supports breakpoints, documentation lookup, source code
" navigation, and omnicompletion.
Plug 'dgrnbrg/vim-redl', { 'for': 'clojure' }
Plug 'dgrnbrg/redl', { 'for': 'clojure' }
" static support for Leiningen and Boot
Plug 'tpope/vim-salve', { 'for': 'clojure' }
" the Clojure formatting tool.
" Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
" Plug 'venantius/vim-eastwood', { 'for': 'clojure' }

" Haskell Plugins
" Syntax highlighting: vim2hs/haksyn/haskell_syntax
" Plug 'dag/vim2hs', { 'for': 'haskell' }
" Plug 'travitch/hasksyn', { 'for' : 'haskell' }
" Plug 'urso/haskell_syntax.vim', { 'for' : 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Vim plugin for Haskell development
" Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
" Vim plugin used to query hoogle, the haskell search engine
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Extended Haskell Conceal feature for Vim
" Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
" Create ctags compatible tags files for Haskell programs
" Plug 'bitc/lushtags', { 'for': 'haskell' }

Plug 'neomake/neomake', { 'for': 'haskell' }
Plug 'MarcWeber/hasktags', { 'for': 'haskell' }

" Idris Plugins
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }

" Html/Xml editing
Plug 'tpope/vim-ragtag', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': 'html' }

" JavaScript
" Plug 'othree/jspc.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'flowtype/vim-flow', { 'for': ['javascript', 'jsx'] }
Plug 'flowtype/vim-flow'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for':  ['html', 'javascript']}
Plug 'othree/javascript-libraries-syntax.vim', { 'for' : 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for':  'javascript', 'do': 'npm install'}
" provides insert mode auto-completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate', { 'for': ['haskell', 'html', 'javascript', 'python', 'ruby'] }

" CSS
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss'] }


" Ctrl-P
Plug 'kien/ctrlp.vim'

" Unite Plugins
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
" nallowing lines from current buffer
Plug 't9md/vim-unite-lines'
" MRU plugin includes unite.vim MRU sources
Plug 'Shougo/neomru.vim'
Plug 'tacroe/unite-mark'
Plug 'ujihisa/unite-colorscheme'
Plug 'tsukkee/unite-tag'
Plug 'osyo-manga/unite-quickfix'
Plug 'Shougo/unite-help'
Plug 'ujihisa/unite-haskellimport', { 'for': 'haskell' }
" Use / to search and then :Unite anzu to have a Unite buffer
Plug 'osyo-manga/vim-anzu'

" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'sjl/badwolf'
Plug 'mkarmona/colorsbox'
Plug 'Donearm/Ubaryd'
Plug 'joshdick/onedark.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'Wutzara/vim-materialtheme'

" Git Plugin
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/vim-gita'

" Tmux Plugin
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Simple tmux statusline generator with support for powerline symbols and
" statusline / airline / lightline integration
Plug 'christoomey/vim-tmux-navigator'
" Plug 'edkolev/tmuxline.vim'
" Plug 'itchyny/lightline.vim'
" vim plugin for tmux.conf
Plug 'tmux-plugins/vim-tmux'

" Editing keys
" e for entire file
" i for indent level
" l for current line
" u for url
" b for any block type (parens, braces, quotes, ltgt)
" = and i= for conflicts marked blocks
" f for function (c, java, js, php, vim only)
" i,/a, for function parameter
" r for a block in ruby
" f,c for function and class in python
" c for css class
"
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'mattn/vim-textobj-url'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'rhysd/vim-textobj-conflict'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'bps/vim-textobj-python'
Plug 'jasonlong/vim-textobj-css'

" Add plugins to &runtimepath
call plug#end()
" }}}

" Spaces and tabs {{{
" vim sleuth
" set tabstop=4       " number of visual spaces per TAB
" set shiftwidth=4
" set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set autoindent      " Indentation
set smartindent     " Indentation
" }}}

" UI and Layout {{{
set t_Co=256                " Number of colors used in terminal
if &term =~ '256color'
"   " disable Background Color Erase (BCE) so that color schemes
"   " render properly when inside 256-color tmux and GNU screen.
"   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
" " let base16colorspace=256
" let $NVIM_TUI_ENABLE_TRUE_COLOR='1'
set spelllang=en_gb         " Set region to British English
set mouse=a               " Enable mouse usage in terminal vim
" set mouse=                  " Disable mouse usage in terminal vim
set relativenumber          " Enable relative number
set number                  " Enable hybrid mode
" set encoding=utf-8          " UTF-8 encoding
set scrolloff=3             " number of screen lines to show around the cursor
set cursorline              " Highlight the line you are on
set cursorline cursorcolumn " Highlights the column you are in
set showmatch               " Show matches ({[
colorscheme hybrid_material " Awesome colorscheme
highlight Normal ctermbg=NONE      " No background color
highlight LineNr ctermfg=242  " Set line number colors grey
set pastetoggle=<F2>
" set textwidth=79          " Max text-width
filetype plugin indent on   " Enable filetype plugins
" Tab completion on the command line
" Wildmenu
set wildmenu
set wildmode=longest:full,full
" Splits
set splitbelow
set splitright
" Status line always on
set laststatus=2
" }}}

" Status Lines {{{
let g:tmuxline_theme = 'zenburn'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : ['#H', '#(whoami)'],
      \'c'    : '{prefix}',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : '{online status}',
      \'y'    : '{cpu_status}',
      \'z'    : '{battery_icon}'}
" }}}

" Searching {{{
set ignorecase  " ignore case when using a search pattern
set incsearch   " Highlight pattern matches as you type
set hlsearch    " Highlight the search results
" }}}

" anzu {{{
nmap n <Plug>(anzu-n-with-echo)
" nmap n <Plug>(anzu-mode-n)
nmap N <Plug>(anzu-N-with-echo)
" nmap N <Plug>(anzu-mode-N)

nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" }}}

" Movement {{{
" Insert Mode
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
" Exits INSERT mode without moving cursor (press jk)
inoremap jk <ESC>l
" Normal mode
" Remap the beginning of the line
nnoremap 0 ^
" Move to beginning/end of the line
nnoremap `` ^
nnoremap \\ $
nnoremap <BS><BS> $
" nnoremap <CR> G
" move to the search
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
" Multiple windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Visual block mode
nnoremap q <c-V>
" Visual Mode
vnoremap < <gv
vnoremap > >gv
vnoremap q <c-V>
" }}}

" Misc {{{
" No bell
set noerrorbells visualbell t_vb=
" Reload files changed outside vim
set autoread
" No swap files
set noswapfile
set nobackup
set nowb
"Equivalent to set backspace=indent,eol,start " backspace over everything in insert mode
set backspace=2
" turn off search highlight
" It hides buffers instead of closing them
set hidden
" Alignment/Indentation
" nnoremap == mz=ab'z
" Vim auto tabularize with pipes
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" Preventing entering Ex mode
nnoremap Q :bd %<CR>
" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" allows incsearch highlighting for range commands - VERY POWERFUL
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
vmap K :m'<-2<cr>`>my`<mzgv`yo`z
vmap J :m'>+<cr>`<my`>mzgv`yo`z
" Splits
nnoremap <silent> sv :vsplit<CR>
nnoremap <silent> sh :split<CR>
" C-k
inoremap <C-k> <Esc>ld$a
" }}}

" Leader shortcuts {{{
" Switch the Leader Key
" let mapleader=","
let mapleader="\<Space>"
let maplocalleader=","

" Remap the ex command
nnoremap <Leader><Leader> V
nnoremap <silent><Leader>q :q<CR>
vmap <Leader><Leader> :
" Escapes visual mode
vmap <C-g> <ESC>
" Disable highlight when <leader><cr> is pressed
map <silent> <Leader><CR> :noh<CR>
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
nnoremap <Leader><CR> :nohlsearch<CR>
" Save a file
nnoremap <Leader>w :w<CR>
" Paste
nnoremap <silent> <leader>p :set paste!<CR>
" Copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>y "+yy
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" Splits
nnoremap <silent> <Leader>k :vsplit<CR>
nnoremap <silent> <Leader>j :split<CR>
" Edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>ez :edit ~/.zshrc<CR>
nnoremap <leader>et :edit ~/.tmux.conf<CR>
" Close all buffers but the current one
nmap <Leader>x :only<CR>
" Close the current buffer and back to the last edited
nmap <leader>d :call BufferDelete()<CR>
" Scroll Off
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
" NERDTreeTabsToggle
map <Leader>t <plug>NERDTreeTabsToggle<CR>
" Spell checking
nnoremap <silent> <leader>s :set spell!<CR>
" Numbers
nnoremap <silent> <leader>n :set number!<CR>
" RainbowParenthesesToggle
nnoremap <Leader>( :RainbowParenthesesToggle<CR>
" Color the colorcolumn
nnoremap <Leader>cc :call ColorColumn()<CR>
" BufOnly
nnoremap <Leader>bb :ls<CR>:buffer<Space>
" Fugitive maping
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Gpush<CR>
" Key bindings for adjusting the tab/shift width.
nnoremap <leader>w2 :setlocal tabstop=2<CR>:setlocal shiftwidth=2<CR>
nnoremap <leader>w4 :setlocal tabstop=4<CR>:setlocal shiftwidth=4<CR>
nnoremap <leader>w8 :setlocal tabstop=8<CR>:setlocal shiftwidth=8<CR>
" Shows file name
nnoremap <Leader>g :echo expand('%:p')<CR>
" }}}

" Terminal {{{
tnoremap <Esc> <C-\><C-n>
" }}}

" Buffers {{{
" Jumps to the desired buffer
" nnoremap <Leader>j :<C-U>exe "buffer ".v:count<CR>
" Switch to alternate file
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>
" }}}

" Highlightings {{{
" Highlights trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" Change Highlights colors
highlight SignColumn ctermbg=16
" highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
highlight Search ctermfg=None ctermbg=Black cterm=bold
" }}}

" Autocmd {{{
" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

augroup rainbows
    " Rainbow Parentheses
    " autocmd BufRead,BufNewFile * RainbowParenthesesToggle
    " autocmd VimEnter * RainbowParenthesesToggle
    " autocmd Syntax * RainbowParenthesesLoadRound
    " autocmd Syntax * RainbowParenthesesLoadSquare
    " autocmd Syntax * RainbowParenthesesLoadBraces
augroup END

" Haskell
augroup HSK
    " au Bufenter *.hs compiler ghc
    autocmd FileType haskell let b:ghc_staticoptions = '-Wall -Werror'
    " Use tc instead
    " autocmd BufWritePost *.hs :GhcModCheckAndLintAsync
    autocmd FileType haskell call HaskellSettings()
augroup END

augroup NeomakeHaskell
  " autocmd BufRead,BufWritePost,BufEnter *.hs silent! Neomake
  " TODO: Fix when opening different file types (it breaks)
  autocmd BufWritePost *.hs silent! Neomake
augroup END

" ELM
augroup ELM

  " Provides my own keybindings
  let g:elm_setup_keybindings = 0

  " Keybindings
  autocmd FileType elm nmap <LocalLeader>b <Plug>(elm-make)
  autocmd FileType elm nmap <LocalLeader>m <Plug>(elm-make-main)
  autocmd FileType elm nmap <LocalLeader>t <Plug>(elm-test)
  autocmd FileType elm nmap <LocalLeader>r <Plug>(elm-repl)
  autocmd FileType elm nmap <LocalLeader>e <Plug>(elm-error-detail)
  autocmd FileType elm nmap <LocalLeader>d <Plug>(elm-show-docs)
  autocmd FileType elm nmap <LocalLeader>w <Plug>(elm-browse-docs)

  autocmd BufNewFile,BufRead,BufReadPost elm call ElmSettings()

  " Requires elm-format
  let g:elm_format_autosave = 1

  " Syntastic
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1

  let g:elm_syntastic_show_warnings = 1
  " YouCompleteMe
augroup END
" Lisp
augroup LISP
    " setfiletype scheme
    " set syntax=scheme

    " au filetype lisp,scheme,art call SexpSettings()
    autocmd BufNewFile,BufRead,BufReadPost *.scm call SexpSettings()
augroup END

augroup JS
    autocmd BufNewFile,BufRead,BufReadPost *.js call JavaScriptSettings()
    autocmd BufNewFile,BufRead,BufReadPost *.js call TslimeSettings()
augroup END

augroup ML
    autocmd BufNewFile,BufRead,BufReadPost *.ml call TslimeSettings()
augroup END

augroup RUBY
    autocmd BufNewFile,BufRead,BufReadPost *.rb call TslimeSettings()
augroup END

augroup PYTHON
    autocmd BufNewFile,BufRead,BufReadPost *.py call TslimeSettings()
    autocmd BufNewFile,BufRead,BufReadPost *.py call PythonSettings()
augroup END

augroup GOYO
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" Clojure
augroup CLJ
    " Avoid defining them twice
    autocmd BufNewFile,BufRead,BufReadPost *.clj call ClojureSettings()
    autocmd BufNewFile,BufRead,BufReadPost *.clj call SexpSettings()
augroup END

augroup CLJS
  " autocmd BufNewFile,BufRead,BufReadPost *.cljs call TslimeSettings()
  autocmd BufNewFile,BufRead,BufReadPost *.cljs call SexpSettings()
  command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))
augroup END

augroup configgroup
    " No bell
    autocmd GUIEnter * set visualbell t_vb=
    " Unite Settings
    autocmd! VimEnter * call UniteSettings()
    " Save on Focus Lost
    " autocmd FocusLost * silent! wa
    " Conoline
    " autocmd FocusLost * ConoLineDisable
    " autocmd FocusGained * ConoLineEnable
    " autocmd BufWinLeave * ConoLineDisable
    " autocmd BufWinEnter * ConoLineEnable
    " Whitespace cleaning
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
    " TrimWhiteSpaces when saving
    autocmd BufWritePre * :call TrimWhiteSpace()
    " Fugitive
    " autocmd QuickFixCmdPost *grep* cwindow " all the files are open in a quickfix buffer
augroup END
" }}}

augroup QUICKFIX_WINDOW
  " In the quickfix window, <CR> is used to jump to the error under the
  " cursor, so undefine the mapping there.
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" Vim notes {{{
let g:notes_directories = ['~/Documents/Notes']
" }}}

" Vim expand region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-V> <Plug>(expand_region_shrink)
" }}}

" Vim task {{{
" noremap <Leader>m :call Toggle_task_status()<CR>
" }}}

" Fugitive {{{
" nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Gpush<CR>
" }}}

" Tig Integration {{{
function! s:tig_status()
  cd `driller --scm-root %`
  !tig status
endfunction
command! TigStatus call s:tig_status()
nnoremap <Leader>gs :silent TigStatus<CR>
" }}}

" vim-airline {{{
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_min_count = 2
" }}}

" vim multicursor {{{
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_quit_key='<C-d>'
" }}}

" Tagbar {{{
nnoremap <silent> <Leader>b :TagbarToggle<CR>
" }}}

" YouCompleteMe {{{
    let g:ycm_semantic_triggers = {'clojure' : ['/'], 'haskell': ['.'], 'elm': ['.']}
" }}}

" Clojure {{{
function! ClojureSettings()
    setfiletype clojure
    set syntax=clojure
    " Highlight references
    let g:clojure_highlight_references=1
    let g:vimclojure#HighlightBuiltins=1
    let g:vimclojure#ParenRainbow=1
    let g:clojure_fuzzy_indent = 1
    let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^fact', '^facts', '^tabular', 'if', 'when', '^test-extractor', 'against-background']
    let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']
    " Mapping
    nnoremap cq :Require<CR>
    nnoremap cr :Require<CR>
    nnoremap ce :Eval<CR>
    nnoremap cc :%Eval<CR>
    nnoremap cl :Last<CR>
    nnoremap cf :setf clojure<CR>
    let g:clj_fmt_autosave = 1
    call RedlSettings()
endfunction

function! RedlSettings()
    nnoremap <silent><buffer> rr :ReplHere<CR>
    imap <silent> K <Plug>clj_repl_uphist.
    imap <silent> J <Plug>clj_repl_downhist.
    imap <silent> <C-d> <ESC>:bd<CR>
    imap <silent> <C-w> <ESC>:echo 'stuff'<CR>
endfunction

function! SexpSettings()
    " Disable insertion after wrapping
    let g:sexp_insert_after_wrap = 0
    " mapping
    " nmap <silent><buffer> w <Plug>(sexp_round_tail_wrap_element)
    " Slurpage & Burfage
    nmap <silent><buffer> << <Plug>(sexp_capture_prev_element)
    nmap <silent><buffer> >> <Plug>(sexp_capture_next_element)
endfunction

function! JavaScriptSettings()
  " Two space indentation
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  au BufWinEnter,BufNewFile * silent tab

    " mapping
    imap <C-j> <CR><Esc>O
    imap <C-l> <C-o>A

    " Map the conceal characters to their expanded forms.
    " inoremap <silent> @ <C-r>=syntax_expand#expand("@", "this")<CR>
    " inoremap <silent> # <C-r>=syntax_expand#expand("#", "prototype")<CR>
    " inoremap <silent> < <C-r>=syntax_expand#expand_head("<", "return")<CR>

    " Keeps everything concealed at all times. Even when my cursor is on the word.
    set conceallevel=1
    set concealcursor=nvic

endfunction
" }}}

" Javascript vim-javascript

" JavaScript thanks to pangloss/vim-javascript
let g:javascript_conceal_function       = "λ"
" let g:javascript_conceal_null           = "ø"
" let g:javascript_conceal_this           = "@"
" let g:javascript_conceal_return         = "⇚"
" let g:javascript_conceal_undefined      = "¿"
" let g:javascript_conceal_NaN            = "ℕ"
" let g:javascript_conceal_prototype      = "¶"
" let g:javascript_conceal_static         = "•"
" let g:javascript_conceal_super          = "Ω"
" let g:javascript_conceal_arrow_function = "⇒"
" }}}

" javascript-lib-syntax {{{
let g:used_javascript_libs = 'react,flux,jquery,chai'
" }}}


" Python-Mode {{{
" TODO: Refactor in a function
" Turn on pymode
let g:pymode=1
" Enable default options
" text-width, commentstring, ...
let g:pymode_options=0
" Python version (python 2 -> vim needs to be compiled with the
" appropriate flags
let g:pymode_python='python'
" Motion
" M: Method
" C: Class
let g:pymode_motion=1
" Documentation
let g:pymode_doc=1
let g:pymode_doc_key='K'
" Run code
let g:pymode_run=1
let g:pymode_run_bind='cr'
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_message = 1
" Syntax
let g:pymode_syntax_all = 1
" Disable breakpoints plugin
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<LocalLeader>b'
" Don't autofold code
let g:pymode_folding = 0
" }}}

" Python {{{
function! PythonSettings()
    let g:ycm_autoclose_preview_window_after_completion=1
    map <C-f> :YcmCompleter GoToReferences<CR>
endfunction
" }}}
"
function! GhcModQuickFix()
  :Unite -no-empty -no-start-insert -no-quit quickfix
  " :CtrlPQuickfix
endfunction

" Haskell {{{
function! HaskellSettings()
  " Neomake
  let g:neomake_open_list=2  " Conserves the cursor position + open the quickfix
  let g:neomake_highlight_lines=0
  let g:neomake_haskell_enabled_makers = ['hlint', 'ghcmod']

  " YouCompleteMe and NecoGHC
  " Disable haskell-vim omnifunc
  let g:haskellmode_completion_ghc = 0
  set omnifunc=necoghc#omnifunc
  let g:ycm_min_num_of_chars_for_completion = 0
  let g:ycm_auto_trigger = 1
  let g:necoghc_enable_detailed_browse = 1

  " Hoogle
  " Hoogle the word under the cursor
  nnoremap <silent> K :Hoogle<CR>
  nnoremap <silent> <LocalLeader>hh :Hoogle<CR>
  " Hoogle, close the Hoogle window
  nnoremap <silent> <LocalLeader>hz :HoogleClose<CR>
  " Hoogle for detailed documentation and prompt for input
  nnoremap <silent> <LocalLeader>hi :HoogleInfo <Space>
  " Imports
  nnoremap <silent> <LocalLeader>i :Unite haskellimport<CR>

  " TODO: how to make it work with stack?
  " GHC Mod
  let g:ghcmod_open_quickfix_function = 'GhcModQuickFix'
  " Resource: http://www.stephendiehl.com/posts/vim_2016.html
  " Type of expression under cursor
  nnoremap <silent> <LocalLeader>tt :w<CR> :GhcModType<CR>
  " Insert type of expression under cursor
  nnoremap <silent> <LocalLeader>tw :w<CR> :GhcModTypeInsert<CR>
  nnoremap <silent> <LocalLeader>ts :w<CR> :GhcModSplitFunCase<CR>
  nnoremap <silent> <LocalLeader>tq :w<CR> :GhcModType<CR>
  nnoremap <silent> <LocalLeader>te :w<CR> :GhcModTypeClear<CR>
  nnoremap <silent> <LocalLeader>tc :w<CR> :GhcModCheckAndLintAsync<CR>

  " TODO: improve
  " Customize colors
  " highlight ghcmodType ctermfg=15 ctermbg=23
  let g:ghcmod_type_highlight = 'ghcmodType'
  highlight ghcmodType ctermfg=15 ctermbg=24
  " highlight ghcmodType guibg=Green guifg=White ctermbg=green ctermfg=black cterm=None

  " Pretty unicode haskell symbols
  " let g:haskell_conceal_wide = 1
  " let g:haskell_conceal_enumerations = 1
  " let hscoptions="𝐒𝐓𝐄𝐌xRtB𝔻w"
  call WSHighlight()

endfunction


" haskell-vim: Syntax highlighting (https://github.com/neovimhaskell/haskell-vim) {{{
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

let g:haskell_indent_if = 0
let g:haskell_indent_in = 0
" }}}


function! WSHighlight()
    syn match BadWhiteSpace "^\\s*\\t\\+"
    syn match BadWhiteSpace "\\s\\+$"
endfunction
" }}}

function! ElmSettings()
    " let g:elm_jump_to_error = 1
    " let g:elm_make_output_file = "elm.js"
    " let g:elm_make_show_warnings = 0
    " let g:elm_browser_command = ""
    " let g:elm_detailed_complete = 1

    let g:elm_jump_to_error = 0
    let g:elm_make_output_file = "elm.js"
    let g:elm_make_show_warnings = 0
    let g:elm_syntastic_show_warnings = 0
    let g:elm_browser_command = ""
    let g:elm_detailed_complete = 0
    let g:elm_format_autosave = 0
    let g:elm_setup_keybindings = 0
    let g:elm_classic_hightlighting = 0
endfunction

" Tags {{{
set tags=tags;/,codex.tags;/
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
" }}}

" vim easy align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Tmux {{{
" Navigate between tmux and vim with ease
let g:tmux_navigator_no_mappings = 1
" maping
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
" }}}

" vim-signature {{{
let g:SignatureMarkTextHL=1
let g:SignatureMarkerTextHL=1
" }}}

" The silver searcher {{{
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}

" Unite {{{
function! UniteSettings()

  " Settings
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#custom_source('quickfix', 'sorters', 'sorter_reverse')
  call unite#custom#source(
        \ 'neomru/file', 'matchers',
        \ ['matcher_project_files', 'matcher_fuzzy'])

  " start-insert starts in INSERT mode when Unite is triggered
  " prompt defines the prompt text
  " winheight is the height of the Unite items
  " direction is the location of the unite buffer
  call unite#custom#profile('default', 'context', {
        \   'start_insert': 1,
        \   'prompt': ">> ",
        \   'winheight': 10,
        \   'direction': 'botright',
        \ })
  " Use ag for search
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
  endif

  " Closes/Reopens Last Unit Buffer
  nnoremap <silent> <C-g> :UniteClose<CR>
  nnoremap <silent> <C-x> :UniteResume -no-start-insert<CR>

  " Uses too much CPU (Fixed in the next vim version -> Patch it)
  " nnoremap <silent> <C-p> :Unite file_mru file_rec/async<CR>
  " nnoremap <silent> <C-p> :Unite -buffer-name=files file_mru file_rec/git<CR>
  " nnoremap <silent> <C-p> :Unite -buffer-name=files file_mru file_rec/neovim<CR>
  " Use Ctrl-P for now
  nnoremap <silent> <M-m> :Unite -buffer-name=buffers buffer<CR>
  nnoremap <silent> <C-b> :Unite -buffer-name=buffers buffer<CR>
  nnoremap <silent> <leader>m :<C-u>Unite mark -buffer-name=marks -no-start-insert<cr>
  nnoremap <silent> <C-m> :<C-u>Unite mark -buffer-name=marks -no-start-insert<cr>
  let g:unite_source_history_yank_enable = 1
  nnoremap <silent> <C-y> :<C-u>Unite history/yank<CR>
  " nnoremap <C-f><Space> :<C-u>Unite -no-quit -buffer-name=search grep:. -no-start-insert<cr>
  " nnoremap <C-f><C-f> :<C-u>Unite -no-quit -buffer-name=search grep:. -no-start-insert<cr><C-r><c-w><CR>
  nnoremap <C-q> :<C-u>Unite -no-quit -buffer-name=search grep:. -no-start-insert<cr><C-r><c-w><CR>
  " nnoremap <C-f><C-b> :execute 'Unite grep:$buffers::' . expand("<cword>") . '  -start-insert'<cr>

  " nnoremap <C-b> :<C-u>Unite -buffer-name=mru file_mru -start-insert<CR>

  " Search / search
  nnoremap <M-/> :Unite anzu -no-start-insert<CR>
  nnoremap <C-/> :Unite anzu -no-start-insert<CR>

  " Help
  nnoremap <silent> <M-h> :Unite help<CR>

  " Search lines
  nnoremap <silent> <leader>[ :Unite -buffer-name=search line:all -start-insert<CR>
  nnoremap <silent> <M-[> :Unite -buffer-name=search line:all -start-insert<CR>
  " nnoremap <silent> <C-[> :Unite -buffer-name=search line:forward -start-insert<CR>
  " nnoremap <silent> <leader>[ :Unite -buffer-name=search line:forward -start-insert<CR>
  " nnoremap <silent> <M-[> :Unite -buffer-name=search line:forward -start-insert<CR>
  " nnoremap <silent> <leader>] :Unite -buffer-name=search line:forward -start-insert<CR>

  autocmd FileType unite call s:unite_my_settings()

  " FIXME
  nnoremap <ESC> <Nop>
  unmap <CR>
  " nnoremap <CR> G
endfunction

function! s:unite_my_settings()
    nmap <buffer> <C-j>                   <Plug>(unite_toggle_auto_preview)
    imap <silent><buffer><expr> <C-h>     unite#do_action('split')
endfunction
" }}}

" CtrlP {{{
let g:ctrlp_map = '<c-]>'
" nnoremap <C-b> :CtrlPMRU<CR>
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_lazy_update = 100 "Only refreshes the results every 100ms so if you type fast searches don't pile up
" let g:ctrlp_user_command = 'find %s -type f | ag -iv "(\.(eot|gif|gz|ico|jpg|jpeg|otf|png|psd|pyc|svg|ttf|woff|zip)$)|(/\.)|((^|\/)tmp\/)"' "Quicker indexing
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" Syntastic Linter {{{
scriptencoding utf-8
" Always add any detected errors into the location list
let g:syntastic_always_populate_loc_list = 1

" Don't auto-open it when errors/warnings are detected, but auto-close when no
" more errors/warnings are detected.
let g:syntastic_auto_loc_list = 2

" Highlight syntax errors where possible
let g:syntastic_enable_highlighting = 1

" Show this many errors/warnings at a time in the location list
let g:syntastic_loc_list_height = 5

" Don't run checkers when saving and quitting--only on saving
let g:syntastic_check_on_wq = 0

" TODO: setup better characters
let g:syntastic_error_symbol         = '✗' " There are better characters, but Hackpad won't show them
let g:syntastic_warning_symbol       = '▲'
let g:syntastic_style_error_symbol   = '✗'
let g:syntastic_style_warning_symbol = '▲'

let g:syntastic_javascript_checkers    = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
let g:syntastic_json_checkers          = ['jsonlint']
let g:syntastic_ruby_checkers          = ['rubocop']
let g:syntastic_scss_checkers          = ['scss_lint']
let g:syntastic_vim_checkers           = ['vint']

" }}}

" vim hardTime {{{
" let g:hardtime_showmsg = 1
" let g:hardtime_ignore_buffer_patterns = [ "NERD.*", ".*Tagbar.*"]
" let g:hardtime_ignore_quickfix = 1
" let g:hardtime_default_on = 1
" hi link SneakPluginTarget IncSearch
" hi link SneakPluginScope IncSearch
" }}}

" Vim jsz {{{
 let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" }}}

" Vim Sneak {{{
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S
" }}}

" IndentLine {{{
" highlight Conceal ctermfg=248
let g:indentLine_color_term = 246
" let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
" let g:indentLine_char = '│'
let g:indentLine_char = '┆'
" }}}

" FZF {{{
" Resource: https://github.com/junegunn/fzf.vim
set rtp+=~/.fzf
let g:fzf_command_prefix = 'FZF'

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Only in neovim
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

nnoremap <C-f> :FZFAg<CR>
nnoremap <C-p> :FZF<CR>

" Narrow ag results within vim

" CTRL-X, CTRL-V, CTRL-T to open in a new split, vertical split, tab respectively.
" CTRL-A to select all matches and list them in quickfix window
" CTRL-D to deselect all
" Ag without argument will list all the lines

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
        \ 'ctrl-v': 'vertical split',
        \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
      \ 'source':  printf('ag --nogroup --column --color "%s"',
      \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
      \ 'sink*':    function('<sid>ag_handler'),
      \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
      \            '--multi --bind=alt-a:select-all,alt-d:deselect-all '.
      \            '--color hl:68,hl+:110',
      \ 'down':    '50%'
      \ })

" FZF MRU: https://github.com/tweekmonster/fzf-filemru
" Seems broken and does not output MRUs...
" nnoremap <C-b> :FilesMru --tiebreak=end<CR>
" }}}

" tslime {{{
function! TslimeSettings()
  let g:tslime_always_current_session = 1
  let g:tslime_always_current_window = 1
  let g:tslime_ensure_trailing_newlines = 1

  vmap <silent> ce <Plug>SendSelectionToTmux
  nmap <silent> ce <Plug>NormalModeSendToTmux
  " nmap <silent> sr <Plug>SetTmuxVars
  nmap <silent> cc <Plug>NormalModeSendAllToTmux
  " let g:tslime_normal_mapping = rs
  " let g:tslime_visual_mapping = rs
  " let g:tslime_vars_mapping = rv
  " let g:tslime_normal_mapping = '<localleader>s'
  " let g:tslime_visual_mapping = '<localleader>s'
  " let g:tslime_vars_mapping = '<localleader>v'

endfunction
" }}}

" Ag vim {{{
" let g:ag_highlight=1
" let g:ag_mapping_message=0 " Does not show the mappings when the search is done
" Ag remap
" nnoremap <C-f> :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
" nnoremap <Leader>aa :call MyAgSearch()<CR>
" nnoremap <silent> <Leader>al :cl<CR>
" nnoremap <silent> <Leader>ac :ccl<CR>
" nnoremap <silent> <Leader>an :cn<CR>
" nnoremap <silent> <Leader>ap :cp<CR>
" }}}


" Custom functions {{{
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
" Remove trailing whitespace
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
" Color the colorcolumn
function! ColorColumn()
    if empty(&colorcolumn)
        if empty(&textwidth)
            echo "colorcolumn=80"
            setlocal colorcolumn=80
        else
            echo "colorcolumn=+1 (" . (&textwidth + 1) . ")"
            setlocal colorcolumn=+1
        endif
    else
        echo "colorcolumn="
        setlocal colorcolumn=
    endif
endfunction
function! BufferDelete()
    if &modified
        echohl ErrorMsg
        echomsg "No write since last change. Not closing buffer."
        echohl NONE
    else
        let s:total_nr_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

        if s:total_nr_buffers == 1
            bdelete
            echo "Buffer deleted. Created new buffer."
        else
            bprevious
            bdelete #
            echo "Buffer deleted."
        endif
    endif
endfunction
function! MyAgSearch()
    let l:defaultFileType = expand("%:e")

    call inputsave()
    let l:pattern = input('>> ')
    call inputrestore()

    " execute "Ag" l:pattern
    call inputsave()
    let l:fileType=input('File Type [default=' . l:defaultFileType .'] >>> ')
    call inputrestore()
    if empty(l:fileType)
        execute "Ag" l:pattern "**/*." . l:defaultFileType
    else
        execute "Ag" l:pattern "**/*." . l:fileType
    endif
endfunction
" }}}

" Easy Align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" JSON Formater {{{
function! FormatJSON()
  :%!python -m json.tool
endfunction
" }}}

" Colorschemes {{{
" colorscheme Tomorrow-Night-Eighties " Awesome colorscheme
" colorscheme Tomorrow-Night-Eighties " Awesome colorscheme
" colorscheme badwolf " Awesome colorscheme
" colorscheme hybrid_material " Awesome colorscheme
" Make the tab line much lighter than the background.
" let g:badwolf_tabline=3
" colorscheme wombat        " Awesome colorscheme
" FIXME: Put back in UniteSettings
" --------------------------------
" nnoremap <silent> <C-m> :Unite mark -buffer-name=marks -no-start-insert<cr>
" For some reason Unite binds esc to Unite line
" nnoremap <ESC> <Nop>
" unmap <CR>
" nnoremap <CR> G
" nnoremap <silent> <C-m> :<C-u>Unite mark -buffer-name=marks -no-start-insert<cr>
" --------------------------------
"
" colorscheme badwolf        " Awesome colorscheme
" colorscheme wombat256i        " Awesome colorscheme
" }}}

" Rainbow parentheses {{{
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
" -- Rainbow parenthesis options
let g:rbpt_colorpairs = [
	\ ['darkyellow',  'RoyalBlue3'],
	\ ['darkgreen',   'SeaGreen3'],
	\ ['darkcyan',    'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['DarkMagenta', 'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['DarkMagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkred',     'firebrick3'],
	\ ]
" }}}

" Todo: move to appropriate location
highlight Search ctermfg=white ctermbg=red

" Cursor tuning {{{
" hi CursorLine ctermbg=23 ctermfg=15
" hi CursorColumn ctermbg=23
hi Cursor ctermbg=15
" For dark colorschemes
" Conoline {{{
let g:conoline_auto_enable = 1
let g:conoline_color_normal_dark = 'ctermbg=23'
let g:conoline_color_normal_nr_dark = 'ctermbg=23'
let g:conoline_color_insert_dark = 'ctermbg=black'
let g:conoline_color_insert_nr_dark = 'ctermbg=black'
let g:conoline_color_normal_light = 'ctermbg=23'
let g:conoline_color_normal_nr_light = 'ctermbg=23'
let g:conoline_color_insert_light = 'ctermbg=black'
let g:conoline_color_insert_nr_light = 'ctermbg=black'
" }}}

syntax enable

" Autocomplete color
" highlight Pmenu ctermfg=DarkRed ctermbg=Black
highlight Pmenu ctermfg=15 ctermbg=23
highlight PmenuSel ctermfg=Blue ctermbg=Grey
highlight Visual ctermfg=18 ctermbg=110 gui=none
