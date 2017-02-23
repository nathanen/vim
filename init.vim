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
Plug 'matze/vim-move'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

filetype plugin indent on

nmap <silent> ,ev :e /Users/nensmeng/.config/nvim/init.vim<cr>
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

set guioptions-=r   "hide right scrollbar
set hidden
syntax on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }
let macvim_skip_colorscheme=1
set guifont=Menlo:h14
set laststatus=2
hi FoldColumn ctermbg=none
set foldcolumn=3
			
set linespace=2
set wrap linebreak nolist
	
" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set number

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
set nohlsearch

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

