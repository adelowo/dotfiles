"" Disable F1 bringing up the help doc every damn time
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

set noswapfile

set autoread
set clipboard+=unnamedplus
:set mouse=

nnoremap <Leader>w :w<CR>

""" GOD mode
" nnoremap <Up> :echomsg "disabled.. Use k"<CR>
" nnoremap <Down> :echomsg "disabled.Use j"<CR>
" nnoremap <Left> :echomsg "disabled. Use h"<CR>
" nnoremap <Right> :echomsg "disabled..Use l"<CR>

call plug#begin("~/.config/nvim/plugged")

" Dependencies
Plug 'Shougo/neocomplcache'        " Dependency for Shougo/neosnippet

"" General Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
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

"" Language specific plugins

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'plasticboy/vim-markdown'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'stephpy/vim-php-cs-fixer'
Plug 'elzr/vim-json'
Plug 'ternjs/tern_for_vim', {'build': 'npm install'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }
Plug 'zchee/deoplete-jedi'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'rust-lang/rust.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'eagletmt/neco-ghc'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'tpope/vim-rails'
Plug 'fishbullet/deoplete-ruby'

"" Color schemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'jdkanani/vim-material-theme'
Plug 'dracula/vim'
Plug 'trevordmiller/nova-vim'
Plug 'henrynewcomer/vim-theme-papaya'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'sonobre/briofita_vim'

"" Miscellaneous
Plug 'fszymanski/deoplete-emoji'
Plug 'adelowo/godo' " Todo viewer for Golang
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'roman/golden-ratio'
Plug 'ekalinin/Dockerfile.vim'
Plug 'AndrewRadev/splitjoin.vim'

"" tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

autocmd BufNewFile,BufReadPost *.MD set filetype=markdown
autocmd BufReadPost,BufWrite * :FixWhitespace

let mapleader = ","

nnoremap j gj
nnoremap k gk
map - dd
nmap <F8> :TagbarToggle<CR>
nmap <Leader><Leader> :NERDTreeMirrorToggle<CR>
nmap <Leader>cf :NERDTreeFind<CR>

nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>t :TestSuite<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tv :TestVisit<CR>

" Mimic CTRL-P in sublime text
nmap <C-p> :Files<CR>

" Show all open tabs..
nmap <S-t> :W<CR>

filetype plugin indent on
syntax on
set number  " What is a code editor without line number ?

let g:jsx_ext_required = 0
let g:session_autosave = 'no'

let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1

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

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['php'] = ['php_cs_fixer']
let g:ale_fixers['ruby'] = ['rubocop']
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_javascript_prettier_options = "--single-quote --trailing-comma es5 --print-width 80"

let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
let NERDTreeIgnore=['\~$', 'node_modules[[dir]]', '.phpcd[[dir]]', '.git[[dir]]']
let NERDTreeWinSize=45
let NERDTreeQuitOnOpen=1
let NERDTreeMapJumpNextSibling = 0
let NERDTreeMapJumpPrevSibling = 0

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

autocmd FileType php setlocal omnifunc=phpcd#CompletePHP

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" colorscheme molokai
 syntax enable
 set background=dark
 set t_Co=256
 " colorscheme gruvbox
 " colorscheme iceberg
 colorscheme briofita
 " colorscheme papaya
 " colorscheme material-theme
 " colorscheme dracula
 " colorscheme nova

"Specific mappings for Go
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gr <Plug>(go-run)
au FileType go nmap <Leader>gb <Plug>(go-build)
au FileType go nmap <Leader>gt <Plug>(go-test)
au FileType go nmap <Leader>ga <Plug>(go-alternate-vertical)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gat :GoAddTags<CR>
au FileType go nmap <Leader>gcov <Plug>(go-coverage-toggle)

" Ale mappings

nmap <Leader>ap <Plug>(ale_previous)
nmap <Leader>an <Plug>(ale_next)

let g:deoplete#enable_at_startup = 1

let g:godo_install_verbose = 1
let g:go_get_update = 1

nmap <Leader>. :Godo<CR>


let g:deoplete#sources#rust#racer_binary='/Users/lanreadelowo/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/lanreadelowo/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/'

set undofile
set undodir=~/.undo
let g:mundo_close_on_revert = 1
nnoremap <C-z> :MundoToggle<CR>

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hls                 "Highlight all matching patterns...
set showmatch
set foldenable
set foldlevelstart=10
set foldnestmax=10 "" Preserves sanity
set textwidth=80

nnoremap <End> :nohlsearch<CR>

" Make sure n and N behave the same way regardless of whether ? or / was used
" for searching.
" With this, n always go forward while N goes backwards

nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
nnoremap <space> zz

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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
endif
