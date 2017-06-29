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
Plug 'tpope/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'joshdick/onedark.vim'
Plug 'MaxSt/FlatColor'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'reedes/vim-pencil'

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

if has("termguicolors")
    set termguicolors
endif
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
" colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }

" colorscheme quantum
" let g:quantum_black = 1
" let g:airline_theme='quantum'

let macvim_skip_colorscheme=1
set guifont=Hack:h14
set laststatus=2
hi FoldColumn ctermbg=none
set foldcolumn=3
set foldlevelstart=20
			
set linespace=2
set wrap linebreak nolist

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$


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
" don't highlight all search matches
" set nohlsearch

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
nnoremap <C-J> maO<Esc>`a

"- Neovim Terminal Mappings
nnoremap <Esc> <C-\><C-n> | " Use escape key to exit terminal input


let g:EasyMotion_do_mapping = 0 " Disable default mappings

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

