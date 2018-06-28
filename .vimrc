" ==========================================================
" Basic Settings
" ==========================================================

if !has('nvim')
    " Settings already enabled in Neovim
    filetype on             " try to detect filetypes
    filetype plugin indent on   " enable loading indent file for filetype
    set nocompatible        " Don't be compatible with vi
    set wildmenu            " Menu completion in command mode on <Tab>
    syntax on               " syntax highlighing
endif

let mapleader=","       " change the leader to be a comma vs slash

set background=dark     " We are using dark background in vim
set noerrorbells        " don't bell or blink
set number              " Display line numbers
set numberwidth=1       " using only 1 column (and 1 space) while possible
set title               " show title in console title bar
set wildmode=full       " <Tab> cycles between all matching choices.

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" Moving Around/Editing
silent! set breakindent " indent wrapped text
set colorcolumn=81      " highlight column 81
set cursorline          " have a line indicate the cursor location
set expandtab           " Use spaces, not tabs, for autoindent/tab key.
set foldlevel=99        " don't fold by default
set foldmethod=indent   " allow us to fold on indents
set linebreak           " don't wrap textin the middle of a word
set matchpairs+=<:>     " show matching <> (html mainly) as well
set nostartofline       " Avoid moving cursor to BOL when jumping around
set scrolloff=6         " Keep 3 context lines above and below the cursor
set shiftround          " rounds indent to a multiple of shiftwidth
set shiftwidth=4        " but an indent level is 2 spaces wide.
set showbreak=-->       " better show of wrapped text
set showmatch           " Briefly jump to a paren once it's balanced
set softtabstop=4       " <BS> over an autoindent deletes both spaces.
set tabstop=4           " <tab> inserts 4 spaces
set virtualedit=block   " Let cursor move past the last char in <C-v> mode
if !has('nvim')
    " Settings already enabled in Neovim
    set autoindent          " always set autoindenting on
    set backspace=2         " Allow backspacing over autoindent, EOL, and BOL
    set ruler               " show the cursor position all the time
endif

" Reading/Writing
set ff=unix             " Default is unix
set ffs=unix,dos,mac    " Try recognizing dos, unix, and mac line endings.
set noautoread          " Don't automatically re-read changed files.
set noautowrite         " Never write a file unless I request it.
set noautowriteall      " NEVER.

" Messages, Info, Status
set confirm             " Y-N-C prompt if closing with unsaved changes.
set report=0            " : commands always print changed line count.
set shortmess+=a        " Use [+]/[RO]/[w] for modified/readonly/written.
if !has('nvim')
    " Settings already enabled in Neovim
    set ls=2                " always show status line
    set showcmd             " Show incomplete normal mode commands as I type.
    set vb t_vb=            " Disable all bells.
endif
"set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})

" Searching and Patterns
set ignorecase          " Default to using case insensitive searches,
set smartcase           " unless uppercase letters are used in the regex.
if !has('nvim')
    " Settings already enabled in Neovim
    set hlsearch            " Highlight searches by default.
    set incsearch           " Incrementally search while typing a /regex
    set smarttab            " Handle tabs more intelligently
endif

" swp/swo/undo file locations
if has("win32")
    set backupdir=$HOME/vimfiles/temp//
    set directory=$HOME/vimfiles/temp//
    set undodir=$HOME/vimfiles/temp//
    " Also set vimrc location to this one
    let $MYVIMRC=$HOME/vimfiles/.vimrc
else
    set backupdir=$HOME/.vim/temp//
    set directory=$HOME/.vim/temp//
    set undodir=$HOME/.vim/temp//
endif

set undofile            " Turns on persistent undo

" GUI settings - applies to GVim, doesn't work with Neovim GUIs - see ginit.vim
if has("gui_running")
    set lines=65 columns=100
    set guioptions-=T       " remove toolbar
    if has("win32")
        set guifont=Droid_Sans_Mono_Slashed:h10
    else
        " Use powerline-patched font if available
        silent! set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 10
        if &guifont != 'Droid Sans Mono Slashed for Powerline 10'
            set guifont=Droid\ Sans\ Mono\ Slashed\ 10
        endif
    endif
endif

" ==========================================================
" Plugin Settings
" ==========================================================

