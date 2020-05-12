let mapleader = ","

"" Disable F1 bringing up the help doc every damn time
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
set updatetime=100


"{{{ PLUGINS

call plug#begin("~/.config/nvim/plugged")

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'mileszs/ack.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-zoom'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'plasticboy/vim-markdown'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'stephpy/vim-php-cs-fixer'
Plug 'elzr/vim-json'
Plug 'dense-analysis/ale'
Plug 'ternjs/tern_for_vim', {'build': 'npm install'}
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'rust-lang/rust.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'eagletmt/neco-ghc'
Plug 'Shougo/neoinclude.vim'
Plug 'tpope/vim-rails'

Plug 'NLKNguyen/papercolor-theme'
Plug 'jdkanani/vim-material-theme'
Plug 'dracula/vim'
Plug 'trevordmiller/nova-vim'
Plug 'henrynewcomer/vim-theme-papaya'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'sonobre/briofita_vim'
Plug 'mhartington/oceanic-next'
Plug 'whatyouhide/vim-gotham'
Plug 'joshdick/onedark.vim'

Plug 'adelowo/godo'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'roman/golden-ratio'
Plug 'ekalinin/Dockerfile.vim'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'wakatime/vim-wakatime'

call plug#end()

"}}}

set hidden

set noswapfile
set autoread
set clipboard+=unnamedplus
set mouse=
set history=50
set ruler
set showcmd
set incsearch
set hls
filetype plugin indent on
syntax on
set number
set showmatch
set foldenable
set foldlevelstart=10
set foldnestmax=10 "" Preserves sanity
set textwidth=80

"{{{ Mundo

set undofile
set undodir=~/.undo
let g:mundo_close_on_revert = 1
nnoremap <C-z> :MundoToggle<CR>
nnoremap <Leader>w :w<CR>

"}}}

""" GOD mode
" nnoremap <Up> :echomsg "disabled.. Use k"<CR>
" nnoremap <Down> :echomsg "disabled.Use j"<CR>
" nnoremap <Left> :echomsg "disabled. Use h"<CR>
" nnoremap <Right> :echomsg "disabled..Use l"<CR>

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

"" {{{ COC
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

autocmd FileType json syntax match Comment +\/\/.\+$+

command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd BufReadPost,BufWrite *.js :Prettier
autocmd BufReadPost,BufWrite *.ts :Prettier

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv  :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

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
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

""}}}


autocmd BufNewFile,BufReadPost *.MD set filetype=markdown
autocmd BufReadPost,BufWrite * :FixWhitespace

nnoremap j gj
nnoremap k gk
map - dd
nmap <F8> :TagbarToggle<CR>
nmap <Leader><Leader> :NERDTreeMirrorToggle<CR>
nmap <Leader>cf :NERDTreeFind<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>t :TestSuite<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tv :TestVisit<CR>

nmap <C-p> :Files<CR>
nmap <S-t> :W<CR>

let g:jsx_ext_required = 0
let g:session_autosave = 'no'

"{{{ vim-markdown

let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1

"}}}

"{{{ Vim-go

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command='gopls'
let g:go_disable_autoinstall = 0
let g:go_auto_type_info = 1
let g:go_highlight_fields = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "snakecase"
let g:go_snippet_engine = "neosnippet"
let g:go_echo_go_info = 0
let g:go_doc_keywordprg_enabled = 0

augroup filetype_go
  au FileType go nmap <Leader>gb <Plug>(go-build)
  au FileType go nmap <Leader>gt <Plug>(go-test)
  au FileType go nmap <Leader>ga <Plug>(go-alternate-vertical)
  au FileType go nmap <Leader>gat :GoAddTags<CR>
  au FileType go nmap <Leader>gcov <Plug>(go-coverage-toggle)
  au FileType go nmap R <Plug>(go-rename)
  au FileType go nmap <F12> :GoDecls<CR>
augroup end

"}}}


"{{{ ALE

nmap <Leader>ap <Plug>(ale_previous)
nmap <Leader>an <Plug>(ale_next)
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['php'] = ['php_cs_fixer']
let g:ale_fixers['ruby'] = ['rubocop']
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_javascript_prettier_options = "--single-quote --trailing-comma es5 --print-width 80"
let g:ale_fixers['css'] = ['prettier']
" let g:ale_fixers['go'] = ['gopls']

let g:ale_fix_on_save = 1

"}}}

"{{{ Nerd-Tree

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
let NERDTreeIgnore=['\~$', 'node_modules[[dir]]', '.phpcd[[dir]]', '.git$[[dir]]']
let NERDTreeWinSize=45
let NERDTreeQuitOnOpen=1
let NERDTreeMapJumpNextSibling = 0
let NERDTreeMapJumpPrevSibling = 0

"}}}

"{{{ Godo

let g:godo_install_verbose = 1
let g:go_get_update = 1
nmap <Leader>. :Godo<CR>

"}}}

autocmd FileType php setlocal omnifunc=phpcd#CompletePHP

"{{{ neosnippet

imap <C-e>     <Plug>(neosnippet_expand_or_jump)
smap <C-e>     <Plug>(neosnippet_expand_or_jump)
xmap <C-e>     <Plug>(neosnippet_expand_target)

imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"}}}

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

syntax enable
set background=dark
set termguicolors
set t_Co=256
let g:airline_theme='onedark'
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:onedark_hide_endofbuffer = 1
" colorscheme OceanicNext
" colorscheme gotham
" colorscheme onedark
" colorscheme molokai
" colorscheme iceberg
" colorscheme briofita
" colorscheme papaya
" colorscheme material-theme
colorscheme dracula
" colorscheme nova
" colorscheme gruvbox
"
"
nnoremap <End> :nohlsearch<CR>
nmap <leader>gs :Gstatus<CR>

" Make sure n and N behave the same way regardless of whether ? or / was used
" for searching.
" With this, n always go forward while N goes backwards
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
nnoremap <space> zz

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Automatically close documentation preview window after typing or selecting
  " an option provided by intellisense
  autocmd CompleteDone * pclose

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
" C
endif
