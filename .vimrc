set number

set mouse=a
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

filetype on
syntax enable
syntax on

let mapleader ="\<Space>"

" automatically downloads vim-plug to your machine if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins to install
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'  	" Browse the file system
Plug 'kien/ctrlp.vim'  		" CtrlP

" All of your Plugins must be added before the following line
call plug#end()

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'bubblegum'

" Ctrl-P
let g:ctrl_p_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'

nmap <leader>p :CtrlP<cr>  " enter file search mode

" Nerdtree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree

" -------Buffer Management---------
set hidden " Allow buffers to be hidden if you've modified a buffer

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Use arrow keys to navigate window splits
nnoremap <silent> <Right> :wincmd l <CR>
nnoremap <silent> <Left> :wincmd h <CR>
noremap <silent> <Up> :wincmd k <CR>
noremap <silent> <Down> :wincmd j <CR>