""">>> Dein plugin manager
if has("win32")
    set runtimepath+=$HOME/vimfiles/bundle/repos/github.com/Shougo/dein.vim
    let deindir="$HOME/vimfiles/bundle/repos/github.com/Shougo/dein.vim"
    let bundledir="$HOME/vimfiles/bundle/"
else
    set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim
    let deindir="$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim"
    let bundledir="$HOME/.vim/bundle/"
endif

if dein#load_state(bundledir)
    call dein#begin(bundledir)

    " Let dein manage dein
    call dein#add(deindir)

    "" My bundles
    call dein#add('Shougo/deoplete.nvim') " completion
    " file/buffer/etc navigation
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    if !has('nvim')
        " deoplete dependencies for Vim 8
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    call dein#add('Shougo/neopairs.vim') " Auto insert pairs on complete
    call dein#add('Shougo/context_filetype.vim') " Detect filetype in fenced code blocks
    call dein#add('Shougo/neoinclude.vim') " Completion from includes etc

    call dein#add('jnurmine/Zenburn') " Zenburn color scheme
    call dein#add('Raimondi/delimitMate') " delimiter closing
    call dein#add('othree/html5.vim') " HTML5 syntax etc
    call dein#add('chrisbra/NrrwRgn') " opens selected in split window
    call dein#add('hotchpotch/perldoc-vim') " interface to perldoc
    call dein#add('c9s/perlomni.vim') " perl omni completion
    call dein#add('vim-perl/vim-perl') " perl syntax etc
    call dein#add('StanAngeloff/php.vim') " php syntax etc
    call dein#add('Aluriak/nerdcommenter') " easy line commenting
    call dein#add('etdev/vim-hexcolor') " css colour highlight
    call dein#add('pangloss/vim-javascript') " js syntax/indenting
    call dein#add('nathanaelkane/vim-indent-guides') " indentation guides
    call dein#add('elzr/vim-json') " json highlighting etc
    call dein#add('terryma/vim-multiple-cursors') " Sublime-like multiple cursors
    call dein#add('hynek/vim-python-pep8-indent') " correct Python indentation
    call dein#add('iynaix/django.vim') " django template syntax highlighting
    call dein#add('tpope/vim-surround') " easily change surroundings
    call dein#add('vim-scripts/XSLT-syntax') " XSLT syntax highlighting
    call dein#add('fatih/vim-go') " Go (golang) support
    call dein#add('pearofducks/ansible-vim') " Ansible highlighting
    " Syntax checking, requires external syntax checkers:
    " https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
    call dein#add('scrooloose/syntastic')
    if !has('nvim')
        call dein#add('ConradIrwin/vim-bracketed-paste') " Transparent pasting
    endif
    call dein#add('majutsushi/tagbar') " Browse ctags
    call dein#add('tpope/vim-fugitive') " Git wrapper
    " better status/tabline
    call dein#add('vim-airline/vim-airline', {'depends' :
        \ ['majutsushi/tagbar', 'tpope/vim-fugitive']
        \ })
    call dein#add('vim-airline/vim-airline-themes') " airline themes
    call dein#add('hashivim/vim-terraform') " Terraform support
    " Terraform completion - @todo
    "call dein#add('juliosueiras/vim-terraform-completion', {'depends' :
    "    \ ['hashivim/vim-terraform']
    "    \ })
    " LSP support
    call dein#add('autozimu/LanguageClient-neovim', {
        \ 'rev': 'next',
        \ 'build': 'bash install.sh',
        \ })
    call dein#add('LucHermitte/lh-vim-lib') " airline themes
    call dein#add('LucHermitte/local_vimrc') " Terraform support

    call dein#end()
    call dein#save_state()
endif

" Disabled by Dein, re-enable
syntax enable
filetype on             " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype

" Check for uninstalled bundles
if dein#check_install()
    call dein#install()
endif

"""<<< Dein


""">>> Perl syntax
let perl_include_pod   = 1    "include pod.vim syntax file with perl.vim
let perl_extended_vars = 1    "highlight complex expressions such as @{[$x, $y]}
let perl_sync_dist     = 250  "use more context for highlighting
au BufRead,BufNewFile *.tpl set filetype=perl
au BufRead,BufNewFile *.ipl set filetype=perl
au BufRead,BufNewFile *.cgi set filetype=perl
"""<<< Perl syntax


""">>> XSLT Syntax
let b:xsl_include_html = 1
let b:xsl_include_css = 1
let b:xsl_include_javascript = 1
let b:xsl_include_perl = 1
"""<<< XSLT Syntax


""">>> Zenburn
if has("gui_running") == 0
    " 256-color terminal mode
    set t_Co=256
endif
let g:zenburn_high_Contrast=1
silent! colorscheme zenburn
"""<<< Zenburn

""">>> LanguageClient-neovim
let g:LanguageClient_serverCommands = {}
if executable('pyls')
    let g:LanguageClient_serverCommands.python = ['pyls']
endif
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"""<<< LanguageClient-neovim

""">>> Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" CR closes popup
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
"""<<< Deoplete

""">>> Multiple Cursors
" Multiple cursors deoplete conflict resolution
function g:Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
endfunction
function g:Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
endfunction
"""<<< Multiple Cursors

""">>> Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"""<<< Airline

""">>> vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"""<<< vim-go

""">>> Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_loc_list_height = 5
"""<<< Syntastic

""">>> Matchit
" % matches more - use version bundled with Vim
runtime macros/matchit.vim
"""<<< Matchit

""">>> NerdCommenter
" Align all comment delimiters to flush left
let g:NERDDefaultAlign = 'left'
"""<<< NerdCommenter

""">>> Terraform
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:syntastic_terraform_tffilter_plan = 1
let g:terraform_align=1
"""<<< Terraform

" ==========================================================
" Custom Mappings
" ==========================================================

" Scheme indentation
silent! autocmd filetype lisp,racket,scheme setlocal equalprg=scmindent

" Paste from clipboard
map <leader>p "+p
" Copy to clipboard
map <leader>y "+y
" Select all
map <leader>a ggVG

" jk to return to normal mode from insert mode
inoremap jk <Esc>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" ctrl-jklm changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
" Disabled - interferes with deleting back one word
"imap <C-W> <C-O><C-W>

" clear search
command C let @/=""

" don't outdent hashes
inoremap # #

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
