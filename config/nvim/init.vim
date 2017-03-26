let mapleader="\<Space>"
let maplocalleader=","

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
" continuously updated session files (to be used with tmux resurect)
Plug 'tpope/vim-obsession'
" The fancy start screen for Vim
Plug 'mhinz/vim-startify'

" vim-easy-align {{{
" align with ease
Plug 'junegunn/vim-easy-align'

vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" FZF {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'

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

" Customize fzf colors to match the color scheme
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

" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'down': '~40%' }

" FZF functions {{{
" Only in neovim
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

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

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})

command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction
" }}}
" }}}

" Requirements: bash, gawk, fzf
" Asynchronous
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"Improved incremental searching
Plug 'haya14busa/incsearch.vim'
" provides improved * motions
Plug 'haya14busa/vim-asterisk'

" Some utility functions for vim
Plug 'tomtom/tlib_vim'
" Interpret a file by function and cache file automatically
Plug 'MarcWeber/vim-addon-mw-utils'
" visually select increasingly larger regions of text using the same key
" combination

" vim-expand-region {{{
Plug 'terryma/vim-expand-region'

vmap v <Plug>(expand_region_expand)
vmap <C-V> <Plug>(expand_region_shrink)
" }}}

" Rainbow Parentheses {{{
Plug 'kien/rainbow_parentheses.vim'
" }}}

" IndentLine {{{
Plug 'Yggdroot/indentLine'

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
" let g:indentLine_char = '│'
let g:indentLine_char = '┆'
" }}}

" Conoline: Cursor Color {{{
Plug 'miyakogi/conoline.vim'

" let g:conoline_auto_enable = 1
" let g:conoline_color_normal_dark = 'ctermbg=23'
" let g:conoline_color_normal_nr_dark = 'ctermbg=23'
" let g:conoline_color_insert_dark = 'ctermbg=black'
" let g:conoline_color_insert_nr_dark = 'ctermbg=black'
" let g:conoline_color_normal_light = 'ctermbg=23'
" let g:conoline_color_normal_nr_light = 'ctermbg=23'
" let g:conoline_color_insert_light = 'ctermbg=black'
" let g:conoline_color_insert_nr_light = 'ctermbg=black'
" }}}

" Displays documentation when auto completing
" Plug 'Shougo/echodoc.vim'

" vim over: :substitute preview
Plug 'osyo-manga/vim-over'

" tslime {{{
Plug 'chouffe/tslime.vim'

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tslime_ensure_trailing_newlines = 1

" let g:tslime_normal_mapping = rs
" let g:tslime_visual_mapping = rs
" let g:tslime_vars_mapping = rv
" let g:tslime_normal_mapping = '<localleader>s'
" let g:tslime_visual_mapping = '<localleader>s'
" let g:tslime_vars_mapping = '<localleader>v'
" }}}

" Marks {{{
Plug 'kshenoy/vim-signature'

let g:SignatureMarkTextHL=1
let g:SignatureMarkerTextHL=1
" }}}

" Graph your Vim undo tree in style.
Plug 'sjl/gundo.vim'

" Vimfiler {{{
Plug 'Shougo/vimfiler.vim'

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 1
" }}}


" Goyo: Distraction free writing in vim {{{
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" }}}

" Neomake {{{
Plug 'neomake/neomake'

let g:neomake_open_list = 2        " Conserves the cursor position + open the quickfix
let g:neomake_highlight_lines = 0
let g:neomake_haskell_enabled_makers = ['ghcmod']
let g:neomake_javascript_enabled_makers = ['eslint']
" }}}

" Snippets {{{
" Snipmate {{{
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" }}}
" Neosnippet {{{
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

let g:neosnippet#enable_snipmate_compatibility = 1 " Enable snipMate compatibility feature
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)
imap <C-s>  <Plug>(neosnippet_start_unite_snippet)
" }}}
" }}}

" Neoformat {{{
Plug 'sbdchd/neoformat'

nnoremap <Leader>f :Neoformat<CR>
" }}}

" Deoplete {{{
" Dark powered asynchronous completion framework for neovim
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'wellle/tmux-complete.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for' : ['javascript'] }
Plug 'clojure-vim/async-clj-omni', { 'for' : ['clojure'] }
Plug 'fishbullet/deoplete-ruby', { 'for' : ['ruby'] }
Plug 'Shougo/deoplete-rct', { 'for' : ['ruby'] }
Plug 'zchee/deoplete-jedi', { 'for' : ['python'] }
" intellij completion: https://github.com/vhakulinen/neovim-intellij-complete

