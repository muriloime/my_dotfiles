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


call vundle#end()
filetype plugin indent on
colorscheme railscasts
syntax on 
set shiftwidth=2
set tabstop=2
set expandtab
set number "show line numbers
se mouse+=a "allow to copy without line numbers

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" search with / faster 
set incsearch
set hlsearch

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

  
