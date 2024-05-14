syntax on

" Sources
" source $HOME/.config/nvim/plug-config/coc.vim

" ------------------------------------------------------------
"  Plug
" ------------------------------------------------------------
call plug#begin('~/local/share/nvim/plugged')

    " tpope da goat
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    " add html closing tags
    Plug 'alvan/vim-closetag'

    " fzf
    Plug 'junegunn/fzf.vim'

    " code completion
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " snippets
    Plug 'SirVer/ultisnips'

    " enhance syntax highlighting
    Plug 'sheerun/vim-polyglot'

    " colorizes hex codes
    Plug 'lilydjwg/colorizer'

    " autocomplete plugin; may be useful someday?
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " syntax checker
    Plug 'scrooloose/syntastic'

    " commenter plugin adds <leader>c shortcuts for commenting
    " see https://github.com/preservim/nerdcommenter
    Plug 'preservim/nerdcommenter'
    " tree file manager
    Plug 'preservim/nerdtree'

    " Pair brackets, parens, quotes, etc.
    Plug 'jiangmiao/auto-pairs'

    " Markdown tables
    Plug 'dhruvasagar/vim-table-mode'

    " Automatically clear search highlights after cursor movement
    Plug 'haya14busa/is.vim' " TODO: replace with native vim controls to preserve smartcase

    " Open autocomplete automatically
    " Plug 'vim-scripts/AutoComplPop'

    " Code Snippets; utlisnips is engine, vim-snippets contains snippets
    " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " Themes
    Plug 'dracula/vim',{'as':'dracula'}
    Plug 'arcticicestudio/nord-vim'
    Plug 'stillwwater/vim-nebula'
    Plug 'yuttie/hydrangea-vim'
    Plug 'morhetz/gruvbox'

    " lightline status line
    Plug 'itchyny/lightline.vim'

call plug#end()

" man page syntax highlighting
runtime! ftplugin/man.vim

" ------------------------------------------------------------
"  Appearance
" ------------------------------------------------------------

"  lightline settings
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

function! LightlineFilename()
    let filename = expand('%:f') !=# '' ? expand('%:f') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction

" colorscheme
colorscheme dracula

" ------------------------------------------------------------
"  Variables
" ------------------------------------------------------------
set complete+=kspell
set completeopt=menuone,longest
set expandtab
set formatoptions-=cro
set guifont=mononoki\Nerd\ Font
set incsearch
set mouse=a
set noerrorbells
set nojs
set noshowmode
set noswapfile
set nowrap
set number 
set path+=**
set relativenumber
set shiftwidth=2
set shortmess+=c
set smartindent
set smartcase
set tabstop=2 softtabstop=2
set termguicolors
set undodir=~/.config/nvim/undodir
set undofile

" Set python3 source executable
let g:python3_host_prog="/usr/bin/python3"

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
imap <c-m> <nop>
let g:UltiSnipsJumpForwardTrigger="<c-m>"
imap <c-k> <nop>
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" ------------------------------------------------------------
"  Keybinds
" ------------------------------------------------------------

" Leader bindings
noremap <Space> <Nop>
let mapleader=" "
" write and source
nnoremap <Leader>w :w<CR>:source %<CR>

" paste emdash
nnoremap <Leader>- a—<ESC>

" open nerdtree
nnoremap <Leader>n :NERDTree<CR>

" window splits
nnoremap <Leader>sh :vsp<CR>
nnoremap <Leader>sj :sp<CR><C-w>j
nnoremap <Leader>sk :sp<CR>
nnoremap <Leader>sl :vsp<CR><C-w>l

" resize splits
nnoremap <Leader>H <C-w>2<
nnoremap <Leader>J <C-w>+
nnoremap <Leader>K <C-w>-
nnoremap <Leader>L <C-w>2>
nnoremap <Leader>= <C-w>=

" split nav
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Search for selected text
vnoremap <Leader>/ y/\V<C-R>=escape(@",'/\')<CR><CR>

" Insert completion menu selection with return
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"

" Call decrement function
nnoremap <Leader>D :source /home/alana/.config/nvim/decrement.vim<CR>

" Makes Y copy to end of line
noremap Y y$

" center on half screen movements
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" ------------------------------------------------------------
"  Other
" ------------------------------------------------------------
" Allows nvim to use alacritty background
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" Autosave/load folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" Filetype specific commands
autocmd BufNewFile,BufRead *.txt set wrap lbr
autocmd BufNewFile,BufRead *.txt set breakindent
autocmd BufNewFile,BufRead *.txt set spell
autocmd BufNewFile,BufRead *.txt let &showbreak=' '
autocmd BufNewFile,BufRead *.html set wrap lbr
autocmd BufNewFile,BufRead *.html set spell
autocmd BufNewFile,BufRead *.html set breakindent
autocmd BufNewFile,BufRead *.html let &showbreak=' '
autocmd BufNewFile,BufRead *.md set wrap lbr
autocmd BufNewFile,BufRead *.md set breakindent
autocmd BufNewFile,BufRead *.md set spell
autocmd BufNewFile,BufRead *.md let &showbreak=' '
autocmd BufNewFile,BufRead *.srt set spell

