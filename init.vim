set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2

call plug#begin('C:\Users\joshw\AppData\Local\nvim\plugged')

" Temas 
Plug 'morhetz/gruvbox'
" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim'

call plug#end()

colorscheme gruvbox

let g:gruvbox_contrast_dark = "hard"

let NERDTreeQuitOnOpen=1
let mapleader = "z"


" con la tecla espacio + s abre un cuadro de busqueda para trasladarnos en el
" documento por medio de dos caracteres
nmap <Leader>s <Plug>(easymotion-s2)
" con la tecla espacio + nt abre un arbol de navegacion de archivos
nmap <Leader>nt :NERDTreeFind<CR>

" teclas personalizadas
" save current file
nmap <Leader>w :w<CR>
" quit current file
nmap <Leader>q :q<CR>


" Go to the left window
nmap <Leader>h  <C-h> " Go to the left window
" Go to the right window
nmap <Leader>l  <C-l>
 " Go to the down window
nmap <Leader>j  <C-j>
" Go to the up window
nmap <Leader>k  <C-k> 
 " create an horizontal split.
nmap <Leader>sp  :sp<CR>
"create an vertical split
nmap <Leader>vsp :vsp<CR> .
" Double-j
" inoremap jj <Esc>
 "Space-j  
inoremap<Leader>j <Esc>


 " create an horizontal split and open a terminal.
nmap <Leader>ht  :sp<CR>:let $VIM_DIR=expand('%:p:h')<CR>:term<CR>cd $VIM_DIR<CR>clear<CR>

" split -term
" set splitbelow will put the new window below the current one when using
" :Term
" set splitbelow 
"open terminal in the current windows with the current path
" nmap <Leader>t :terminal<CR> "open terminal in the current windows
"map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR> 
nmap <Leader>t :let $VIM_DIR=expand('%:p:h')<CR>:term<CR>cd $VIM_DIR<CR>clear<CR>



"
" reload vim editor
nno <Leader>r :<c-u>call <sid>vim_quit_and_restart()<cr>
fu! s:vim_quit_and_restart() abort
    if has('gui_running') | echo 'not available in GUI' | return | endif
    sil! update
    sil call system('kill -USR1 $(ps -p '.getpid().' -o ppid=)')
    qa!
endfu

"end of reload vim editor
"



" ALEFix
"
"
let g:ale_fix_on_save = 1





" Coc Extension
"
"

"Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
 inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
             \ <SID>check_back_space() ? "\<TAB>" :
                   \ coc#refresh()
                   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

                   function! s:check_back_space() abort
                     let col = col('.') - 1
                       return !col || getline('.')[col - 1]  =~# '\s'
                       endfunction

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime ( default is 4000 ms = 4 s ) leads to notice able
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it whould shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
else
      set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction


if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif" Use <c-space> to trigger completion.