" Make sure the autocompletion will actually trigger using the omnifuncs
" https://www.gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

if !exists('g:deoplete#sources')
  let g:deoplete#sources = {}
endif

" Automatically closing the scratch window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Deoplete tab-complete
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.scala='[^. *\t]\.\w*'
let g:deoplete#keyword_patterns.clojure='[\w!$%&*+/:<=>?@\^_~\-\.#]*'
" let g:deoplete#sources._ = ['buffer', 'tag']

" Tern {{{
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  " tern
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
endif

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]
" }}}

" Deoplete Python {{{
" Make sure echo has('python') and echo has('ruby') both return 1 for deoplete
" to work
" let g:python3_host_prog = '/Users/arthur_caillau/.virtualenvs/neovim3/bin/python'
" let g:python3_host_prog = '/Users/arthur_caillau/.pyenv/shims/python'
" let g:python3_host_prog = '/usr/local/bin/python3.6'
" }}}
" }}}

" Unite {{{
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
" narrowing lines from current buffer
Plug 't9md/vim-unite-lines'
" MRU plugin includes unite.vim MRU sources
Plug 'Shougo/neomru.vim'
Plug 'tacroe/unite-mark'
Plug 'ujihisa/unite-colorscheme'
Plug 'tsukkee/unite-tag'
Plug 'osyo-manga/unite-quickfix'
Plug 'Shougo/unite-help'

let g:unite_source_history_yank_enable = 1
" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  " let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_default_opts =
        \ '-i --line-numbers --nocolor --column ' .
        \ '--nogroup --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore' .
        \ ' ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  " Use pt (the platinum searcher)
  " https://github.com/monochromegane/the_platinum_searcher
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif

" Closes/Reopens Last Unit Buffer
nnoremap <silent> <C-g> :UniteClose<CR>
nnoremap <silent> <C-x> :UniteResume -no-start-insert<CR>

function! s:unite_my_settings()
    nmap <buffer> <C-j>                   <Plug>(unite_toggle_auto_preview)
    imap <silent><buffer><expr> <C-h>     unite#do_action('split')
endfunction

" }}}

" Anzu {{{
Plug 'osyo-manga/vim-anzu'
" Use / to search and then :Unite anzu to have a Unite buffer

nmap n <Plug>(anzu-n-with-echo)
" nmap n <Plug>(anzu-mode-n)
nmap N <Plug>(anzu-N-with-echo)
" nmap N <Plug>(anzu-mode-N)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/vim-gita'

nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Gpush<CR>
" }}}

" lean & mean status/tabline for vim that's light as air
" vim-airline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme="distinguished"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_min_count= 2
" }}}

" Tmux {{{
Plug 'tmux-plugins/vim-tmux'
" TmuxNavigator {{{
Plug 'christoomey/vim-tmux-navigator'

" Navigate between tmux and vim with ease
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
" }}}

" TmuxLine {{{
Plug 'edkolev/tmuxline.vim'

let g:tmuxline_powerline_separators = 1
let g:tmuxline_theme = 'iceberg'
let g:tmuxline_preset = 'nightly_fox'
" }}}
" Plug 'itchyny/lightline.vim'
" vim plugin for tmux.conf

" }}}

" Objects and Motions {{{

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
" }}}

" Colorschemes {{{
" Plug 'Plug morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'sjl/badwolf'
Plug 'mkarmona/colorsbox'
Plug 'Donearm/Ubaryd'
Plug 'joshdick/onedark.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'Wutzara/vim-materialtheme'

" let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_dark="medium"
" }}}

Plug 'majutsushi/tagbar', { 'for': ['haskell'] }
" Tags {{{
Plug 'szw/vim-tags'  " Ctags generator for Vim

set tags=tags;/,codex.tags;/
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
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

nnoremap <silent> <Leader>b :TagbarToggle<CR>
" }}}

" -------------------------
" Language specific plugins
" -------------------------

" Python {{{
" Plug 'julienr/vimux-pyutils', {'for': 'python' }
" Plug 'benmills/vimux'
Plug 'klen/python-mode', { 'for': 'python' }

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

