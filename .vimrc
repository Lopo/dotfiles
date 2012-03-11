set nocompatible
set number
filetype plugin indent on
if &t_Co > 2 || has('gui_running')
	syntax on
	set hlsearch
	set undodir=~/.vim/backups
	set undofile
endif
set autowrite
set ruler
set timeoutlen=500
set confirm
set viminfo='50,\"500
set history=500
set incsearch
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
cabbrev mkae make
cabbrev maek make
set ts=4
set sw=4
set softtabstop=4
set laststatus=2
set showcmd
set showmode
set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P
highlight User1 guibg=white guifg=blue
highlight User2 guibg=white guifg=red
set showmatch
set title
set titlestring=VIM\ -\ %t
set scrolloff=5
set sidescroll=5
set autoindent
set smartindent
set smarttab
set backspace=indent,eol,start
set nojoinspaces
set shiftwidth=4
set shiftround
set clipboard=unnamed
set foldmethod=indent
set foldnestmax=3
set nofoldenable
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set gcr=a:blinkon0
set hidden
set noswapfile
set nobackup
set nowb

