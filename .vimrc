set autoindent
set nocindent
set nosmartindent
set shiftwidth=4
set tabstop=4
set expandtab

set nobackup
set number

colo solarized
set bg=dark

if has("autocmd")
  filetype plugin indent on
endif  

nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <silent> <c-f> :NERDTreeFind<CR>

"
" Make shortcut
"
nmap <silent> <c-p> :next<CR>
nmap <silent> <c-o> :prev<CR>
nmap <silent> <c-P> :cn<CR>
nmap <silent> <c-O> :cp<CR>

"
" Change pwd to directory of file
"
:autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

"
" Get one-liner autocomments to work properly
"
set formatoptions+=cro


"
" Shortcut for editing .vimrc
" ,v will edit .vimrc
" ,V will reload it
"
map ,v :sp $HOME/.vimrc<CR> 
map <silent> ,V :source $HOME/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Show  tab characters. Visual Whitespace.
set list
set listchars=tab:>.

" Always display a status line at the bottom of the window
set laststatus=2
set cmdheight=1

set modeline

set fileencodings=utf-8,euc-jp

set printoptions=paper:a4
"set guifont=Neep\ Alt\ 12

" http://stackoverflow.com/questions/2732267/vim-loses-undo-history-when-changing-buffers
set hidden

" Disable arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set pastetoggle=<F12>

" Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

nnoremap <F5> :GundoToggle<CR>

" For line-breaks of Japanese text
set formatoptions+=mM

let g:notes_directory = "~/Dropbox/vim-notes"
let g:notes_suffix = ".txt"

execute pathogen#infect()
execute pathogen#helptags()