" Scala {{{
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
" }}}

" Ruby {{{
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Browse ri documentation from vim
Plug 'danchoi/ri.vim', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
" }}}

" Elm {{{
Plug 'ElmCast/elm-vim', { 'for': 'elm' }

let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1  " Requires elm-format
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 0
let g:elm_classic_hightlighting = 0
" }}}

" Racket {{{
Plug 'wlangstroth/vim-racket', { 'for' : 'racket' }
" }}}

" Clojure {{{
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
" Plug 'dgrnbrg/vim-redl', { 'for': 'clojure' }
" Plug 'dgrnbrg/redl', { 'for': 'clojure' }
" static support for Leiningen and Boot
Plug 'tpope/vim-salve', { 'for': 'clojure' }
" the Clojure formatting tool.
" Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
" Plug 'venantius/vim-eastwood', { 'for': 'clojure' }

let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#ParenRainbow=1

let g:clojure_highlight_references=1
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^fact', '^facts', '^tabular', 'if', 'when', '^test-extractor', 'against-background']
let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']

let g:clj_fmt_autosave = 1

let g:sexp_insert_after_wrap = 0 " Disable insertion after wrapping
" }}}

" Haskell {{{
" Syntax highlighting: vim2hs/haksyn/haskell_syntax
" Plug 'dag/vim2hs', { 'for': 'haskell' }
" Plug 'travitch/hasksyn', { 'for' : 'haskell' }
" Plug 'urso/haskell_syntax.vim', { 'for' : 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Plug 'mkasa/neco-ghc-lushtags', { 'for' : 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Vim plugin for Haskell development
" Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
" Vim plugin used to query hoogle, the haskell search engine
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Extended Haskell Conceal feature for Vim
" Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
" Create ctags compatible tags files for Haskell programs
" Plug 'bitc/lushtags', { 'for': 'haskell' }
" Code reformatting
" Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }
Plug 'MarcWeber/hasktags', { 'for': 'haskell' }
Plug 'ujihisa/unite-haskellimport', { 'for': 'haskell' }

" haskell-vim: Syntax highlighting (https://github.com/neovimhaskell/haskell-vim)
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_indent_if = 0
let g:haskell_indent_in = 0

" Ghcmod
let g:ghcmod_open_quickfix_function = 'GhcModQuickFix'
let g:ghcmod_type_highlight = 'ghcmodType'

" }}}

" Idris {{{
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
" }}}

" Html/Xml {{{
Plug 'tpope/vim-ragtag', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': 'html' }
" }}}

" JavaScript {{{
" Plug 'othree/jspc.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'flowtype/vim-flow', { 'for': ['javascript', 'jsx'] }
Plug 'flowtype/vim-flow'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for':  ['html', 'javascript']}
Plug 'othree/javascript-libraries-syntax.vim', { 'for' : 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for':  'javascript', 'do': 'npm install'}
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:used_javascript_libs = 'react,flux,jquery,chai'
" }}}

" provides insert mode auto-completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate', { 'for': ['haskell', 'html', 'javascript', 'python', 'ruby'] }

" CSS {{{
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'sass', 'scss'] }
" }}}

" Add plugins to &runtimepath
call plug#end()
" }}}

" Spaces and tabs {{{
set expandtab         " tabs are spaces
set autoindent        " Indentation
set smartindent       " Indentation
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
set spelllang=en_us              " Set region to American English
" set mouse=a                      " Enable mouse usage in terminal vim
set mouse=                       " Disable mouse usage in terminal vim
set termguicolors                " true color support (will work only in tmux)
set relativenumber               " Enable relative number
set number                       " Enable hybrid mode
set encoding=utf-8               " UTF-8 encoding
set scrolloff=3                  " Number of screen lines to show around the cursor
set cursorline                   " Highlight the line you are on
set cursorline cursorcolumn      " Highlights the column you are in
set showmatch                    " Show matches ({[
set pastetoggle=<F2>
" set textwidth=79               " Max text-width
filetype plugin indent on        " Enable filetype plugins
syntax enable                    " Syntax highlighting
" Tab completion on the command line
" Wildmenu
set wildmenu
set wildmode=longest:full,full
" Splits
set splitbelow
set splitright
set laststatus=2                 " Status line always on
" colorscheme hybrid_material      " Awesome colorscheme
set background=dark
colorscheme gruvbox              " Awesome colorscheme
" }}}

