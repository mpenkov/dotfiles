let mapleader = "-"

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
au BufRead,BufNewFile *.md set filetype=markdown

" http://stackoverflow.com/questions/3534028/mac-terminal-vim-will-only-use-backspace-when-at-the-end-of-a-line
set backspace=indent,eol,start

if has("autocmd")
  filetype plugin indent on
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType js setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
endif

"
" Make shortcut
"
nmap <silent> <c-p> :next<CR>
nmap <silent> <c-o> :prev<CR>
nmap <silent> <c-P> :cn<CR>
nmap <silent> <c-O> :cp<CR>

"
" Get one-liner autocomments to work properly
"
set formatoptions+=cro

"
" Shortcut for editing .vimrc
" Why does this not work with leader??
"
map <Space>m :tabedit $HOME/.vimrc<CR>
map <Space>n :source $HOME/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" https://github.com/mpenkov/russian-jcuken-jp.vim
map <leader>r :set keymap=russian-jcuken-jp<CR>
map <leader>t :set keymap=<CR>

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

set clipboard=unnamed

"
" File navigation stuff from DestroyAllSoftware.com
" Edit files in the same directory as the current file
"
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
" Make the current window big, keep everything else context.
" set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
" set winheight=999
" Switch between the last two files
nnoremap <leader><leader> <c-^>

if exists('+colorcolumn')
  set colorcolumn=80
endif

" http://statico.github.io/vim.html
:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

:nmap \e :NERDTreeToggle<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Write temporary files to a single subdirectory to avoid polluting the source tree
:set directory=$HOME/.vim/swapfiles//

:set relativenumber

" https://statico.github.io/vim3.html
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" Lightline
let g:lightline = {
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" fzf
set rtp+=/usr/local/opt/fzf

nmap <Leader>; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>g :Tags<CR>

" Don't lint while editing, it's distracting
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <C-c> <C-a>

" Make autocompletion behave like bash
set wildmode=longest,list
" Keep more than 20 commands in history
set history=1000

" Map %% to %:h, the former is much easier to type
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
