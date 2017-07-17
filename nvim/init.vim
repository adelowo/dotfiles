"" Disable F1 bringing up the help doc every damn time 
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

"" Language specific plugins

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'plasticboy/vim-markdown'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }

"" Color schemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'jdkanani/vim-material-theme'

"" Miscellaneous
Plug 'fszymanski/deoplete-emoji'

call plug#end()

"GOD mode
nnoremap <Up> :echomsg "disabled.. Use k"<CR>
nnoremap <Down> :echomsg "disabled.Use j"<CR>
nnoremap <Left> :echomsg "disabled. Use h"<CR>
nnoremap <Right> :echomsg "disabled..Use l"<CR>

let mapleader = ","

map - dd
nmap <F8> :TagbarToggle<CR>
nmap <Leader><Leader> :NERDTreeToggle<CR>
nmap <Leader><Leader>. :NERDTreeFocus<CR>

filetype plugin indent on
syntax on
set number  " What is a code editor without line number ?

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

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
let NERDTreeIgnore=['\~$', 'node_modules[[dir]]']
let NERDTreeWinSize=45
let NERDTreeQuitOnOpen=1

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
 colorscheme PaperColor
 " colorscheme material-theme

"Specific mappings for Go
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gr <Plug>(go-run)
au FileType go nmap <Leader>gb <Plug>(go-build)
au FileType go nmap <Leader>gt <Plug>(go-test)
au FileType go nmap <Leader>ga <Plug>(go-alternate-vertical)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gat :GoAddTags<CR>

let g:deoplete#enable_at_startup = 1


" Runs the phpcbf tool for fixing php files code style
"
" TODO(adelowo) Find a nice way to make this work with the ":w" command
" au BufWritePost *.php :call PHPCBFFile()
" The above works but I lose syntax color in the editor.. I think the culprit
" is the :edit! call but I need that to reload changes to the file..Running
" :edit! in the editor again returns the syntax coloring but that is just too
" much work.
" If I run this function via a key mapping, it seems to do just fine. I get
" the changes and don't lose syntax coloring.
function! PHPCBFFile() abort

	if !executable("phpcbf")
		echohl Error | echo "Phpcbf not found.. Install the phpcbf library" | echo None
	endif

	:w "Make sure the buffer is saved... This would be removed if I fix the above todo item.
	let s:out = system("phpcbf --pattern=PSR2 "." ". expand("%")) 
	
	:edit!

	" TODO(adelowo) If there are errors, write those out to a new window.
	" The details written should include the file path and the line(s)
	" affected. This would ease navigating to the specific line easily
	"
	" let has_errors = 0

	" for line in split(s:out,"\n")
	" 	if match(line, 'Files that were not fixed due to errors reported during linting before fixing:') != -1
	" 		let has_errors = 1 
	" 	end	
	" endfor

	" if has_errors == 1 
	" 	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap winfixheight
	" 	setlocal cursorline
  	"	setlocal nonumber
  	"	setlocal norelativenumber
  	"	setlocal showbreak=""
	" 	setlocal modifiable "Since we are trying to write the output to the window
		
	" 	delete everything first from the buffer
        "	 %delete _
	
        "	 call append(0, s:out)

	"	 $delete _

        "	 setlocal nomodifiable "Make sure the window isn't writable

        "  	It isn't a new file so remove the '[New File]' message line from the command line
        "	 echon
	" endif
	
endfunction

au FileType php nmap <Leader>pf :call PHPCBFFile()<CR> 

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hls                 "Highlight all matching patterns... Can be annoying sometimes though, I sometimes have to run :set nohls in the editor"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

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
