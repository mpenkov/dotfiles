execute pathogen#infect()
execute pathogen#helptags()

set autoindent
set nocindent
set nosmartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set nobackup
set number

syntax on

colo solarized
set bg=light

if has("autocmd")
  filetype plugin indent on
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
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
":autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

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
set nolist
set listchars=tab:>.,eol:¬
nmap <leader>l :set list!<CR>

" Always display a status line at the bottom of the window
set laststatus=2
set cmdheight=1

set modeline

set fileencodings=utf-8,euc-jp

set printoptions=paper:a4

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

" For scrolling 
set mouse=a             " hold shift to copy xterm
set ttymouse=xterm2     " necessary for gnu screen & mouse

function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"
" from http://vim.wikia.com/wiki/Show_tab_number_in_your_tab_line
"
if has('gui')
  set guioptions-=e
endif
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let s .= i . ':'
      "let s .= winnr . '/' . tabpagewinnr(i,'$')
      "let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif

execute pathogen#infect()
execute pathogen#helptags()
