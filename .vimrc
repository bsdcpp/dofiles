set nocompatible
set background=dark

let mapleader = ','
if has('win32') || has('win64') || has('win32unix')
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif
let $VIMTEMP = $VIMFILES.'/tmp'

for ext in ['bundles', 'functions', 'maps']
    if filereadable(expand($VIMFILES.'/vimrc.' . ext))
        execute 'source ' . expand($VIMFILES.'/vimrc.' . ext)
    end
endfor

"
" Appearence
"
syntax on
set number
set ruler
set cursorline
set relativenumber
set shortmess=aoOtI
set laststatus=2

if v:version >= 703
	hi colorcolumn guibg=lightgreen
	set textwidth=80
	set colorcolumn=+1
" persistent undo Settings
	set undofile
	set undodir=$VIMTEMP
	set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number lines to save for undo on a buffer
endif

" expand tab to space
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set splitright
set splitbelow

set wildmenu
set wildmode=list:longest,full

set hidden
set lazyredraw

" folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable

" indent
set smartindent
set autoindent
set cindent

" search
set hlsearch
set incsearch
set smartcase
set ignorecase

set history=500

" utils
set autoread
set showmatch
set pastetoggle=<F5>

" encoding
if has("win32") && !has("gui_running")
    set encoding=gbk
    set fileencoding=gbk
else
    set encoding=utf-8
    set fileencoding=utf-8
endif

set fileencodings=utf-8,gbk

set iskeyword-=.                       " '.' is an end of word designator
set iskeyword-=#                       " '#' is an end of word designator
set iskeyword-=-                       " '-' is an end of word designator

set cscopetag
set cscopeprg='gtags-cscope'

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeQuickOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']

let NERDSpaceDelims = 1

let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:indentLine_color_term = 242
let g:indentLine_color_gui  = '#60666b'
let g:indentLine_char       = '┆'       " | ┆

"let g:SuperTabDefaultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<c-tab>'
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" emmet-vim
let g:user_emmet_install_global = 0

" Templates
let g:templates_no_builtin_templates = 1
" let g:templates_directory = '~/.vim/templates'


let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']

let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_completion = 0

" use append instead of replace
let g:erlang_skel_replace = 0
" enable erlang header skel
let g:erlang_skel_header = {}

if !has("win32") || has("gui_running")
    colorscheme flatlandia

    " Monkey Patching
    " original 239
    hi LineNr ctermfg=242
end

if has("gui_running")
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L

    set columns=100
    set lines=28

    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
    set guifontwide=YaHei\ Consolas\ Hybrid\ 12
end

if has("win32") && has("gui_running")
    set guifont=SauceCodePro_NF:h12:cANSI
    set guifontwide=YaHei\ Consolas\ Hybrid:h12:cGB2312

    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    language messages zh_CN.utf-8
end

"autocmd FileType html,css,scss,sass setlocal shiftwidth=2 softtabstop=2
"autocmd FileType html,css EmmetInstall
