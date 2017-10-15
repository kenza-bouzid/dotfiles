" https://stackoverflow.com/questions/3534028/mac-terminal-vim-will-only-use-backspace-when-at-the-end-of-a-line
set backspace=indent,eol,start

" Show lines numbers
set number

" Show ruler
set ruler

" Show partial matches for a search phrase
set incsearch

" Highlight all matching phrases
set hlsearch

" Ignore upper/lower case when searching
set ignorecase

" Don't ignore case if search includes upper case
set smartcase

" Indent
filetype plugin indent on
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set expandtab

" https://stackoverflow.com/questions/32103591/vim-cant-scroll-in-iterm2
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Syntax highlighting
syntax on

"syntax enable
"colorscheme monokai

" Show partial matches for a search phrase
set incsearch

" Highlight all matching phrases
set hlsearch

" Ignore upper/lower case when searching
set ignorecase

" Indent
filetype plugin indent on
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set expandtab

" crontab (http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place)
:if $VIM_CRONTAB == "true"
:set nobackup
:set nowritebackup
:endif

" Highlight trailing whitespaces
" https://www.slicer.org/wiki/Documentation/Nightly/Developers/DevelopmentWithGit#pre-commit
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Show relative lines number
set relativenumber

" Save undo info: https://vi.stackexchange.com/a/53
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
