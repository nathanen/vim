if has('python3')
  silent! python3 1
endif

" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


" Movement & Manipulation
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-smooth-scroll' 
" Plug 'haya14busa/incsearch.vim'
Plug 'ervandew/supertab'
Plug 'sjl/gundo.vim'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'


" if has('python3')
"     let g:gundo_prefer_python3 = 1
" endif

" Filetypes & Syntax
" Plug 'gabrielelana/vim-markdown'
Plug 'vimwiki/vimwiki' 
Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'   "need to set specific modules
" Plug 'vim-pandoc/vim-markdownfootnotes'

au BufRead,BufNewFile *.md,*.mkd,*.markdown set ft=markdown


augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType pandoc call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

map <silent> <leader>qc <Plug>ReplaceWithCurly
map <silent> <leader>qs <Plug>ReplaceWithStraight

" VIM THEMES/COLORSCHEMES
Plug 'rakr/vim-one'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jpo/vim-railscasts-theme'
" Plug 'fenetikm/falcon'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'MaxSt/FlatColor'
Plug 'morhetz/gruvbox'
Plug 'endel/vim-github-colorscheme'

" Light themes
Plug 'sonph/onehalf',  {'rtp': 'vim/'}
Plug 'mkarmona/materialbox'
Plug 'wimstefan/vim-artesanal'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-airline/vim-airline'
" Plug 'ryanoasis/vim-devicons'

" Writing, Spelling, Grammar
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/limelight.vim'
" Plug 'msprev/unite-bibtex'
" Plug 'rhysd/vim-grammarous'
" Plug 'dbmrq/vim-ditto'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-lexical'
Plug 'mikewest/vimroom'
Plug 'jdiamond/UniCycle'

" autocmd! User GoyoEnter Limelight0.7
" autocmd! User GoyoLeave Limelight!

" Interface
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/Alok/notational-fzf-vim'