" Folding {{{
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested folds max
" }}}

" Searching {{{
set ignorecase  " ignore case when using a search pattern
set incsearch   " Highlight pattern matches as you type
set hlsearch    " Highlight the search results
" }}}

" Movement {{{
" Insert Mode
" Exits INSERT mode without moving cursor (press jk || jj)
inoremap jk <ESC>l
inoremap jj <ESC>l
" Normal mode
" Remap the beginning of the line
nnoremap 0 ^
" Move to beginning/end of the line
nnoremap ` ^
nnoremap <BS> ^
nnoremap \ $
nnoremap <CR> G
" move to the search
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
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
" Equivalent to set backspace=indent,eol,start " backspace over everything in insert mode
set backspace=2
" turn off search highlight
set hidden  " It hides buffers instead of closing them
" Preventing entering Ex mode
nnoremap Q :bd %<CR>
" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" allows incsearch highlighting for range commands - VERY POWERFUL
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
" Sorting
vmap <C-s> !sort<CR>
" Splits
nnoremap <silent> sv :vsplit<CR>
nnoremap <silent> sh :split<CR>
" }}}

" Leader shortcuts {{{
let mapleader="\<Space>"
let maplocalleader=","


" Keys {{{
" Leader Mappings {{{
" Remap the ex command
nnoremap <Leader><Leader> V
nnoremap <silent><Leader>q :q<CR>
vnoremap <Leader><Leader> :
" Escapes visual mode
vnoremap <C-g> <ESC>
" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <Leader><CR> :noh<CR>
" Treat long lines as break lines (useful when moving around in them)
nnoremap <Leader><CR> :nohlsearch<CR>
" Save a file
nnoremap <Leader>w :w<CR>
" Paste
nnoremap <silent> <leader>p :set paste!<CR>
" Copy & paste to system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
vnoremap <Leader>y "+yy
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
" Splits
nnoremap <silent> <Leader>k :vsplit<CR>
nnoremap <silent> <Leader>j :split<CR>
" Edit config files
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>ez :edit ~/.zshrc<CR>
nnoremap <leader>et :edit ~/.tmux.conf<CR>
" Scroll Off
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <silent><Leader>t :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -auto-expand -toggle -no-quit<CR>
" Spell checking
nnoremap <silent> <leader>s :set spell!<CR>
" Numbers
nnoremap <silent> <leader>n :set number!<CR>
" Color the colorcolumn
nnoremap <Leader>cc :call ColorColumn()<CR>
" Key bindings for adjusting tee tab/shift width.
nnoremap <leader>w2 :setlocal tabstop=2<CR>:setlocal shiftwidth=2<CR>
nnoremap <leader>w4 :setlocal tabstop=4<CR>:setlocal shiftwidth=4<CR>
nnoremap <leader>w8 :setlocal tabstop=8<CR>:setlocal shiftwidth=8<CR>
" Shows file name
nnoremap <Leader>gg :echo expand('%:p')<CR>
" Copy the filename to the unamed register
nnoremap <Leader>gy :let +" = expand("%:p")<CR>
" }}}

" Terminal {{{
tnoremap <Esc> <C-\><C-n>
tnoremap <silent><C-g> <C-\><C-n>:close<CR>
tnoremap jk <C-\><C-n>
tnoremap jj <C-\><C-n>
" }}}

" Buffers {{{
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>
" Close all buffers but the current one
nnoremap <Leader>x :only<CR>
" Close the current buffer and back to the last edited
nnoremap <leader>d :call BufferDelete()<CR>
" }}}

" }}}

" Highlightings {{{
highlight clear SignColumn
" }}}

" Autocmd {{{
" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

augroup VIMFILER
  autocmd!

  "Config file: https://gist.github.com/mattjmorrison/6c2fff20f969237fb9fa
  autocmd FileType vimfiler nunmap <buffer> <C-l>
  autocmd FileType vimfiler nmap <buffer><Leader>t :q<CR>
  autocmd FileType vimfiler nmap <silent><buffer><expr> v vimfiler#do_switch_action('vsplit')
  autocmd FileType vimfiler nmap <silent><buffer><expr> s vimfiler#do_switch_action('split')
  autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
  autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
  autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
  autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
        \ "\<Plug>(vimfiler_expand_tree)",
        \ "\<Plug>(vimfiler_edit_file)")
augroup END

augroup OMNIFUNCS
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

augroup TERMINAL
  " Automatically enter insert mode
  autocmd BufWinEnter,WinEnter term://* startinsert
  " Exclude from buffer list
  autocmd TermOpen * set nobuflisted
augroup END

augroup FMT
  autocmd!
  " autocmd BufWritePre * Neoformat
augroup END

augroup FZF
  autocmd!
  " autocmd User FzfStatusLine call <SID>fzf_statusline()
augroup END

augroup RAINBOWS
  autocmd VimEnter * RainbowParenthesesActivate
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
  autocmd BufRead,BufNewFile * RainbowParenthesesActivate
  autocmd VimEnter * RainbowParenthesesActivate
  autocmd BufEnter * RainbowParenthesesLoadRound
  autocmd BufEnter * RainbowParenthesesLoadSquare
  autocmd BufEnter * RainbowParenthesesLoadBraces
augroup END

augroup UNITE
  autocmd!
  autocmd FileType unite call s:unite_my_settings()
augroup END

" Haskell
augroup HASKELL
  autocmd!
  " au Bufenter *.hs compiler ghc
  autocmd FileType haskell let b:ghc_staticoptions = '-Wall -Werror'
  " Use tc instead
  " autocmd BufWritePost *.hs :GhcModCheckAndLintAsync
  autocmd FileType haskell call HaskellSettings()
  " TODO: Fix when opening different file types (it breaks)
  autocmd BufWritePost *.hs silent! Neomake
augroup END

" ELM
augroup ELM
  autocmd!

  " Keybindings
  autocmd FileType elm nmap <LocalLeader>b <Plug>(elm-make)
  autocmd FileType elm nmap <LocalLeader>m <Plug>(elm-make-main)
  autocmd FileType elm nmap <LocalLeader>t <Plug>(elm-test)
  autocmd FileType elm nmap <LocalLeader>r <Plug>(elm-repl)
  autocmd FileType elm nmap <LocalLeader>e <Plug>(elm-error-detail)
  autocmd FileType elm nmap <LocalLeader>d <Plug>(elm-show-docs)
  autocmd FileType elm nmap <LocalLeader>w <Plug>(elm-browse-docs)
augroup END

" Lisp
augroup LISP
  autocmd!
  autocmd BufNewFile,BufRead,BufReadPost *.scm call SexpSettings()
augroup END

augroup JS
  autocmd!
  " Two space indentation
  autocmd FileType javascript set tabstop=2
  autocmd FileType javascript set softtabstop=2
  autocmd FileType javascript set shiftwidth=2
  autocmd FileType javascript set expandtab
  autocmd FileType javascript set conceallevel=1
  autocmd FileType javascript set concealcursor=nvic
  autocmd BufWinEnter,BufNewFile *.js silent tab
  autocmd BufNewFile,BufRead,BufReadPost *.js call JavaScriptSettings()
  autocmd BufNewFile,BufRead,BufReadPost *.js call TslimeSettings()
augroup END

augroup ML
  autocmd!
  autocmd BufNewFile,BufRead,BufReadPost *.ml call TslimeSettings()
augroup END

augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead,BufReadPost *.rb call TslimeSettings()
augroup END

augroup PYTHON
  autocmd!
  autocmd BufNewFile,BufRead,BufReadPost *.py call TslimeSettings()
  autocmd BufNewFile,BufRead,BufReadPost *.py call PythonSettings()
augroup END

augroup GOYO
  autocmd!
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" Clojure
augroup CLJ
  autocmd!
  autocmd BufNewFile,BufRead,BufReadPost *.clj call ClojureSettings()
  autocmd BufNewFile,BufRead,BufReadPost *.clj call SexpSettings()
  autocmd BufEnter *.clj setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
augroup END

augroup CLJS
  autocmd!
  " autocmd BufNewFile,BufRead,BufReadPost *.cljs call TslimeSettings()
  autocmd BufNewFile,BufRead,BufReadPost *.cljs call SexpSettings()
  autocmd BufEnter *.cljs setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
  command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))
augroup END

augroup configgroup
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=       " No bell
  autocmd! VimEnter * call UniteSettings()
  autocmd BufWinLeave * call clearmatches()
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
" }}}

augroup QUICKFIX_WINDOW
  autocmd!
  " In the quickfix window, <CR> is used to jump to the error under the
  " cursor, so undefine the mapping there.
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" Clojure Settings {{{
function! ClojureSettings()
  " Mapping
  nnoremap cq :Require<CR>
  nnoremap cr :Require<CR>
  nnoremap ce :Eval<CR>
  nnoremap cc :%Eval<CR>
  nnoremap cl :Last<CR>
  nnoremap cf :setf clojure<CR>
endfunction

function! SexpSettings()
  nmap <silent><buffer> << <Plug>(sexp_capture_prev_element)
  nmap <silent><buffer> >> <Plug>(sexp_capture_next_element)
endfunction

function! JavaScriptSettings()
  inoremap <buffer> <C-j> <CR><Esc>O
  inoremap <buffer> <C-l> <C-o>A
endfunction
" }}}

" Python {{{
function! PythonSettings()
  " TODO
endfunction
" }}}
"
function! GhcModQuickFix()
  :Unite -no-empty -no-start-insert -no-quit quickfix
endfunction

" Haskell {{{
function! HaskellSettings()

  " Hoogle
  nnoremap <silent> K :Hoogle<CR>
  nnoremap <silent> <LocalLeader>hh :Hoogle<CR>
  nnoremap <silent> <LocalLeader>hz :HoogleClose<CR>
  nnoremap <silent> <LocalLeader>hi :HoogleInfo <Space>

  " Imports
  nnoremap <silent> <LocalLeader>i :Unite haskellimport<CR>

  " GHC Mod
  " TODO: how to make it work with stack?
  " Resource: http://www.stephendiehl.com/posts/vim_2016.html
  nnoremap <silent> <LocalLeader>tt :w<CR> :GhcModType<CR>
  nnoremap <silent> <LocalLeader>tw :w<CR> :GhcModTypeInsert<CR>
  nnoremap <silent> <LocalLeader>ts :w<CR> :GhcModSplitFunCase<CR>
  nnoremap <silent> <LocalLeader>tq :w<CR> :GhcModType<CR>
  nnoremap <silent> <LocalLeader>te :w<CR> :GhcModTypeClear<CR>
  nnoremap <silent> <LocalLeader>tc :w<CR> :GhcModCheckAndLintAsync<CR>

  call WSHighlight()
endfunction
" }}}

function! WSHighlight()
  syn match BadWhiteSpace "^\\s*\\t\\+"
  syn match BadWhiteSpace "\\s\\+$"
endfunction
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
endfunction
" }}}

" Search/Grep/Buffer/Lines {{{
nnoremap <silent><C-p> :FZF<CR>
nnoremap <silent><C-f> :Unite -buffer-name=search line:all -start-insert<CR>
nnoremap <silent><C-q> :<C-u>Unite -no-quit -buffer-name=search grep:. -no-start-insert<cr><C-r><c-w><CR>
nnoremap <silent><C-s> :<C-u>Unite neosnippet -start-insert<CR>
nnoremap <silent> <C-y> :<C-u>Unite history/yank<CR>
nnoremap <silent><M-g> :FZFAg<CR>'
nnoremap <silent><M-p> :FZF<CR>
nnoremap <silent><M-b> :FZFBuffers<CR>
nnoremap <silent><M-t> :Unite -buffer-name=tags tag -start-insert<CR>
nnoremap <silent><M-f> :Unite -buffer-name=buffer-tags tag:% -start-insert<CR>
nnoremap <silent><M-o> :FZFLines<CR>
nnoremap <silent><M-m> :FZFMarks<CR>
nnoremap <silent><M-/> :Unite anzu -no-start-insert<CR>
nnoremap <silent><C-/> :Unite anzu -no-start-insert<CR>
nnoremap <silent><M-h> :Unite help<CR>
" FZF MRU: https://github.com/tweekmonster/fzf-filemru
" Seems broken and does not output MRUs...
" nnoremap <C-b> :FilesMru --tiebreak=end<CR>
" }}}

" tslime {{{
function! TslimeSettings()
  vmap <silent> ce <Plug>SendSelectionToTmux
  nmap <silent> ce <Plug>NormalModeSendToTmux
  nmap <silent> cc <Plug>NormalModeSendAllToTmux
endfunction
" }}}

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
" }}}
