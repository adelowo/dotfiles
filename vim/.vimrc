"Vi ? WTF ? We go back to 1995"
set nocompatible

"Disable arrow keys
nnoremap <Up> :echomsg "disabled.. Use k"<CR>
nnoremap <Down> :echomsg "disabled.Use j"<CR>
nnoremap <Left> :echomsg "disabled. Use h"<CR>
nnoremap <Right> :echomsg "disabled..Use l"<CR>

:let mapleader = ","
:let g:netrw_liststyle = 3
let g:netrw_banner = 0

execute pathogen#infect()

map - dd
nmap <F8> :TagbarToggle<CR>
nmap <F1> :Rexplore<CR>

filetype plugin indent on
syntax on
set number  " What is a code editor without line number ?
let g:go_disable_autoinstall = 0

" Highlight important stuffs 
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1 


"" Neocomplete
 
let g:neocomplete#enable_at_startup = 1 "autcompletion is life

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Autocomplete should only kick in if I already have more than 3 letters.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd filetype html,markdown setlocal omnifunc=htmlcomplete#completetags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" colorscheme molokai
 syntax enable
 set background=dark
 colorscheme material-theme

"Specific mappings for Go
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gr <Plug>(go-run)
au FileType go nmap <Leader>gb <Plug>(go-build)
au FileType go nmap <Leader>gt <Plug>(go-test)
au FileType go nmap <Leader>ga :GoAlternate<CR>

" allow backspacing over everything 
set backspace=indent,eol,start

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

packadd matchit

