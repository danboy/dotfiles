set hidden
set history=1000
set title

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
let python_highlight_all=1



syntax on
filetype on
filetype plugin on
filetype indent on
 
" Highlight search terms...
set hlsearch
set incsearch

" 2 spaces for indenting
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Spaces instead of tabs
set expandtab

set showmatch
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set undofile
set undodir=/tmp,~/.vim/.undo,~/tmp
set number

set nobackup
set noswapfile
set pastetoggle=<F2>
set dir=/tmp//,/var/tmp//,~/tmp//

cmap w!! w !sudo tee % >/dev/null
map <C-o> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>

call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'mileszs/ack.vim', { 'on': 'Ack' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'flazz/vim-colorschemes'
  Plug 'chriskempson/base16-vim'
  Plug 'moll/vim-node', { 'for': 'node'}
  Plug 'morhetz/gruvbox'
  Plug 'mhinz/vim-signify'
  Plug 'vim-syntastic/syntastic'
  Plug 'prettier/vim-prettier'
  Plug 'psf/black', { 'branch': 'stable' }
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'matze/vim-move'
  Plug 'mhinz/vim-startify'
  Plug 'lilydjwg/colorizer'
  Plug 'luochen1990/rainbow'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  Plug 'JamshedVesuna/vim-markdown-preview'
	Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'leafgarland/typescript-vim'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'eslint/eslint'
  Plug 'madox2/vim-ai', { 'do': './install.sh' }
  Plug 'jmcantrell/vim-virtualenv'
  Plug 'PieterjanMontens/vim-pipenv'

call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let &t_Co=256

set background=dark
colorscheme gruvbox

autocmd FileType php setlocal shiftwidth=4 sts=4 tabstop=4 expandtab
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
" Spell-check Markdown files and Git Commit Messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['jsxhint']
"let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let base16colorspace=256  " Access colors present in 256 colorspace

" Vim-signify settings
highlight SignColumn  ctermbg=black ctermfg=black
highlight DiffAdd     ctermbg=black ctermfg=green
highlight DiffDelete  ctermbg=black   ctermfg=red
highlight DiffChange  ctermbg=black  ctermfg=yellow
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_add               = '+'
let g:signify_sign_change            = '!'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '_'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

let g:codi#interpreters = {
                   \ 'javascript': {
                       \ 'bin': 'node',
                       \ 'prompt': '?> ',
                       \ },
                   \ }

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:codi#width = 80
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:rainbow_active = 1
let g:coc_global_extensions = ['coc-tsserver']
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
set noshowmode
