" Use the best stuff
if &compatible
  set nocompatible
endif

" dein setup

set runtimepath+=~/.config/nvim/cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.config/nvim/cache/dein')
  call dein#begin('~/.config/nvim/cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add("altercation/vim-colors-solarized")

  call dein#add("vim-airline/vim-airline")
  call dein#add("vim-airline/vim-airline-themes")

  call dein#add("jeetsukumaran/vim-buffergator")
  call dein#add("ctrlpvim/ctrlp.vim")

  call dein#add("tpope/vim-fugitive")
  call dein#add("scrooloose/nerdcommenter")

  call dein#add("easymotion/vim-easymotion")
  call dein#add("tpope/vim-surround")
  call dein#add("tpope/vim-repeat")

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})

  "call dein#add('neoclide/coc.nvim', {'build': './install.sh nightly'})

  "let g:deoplete#enable_at_startup = 1

  call dein#add("fatih/vim-go")
  call dein#add("elzr/vim-json")
  call dein#add("pearofducks/ansible-vim")
  call dein#add("avakhov/vim-yaml")
  call dein#add("scrooloose/nerdtree")
  call dein#add("janko-m/vim-test")
  call dein#add("majutsushi/tagbar")
  call dein#add("yuezk/vim-js")
  call dein#add("maxmellon/vim-jsx-pretty")

  " Color schemes:
  call dein#add("freeo/vim-kalisi")
  call dein#add("mhartington/oceanic-next")
  call dein#add("rafi/awesome-vim-colorschemes")

  " Javascript:
  call dein#add("MaxMEllon/vim-jsx-pretty")

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


"if $TERM == "xterm-256color" || $TERM == "screen-256color" ||
"   \ $TERM == "screen" || $COLORTERM == "gnome-terminal"
"  set t_Co=256
"endif


let g:solarized_termcolors=256
"let g:solarized_termtrans=1 " makes the background not change color
set background=dark
let g:seoul256_background = 255
colorscheme PaperColor
command! Light let g:seoul256_background = 256 | colorscheme seoul256
command! Medium let g:seoul256_background = 253 | colorscheme seoul256
command! Dark let g:seoul256_background = 235 | colorscheme seoul256
let g:airline_theme='bubblegum'

let g:airline_solarized_normal_green = 1

" colorize columns past 80
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

" highlight bad whitespace
"set list
"set listchars=tab:,.,trail:.,extends:#,nbsp:.
set nowrap

let g:airline#extensions#whitespace#enabled = 0


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
\ }

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" \e to open a file relative to the current file
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>nt :NERDTreeToggle<CR>

nmap <silent> <leader>q :nohlsearch<CR>
nmap <silent> <leader>l :setlocal number!<CR>

" Repeated indent in visual mode:
vnoremap < <gv
vnoremap > >gv

"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"
" Don't map any tabs, I'll do it later
"let g:UltiSnipsExpandTrigger = '<NOP>'
"let g:UltiSnipsJumpForwardTrigger = '<NOP>'
"let g:UltiSnipsJumpBackwardTrigger = '<NOP>'
" Don't unmap my mappings
"let g:UltiSnipsMappingsToIgnore = [ "SmartTab", "SmartShiftTab" ]

" Switch split windows quicker.
nmap <C-J> <C-w>j
nmap <C-K> <C-w>k
nmap <C-H> <C-w>h
nmap <C-L> <C-w>l

" vim-go
nmap <leader>gb :GoBuild<CR>
nmap <leader>gt :GoTest<CR>
nmap <leader>gtf :GoTestFunc<CR>
nmap <leader>gtc :GoTestCompile<CR>
nmap <leader>gv :GoVet<CR>
nmap <leader>gi :GoInfo<CR>

" fugitive
nmap <leader>vg :Ggrep
nmap <leader>vs :Gstatus<CR>
nmap <leader>vb :Gblame<CR>


nmap <leader>ma :set mouse=a<CR>
nmap <leader>mr :set mouse=r<CR>
map <F5> \be
map <F12> :set nu!<CR>

" Don't wrap lines in the quickfix window:
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

nmap ,S :source ~/.config/nvim/init.vim

" Mappings for vim-test plugin:
"nmap <silent> <leader>t :TestNearest<CR>
"nmap <silent> <leader>T :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>

"au FileType go nmap <leader>T :GoTest<CR>
"au FileType go nmap <leader>t :GoTestFunc<CR>


" Always show line numbers:
set nu

nnoremap <silent> <leader>] :cnext<CR>
nnoremap <silent> <leader>[ :cprevious<CR>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" strip trailing whitespace from files on save
" Ignore the quickfix window
autocmd FileType qf let b:noStripWhitespace=1
autocmd FileType * autocmd BufWritePre <buffer> call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  if exists('b:noStripWhitespace')
    return
  endif

  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" ctrlp configuration {
let g:ctrlp_working_path_mode = 2
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$'
\ }

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
\ }


map <leader>r :CtrlP<CR>
"} end ctrlp config

set hidden     " allow switching buffers without saving
set mouse=r

" When searching, ignore case unless the search pattern includes uppercase
set ignorecase
set smartcase

set autoread
set wrap
set completeopt+=noinsert
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" let g:deoplete#sources#go#use_cache = 1
"let g:deoplete#sources#go#json_directory = '/path/to/data_dir'

" close the preview window up top when completion is done
autocmd CompleteDone * pclose!

autocmd BufWritePre *.tf call terraform#fmt()

map <F5> \be

" Control-S to save in both insert and nav modes:
inoremap <c-s> <Esc>:w<CR>
nnoremap <silent> <C-S> :<C-u>w<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
