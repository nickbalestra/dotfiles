"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Nick Balestra
"       nick@balestra.ch
"
" Version: 
"       1.0 - 14/03/15
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> GUI related
"    -> Moving around, tabs and buffers
"    -> Misc/Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen config
execute pathogen#infect()

" Enable filetype plugins
filetype plugin indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"

" Fast saving and quitting
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>q :q!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
" https://github.com/haya14busa/incsearch.vim
set incsearch

" turn off search highlight
nnoremap <Leader>c :nohlsearch<CR>

" Ignore case when searching
" http://vim.wikia.com/wiki/Searching
set ignorecase

" When searching try to be smart about cases
" http://vim.wikia.com/wiki/Searching
set smartcase

" highlight current line
" http://vim.wikia.com/wiki/Highlight_current_line
set cursorline          

" redraw only when we need to.
set lazyredraw          

" highlight matching [{()}]
" http://vim.wikia.com/wiki/Moving_to_matching_braces
set showmatch           


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on
syntax enable

" Set background and colorscheme
" dark heroku - https://github.com/stulzer/heroku-colorscheme
" dark c64 - http://aaronmaupin.com/blog/vim-c64-color-scheme
" dark/light hemisu - https://noahfrederick.com/vim-color-scheme-hemisu
set background=dark
colorscheme heroku

" Set utf8 as standard encoding 
set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup & co off, since most stuff is git anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" http://dougblack.io/words/a-good-vimrc.html#spaces
" number of visual spaces per TAB
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" tabs are spaces
set expandtab

set nowrap
set textwidth=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" show line numbers
set number

" show command in bottom bar
set showcmd            

" Setting the font in the GUI
" http://vim.wikia.com/wiki/Setting_the_font_in_the_GUI
set gfn=Menlo:h13


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jk is the new escape
inoremap jk <esc>

" Default position for new split windows
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright

" resize focused windows
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" move around windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" move around tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Use vim built in buffers navigation faster
" nnoremap <Leader>ls :buffers<CR>:buffer<Space> - Now using bufexplorer instead


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc/Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
nnoremap <Leader>o :CtrlPMixed<CR>

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Airline
nnoremap <Leader>a :AirlineToggle<CR>
let g:airline_powerline_fonts = 1
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
let g:airline_theme = 'airlineish' 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
nnoremap <Leader>st :SyntasticToggle<CR>
nnoremap <Leader>sc :SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_html_checkers=['validator']
let g:syntastic_html_validator_api = 'https://validator.nu/'
set laststatus=2

" zen coding (aka emmet) finally is zen again
" https://coderwall.com/p/_uhrxw/using-tab-key-as-abbreviation-expander-on-emmet-vim
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
