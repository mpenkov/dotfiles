set autoindent
set nocindent
set nosmartindent
set shiftwidth=4
set tabstop=4
set expandtab

set nobackup
set number

colo solarized
set bg=light

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
set guifont=Neep\ Alt\ 12

" http://stackoverflow.com/questions/2732267/vim-loses-undo-history-when-changing-buffers
set hidden

" http://stackoverflow.com/questions/357785/what-is-the-recommended-way-to-use-vim-folding-for-python-code
" space bar to toggle folds
nnoremap <space> za
vnoremap <space> zf
set foldmethod=marker
" set foldnestmax=2

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

let g:tex_fold_enabled=1
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
call togglebg#map("<F5>")

let g:notes_directory = "~/git/research/notes"
let g:notes_suffix = ".txt"
