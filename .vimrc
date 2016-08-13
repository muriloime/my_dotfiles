"execute pathogen#infect()
"
"
set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
"Powerline alternative
Plugin 'vim-airline/vim-airline'

Plugin 'jpo/vim-railscasts-theme'

Plugin 'ervandew/supertab'
"Surround words lines and blocks with { [ "' EVERYTHING
Plugin 'tpope/vim-surround.git'
"use :CtrlP to search for files
Plugin 'ctrlpvim/ctrlp.vim'

"rails plugin 
Plugin 'tpope/vim-rails'
"bundler for rails 
Plugin 'tpope/vim-bundler'
"rspec 
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rake'

"ack to search for patterns
Plugin 'mileszs/ack.vim'


"pluralize, etc 
Plugin 'tpope/vim-abolish'


"plugins to facilitate motions
Plugin 'vim-scripts/argtextobj.vim'

"git 
Plugin 'gregsexton/gitv'

"tmux integration 
Plugin 'christoomey/vim-tmux-navigator'


call vundle#end()
filetype plugin indent on

colorscheme railscasts
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"###################
"# general 
"###################

syntax on 
set shiftwidth=2
set tabstop=2
set expandtab
se mouse+=a "allow to copy without line numbers

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬
set lcs=tab:>-,eol:<

" search with / faster 
set incsearch
set hlsearch

set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter

set magic " Set magic on, for regex


set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time

" Numbers
set number
"set numberwidth=5
set relativenumber 

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
 
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>


" Switch between the last two files
nnoremap <leader><leader> <c-^>

"###################
"# Plugin setup 
"###################

"NERDTree configurations 
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

"mappings for rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('rb', 'Magenta', 'none', '#ff00ff', '#151515')

"# wildignore setting ( ctrlp, etc) 
set wildignore+=*/tmp/*,*/vendor/*


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

map <C-H> :call WinMove('h')<cr>
map <C-J> :call WinMove('j')<cr>
map <C-K> :call WinMove('k')<cr>
map <C-L> :call WinMove('l')<cr>
"Window movement shortcuts
" move to the window in the direction shown, or create a new windowk

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