" Plug 'kien/ctrlp.vim'
" DISABLED: using FZF for these purposes
" " , {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU', 'CtrlBuffers']}
" let g:ctrlp_working_path_mode = 'c'


" Initialize plugin system
call plug#end()

filetype plugin on

set nocompatible


nmap <silent> ,ev :e /Users/nensmeng/.config/nvim/init.vim<cr>
nmap <silent> ,md :e /Users/nensmeng/scratch/markdown/markdown-sample.txt<cr>
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


set laststatus=2
hi FoldColumn ctermbg=none
set foldcolumn=2
set foldlevelstart=20

set linespace=2
set wrap linebreak nolist
set tabstop=4 
" autocmd VimResized * | set columns=72

" set relativenumber
" set number
set backspace=indent,eol,start

set splitright " Split to right by default
set wildmode=longest,list
set wildmenu

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
let maplocalleader = ','

" nnoremap  <leader>m :CtrlPMixed<CR>
" nnoremap <leader>r :CtrlPMRU<CR>
" nnoremap <leader>f :CtrlPCurFile<CR>
" nnoremap <leader>b :CtrlPBuffer<CR>

" Omnicomplete Better Nav
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")


if has("termguicolors")
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" colorscheme tender
" colorscheme falcon
"let g:lightline = { 'colorscheme': 'tender' }

" colorscheme quantum
" let g:quantum_black = 1
" let g:airline_theme='quantum'




if has("nvim")
	" Make escape work in the Neovim terminal.
	tnoremap <Esc> <C-\><C-n>
	" Make navigation into and out of Neovim terminal splits nicer.
	tnoremap <C-h> <C-\><C-N><C-w>h
	tnoremap <C-j> <C-\><C-N><C-w>j
	tnoremap <C-k> <C-\><C-N><C-w>k
	tnoremap <C-l> <C-\><C-N><C-w>l

	set inccommand=split

	" I like relative numbering when in normal mode.
	" autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

	" Prefer Neovim terminal insert mode to normal mode.
	autocmd BufEnter term://* startinsert
endif


noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
" allows for ctrl-e (end) and ctrl-a (start) in insert mode
inoremap <C-e> <C-o>$
" inoremap <C-a> <C-o>0

" also in normal mode
noremap <C-e> $
noremap <C-a> 0

 "Switch to buffer by number
nnoremap 1<tab> :1b<CR>
nnoremap 2<tab> :2b<CR>
nnoremap 3<tab> :3b<CR>
nnoremap 4<tab> :4b<CR>
nnoremap 5<tab> :5b<CR>
nnoremap 6<tab> :6b<CR>
nnoremap 7<tab> :7b<CR>
nnoremap 8<tab> :8b<CR>
nnoremap 9<tab> :9b<CR>


" remap semi-colon to colon
nnoremap ; :

" git@github.com:terryma/vim-smooth-scroll.git
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

let g:move_map_keys = 0 "not sure why this is needed, but it seems to be
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <A-j> <Plug>MoveLineDown
nmap <A-k> <Plug>MoveLineUp

" Searching
    set ignorecase
    set smartcase
    set incsearch     " search characters as they're entered
    set hlsearch " highlight searches
	set wrapscan
    let g:incsearch#auto_nohlsearch = 1
    set gdefault " use global flag by default in s: commands
    set smartcase " don't ignore capitals in searches
    " nnoremap <leader><space> :nohls <enter>
	" cnoremap <Tab> <CR>/<up>

    " map /  <Plug>(incsearch-forward)
    " map ?  <Plug>(incsearch-backward)
    " map g/ <Plug>(incsearch-stay)
    " map n  <Plug>(incsearch-nohl-n)
    " map N  <Plug>(incsearch-nohl-N)
    " map *  <Plug>(incsearch-nohl-*)
    " map #  <Plug>(incsearch-nohl-#)
    " map g* <Plug>(incsearch-nohl-g*)
    " map g# <Plug>(incsearch-nohl-g#)

nnoremap <Leader>u :GundoToggle<CR>
set spell
set spelllang=en
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

nmap <LocalLeader>f <Plug>AddVimFootnote

" automatically switch working directory to current file
autocmd BufEnter * silent! lcd %:p:h

let g:vimtex_index_split_pos='botright'  

   let g:vimtex_toc_hotkeys = {
        \ 'enabled' : 1,
        \ 'leader' : ';',
        \ 'keys' : 'abcdefghijklmnopqrstuvxyz',
        \}

let g:markdown_folding = 1
command! Marked silent !open -a "Marked 2.app" "%:p"




let g:vimwiki_list = [{'path': '~/Data/1-academic/simplenotes',  'syntax': 'markdown', 'ext': '.txt'}, {'path': '~/Data/3-Personal/motorcycle/motorcycle-notes',  'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_global_ext = 0
 
let g:vimwiki_folding = 'custom'  
au BufRead,BufNewFile *.txt,*.wiki set ft=markdown
let g:vimwiki_table_mappings = 0


augroup pencil
  autocmd!
  autocmd FileType markdown,text,pandoc call pencil#init()
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            " \ | call textobj#quote#init()
                            \ | call textobj#sentence#init()
augroup END

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
" nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><C-k> m`:silent -g/\m^silent\s*$/d<CR>``:noh<CR>
" nnoremap <silent><M-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <silent><M-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>



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
" map <Leader>h <Plug>(easymotion-linebackward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

set encoding=utf8
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" FZF/Fuzzy Searching
    set rtp+=/usr/local/opt/fzf

    " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
    nnoremap <silent> <leader>f :Files<cr>
	nmap <silent> <leader>g :GFiles<CR>
    nnoremap <silent> <leader>b :Buffers<cr>
	nmap <silent> <leader>m :History<CR>

    " let g:nv_search_paths = ['~/Data/1-academic/simplenotes']
	    let g:nv_search_paths = ['~/Data/1-academic/simplenotes', '~/superlinks/personal/motorcycle/motorcycle-notes']

    let g:nv_use_short_pathnames = 1
    let g:nv_default_extension = '.txt' 
    let g:nv_preview_direction = 'up'
    nnoremap <leader>n :NV<cr>

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

nmap <leader>h :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" function! SoftWrap()
"     let s:old_fo = &formatoptions
"     let s:old_tw = &textwidth
"     set fo=
"     set tw=999999 " works for paragraphs up to 12k lines
"     normal gggqG
"     let &fo = s:old_fo
"     let &tw = s:old_tw
" endfunction

" unfill paragraph
noremap <Leader>q vipJ<CR>  

" Apply custom highlights
fun! s:Highlight()
		" Hide ~ characters shown for empty lines
		highlight EndOfBuffer guifg=bg
		" set window background to theme background
		highlight NonText guibg=NONE   
		highlight clear LineNr "set number background to default
		highlight clear SignColumn
		highlight FoldColumn guifg=bg guibg=bg
		highlight clear LineNr
		highlight conceal guibg=bg
  
		" set cursor color/
		highlight cursor guifg='orange'
		autocmd InsertEnter :* highlight  cursor guifg='green'
		autocmd InsertLeave :* highlight  cursor guifg='orange'


endfun

call s:Highlight()

" Reapply custom highlights when the color scheme is reloaded
augroup Highlight
  autocmd! ColorScheme * call s:Highlight()
augroup end

if has('gui_running')
		set background=light
		colorscheme Pencil
		" colorscheme materialbox
	" set background=dark
	" colorscheme one
	" colorscheme falcon
	" colorscheme Mustang

	" let g:one_allow_italics = 1 
	" let g:airline_theme='one'
	" colorscheme pencil
	let g:pencil_spell_undercurl = 0
	let macvim_skip_colorscheme=1
	set macmeta
	set linespace=3
	" set guifont=Hack:h15
	" set guifont=Ubuntu\ Mono:h15	
	" set guifont=Hack:h13
		set guifont=Roboto\ Mono:h15	
else
	colorscheme railscasts
	" colorscheme quantum
endif

if exists("g:gui_oni")
		" set guifont=Hack:h16
		" colorscheme artesanal
		" colorscheme Mustang
		" the following is required for oni-minimal
		" filetype off                  " required 
		set noswapfile
		set smartcase

		" Turn off statusbar, because it is externalized
		set noshowmode
		set noruler
		set laststatus=0
		set noshowcmd

		" Enable GUI mouse behavior
		set mouse=a
endif


let g:tagbar_ctags_bin='/usr/local/bin/ctags'

 let g:tagbar_type_vimwiki = {
 			\   'ctagstype':'vimwiki'
 			\ , 'kinds':['h:header']
 			\ , 'sro':'&&&'
 			\ , 'kind2scope':{'h':'header'}
 			\ , 'sort':0
 			\ , 'ctagsbin':'~/bin/vwtags.py'
 			\ , 'ctagsargs': 'markdown'
 			\ }

