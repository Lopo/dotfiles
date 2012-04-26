" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype plugin indent on
if &t_Co > 2 || has('gui_running')
	syntax on "turn on syntax highlighting
	set hlsearch "Hilight searches by default
endif

" ================ General Config ====================
set number "Line numbers are good
set backspace=indent,eol,start "Allow backspace in insert mode
set history=500 "Store lots of :cmdline history
set showcmd "Show incomplete cmds down the bottom
set showmode "Show current mode down the bottom
set gcr=a:blinkon0 "Disable cursor blink

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Search Settings  =================
set incsearch "Find the next match as we type the search
set viminfo='50,\"500 "Save up to 50 marks

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" ================ Folds ============================
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" ================ Completion =======================
set wildmode=longest:full,full
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildchar=<Tab>
"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=5
set sidescroll=5

" ================ Visual things
set ruler
set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P
set title
set titlestring=VIM\ -\ %t
highlight User1 guibg=white guifg=blue
highlight User2 guibg=white guifg=red
set laststatus=2 " Always show status line

" ================ Other stuff
set autowrite
set timeoutlen=500
set confirm
cabbrev mkae make
cabbrev maek make
set showmatch
set nojoinspaces
set shiftround " Round indent to multiple of 'shiftwidth'
set clipboard=unnamed " Yank and paste selections without prepending "*
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

