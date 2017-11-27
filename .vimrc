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
set expandtab           " insert space characters when the tab key is pressed

" https://stackoverflow.com/questions/32103591/vim-cant-scroll-in-iterm2
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Syntax highlighting
syntax on

" Handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"syntax enable
colorscheme solarized8_dark

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

" These will help me learn Vim
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Yank and paste using clipboard
" https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
set clipboard=unnamed
