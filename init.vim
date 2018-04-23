" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif








call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-smooth-scroll'
Plug 'jacoborus/tender.vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'matze/vim-move'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
" Plug 'gabrielelana/vim-markdown'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'joshdick/onedark.vim'
Plug 'kien/ctrlp.vim'
" , {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU', 'CtrlBuffers']}
let g:ctrlp_working_path_mode = 'c'


" Plug 'MaxSt/FlatColor'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-bufferline'
Plug 'wimstefan/vim-artesanal'
Plug 'endel/vim-github-colorscheme'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'reedes/vim-pencil'
" Plug 'jpo/vim-railscasts-theme'
Plug 'jceb/vim-orgmode'
" Plug 'sonph/onehalf'
" Plug 'reedes/vim-colors-pencil'
" Plug 'rakr/vim-one'
Plug 'fenetikm/falcon'
Plug 'lervag/vimtex'
" Plug 'https://github.com/haya13busa/is.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/Alok/notational-fzf-vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on


nmap <silent> ,ev :e /Users/nensmeng/.config/nvim/init.vim<cr>
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" History and Undo Setup
set undolevels=99999       | " Set max number of undo actions saved
set undodir=~/.vim/undodir | " Set directory to store undo files
set undofile               | " Make undo history persistent
set history=1000           | "

set guioptions-=r   "hide right scrollbar
set hidden
set cursorline
syntax on
highlight clear LineNr "set number background to default
highlight clear SignColumn
autocmd Colorscheme * highlight FoldColumn guifg=bg guibg=bg
autocmd Colorscheme * highlight clear LineNr

set splitright " Split to right by default

let mapleader = ','

nnoremap <Silent> <Space>f :CtrlP<CR>
nnoremap <silent> <Space>m :CtrlPMixed<CR>
nnoremap <silent> <Space>r :CtrlPMRU<CR>
nnoremap <leader>f :CtrlPCurFile<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

if has("termguicolors")
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set background=dark
" colorscheme tender
" colorscheme falcon
"let g:lightline = { 'colorscheme': 'tender' }

" colorscheme quantum
" let g:quantum_black = 1
" let g:airline_theme='quantum'


:if has('gui_running')
    " set background=light
    " colorscheme one
set background=dark
colorscheme falcon
    " let g:one_allow_italics = 1 
   " let g:airline_theme='one'
    " colorscheme pencil
    let g:pencil_spell_undercurl = 0
    let macvim_skip_colorscheme=1
    set macmeta
    set linespace=3
    set guifont=Hack:h16
    " set guifont=Source\ Code\ Pro:h16
:endif



set laststatus=2
" hi FoldColumn ctermbg=none
set foldcolumn=2
set foldlevelstart=20
			
set linespace=2
set wrap linebreak nolist

" if has("nvim")
"     set inccommand=nosplit
" endif

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
" allows for ctrl-e (end) and ctrl-a (start) in insert mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0



" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set number

" live preview for replace
" set inccommand=split

" remap semi-colon to colon
nnoremap ; :

" git@github.com:terryma/vim-smooth-scroll.git
noremap <silent> <c-e> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

" set search case to a good configuration http://vim.wikia.com/wiki/Searching 
set ignorecase
set smartcase

" search characters as they're entered
set incsearch


map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch " highlight searches
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
set gdefault " use global flag by default in s: commands
set ignorecase 
set smartcase " don't ignore capitals in searches
nnoremap <leader><space> :nohls <enter>


set spell
set spelllang=en

let g:markdown_folding = 1

" use leader to interact with the system clipboard
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P

nnoremap <Leader>y :y*<cr>
nnoremap <Leader>c ^"*c$
nnoremap <Leader>d ^"*d$

vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d

" Make X an operator that removes text without placing text in the default
" registry
nmap X "_d
nmap XX "_dd
vmap X "_d
vmap x "_d

" have x (removes single character) not go into the default registry
nnoremap x "_x

" ctrl-j inserts blank line above
" nnoremap <C-J> maO<Esc>`a
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^silent\s*$/d<CR>``:noh<CR>
nnoremap <silent><M-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><M-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

if has("nvim")

  " Make escape work in the Neovim terminal.
  tnoremap <Esc> <C-\><C-n>

  " Make navigation into and out of Neovim terminal splits nicer.
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  " I like relative numbering when in normal mode.
  autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

  " Prefer Neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert
endif

" move between, close buffers
nnoremap <C-H> :bp <enter>
nnoremap <C-L> :bn <enter>
" nnoremap <Leader>w :w <enter>
" nnoremap <Leader>q :bd <enter>

" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

set encoding=utf8
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

set rtp+=/usr/local/opt/fzf

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" nnoremap <leader>f :Files<cr>
" nnoremap <leader>b :Buffers<cr>




" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:nv_search_paths = ['/Users/nensmeng/Data/1-academic/simplenotes']
let g:nv_use_short_pathnames = 1
" let g:nv_search_paths = ['/tmp/test-nvim']
let g:nv_preview_direction = 'up'
nnoremap <leader>n :NV<cr>
