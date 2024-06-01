
" Command to run CopilotChat
function! MyCustomFunction(...)
    " Check if the current buffer is a scratch buffer
    if &buftype == 'nofile'
        " Already in a scratch buffer, just run CopilotChat
        execute 'CopilotChat ' . join(a:000, ' ')
    else
        " Not in a scratch buffer, create one and run CopilotChat
        execute 'vsplit | enew | setlocal buftype=nofile bufhidden=hide noswapfile wrap linebreak nonu | CopilotChat ' . join(a:000, ' ')
    endif
endfunction
command! -nargs=* CPC call MyCustomFunction(<f-args>)

" disable mouse
set mouse=

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Settings for copilot
" Deactivate tab for completion, use <C-Space> instead
imap <silent><script><expr> <C-S> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = 1

" Some remaps for nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR> 

" adding a shortcut to redraw
nnoremap <C-m> :redraw!<CR>

" Adding a command to insert date faster
:command Date r!date

set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif

" This line makes vim invoke Latex-suite when a tex file is opened
filetype plugin on
filetype indent on
let g:tex_flavor='latex'
let g:Tex_FormatDependency_dvi = 'dvi,ps,pdf'

" jedi settings
let g:jedi#show_call_signatures = "2"
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0

" remap space bar as mapleader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

set breakindent
set number relativenumber
set linebreak 
set autoindent
set foldmethod=indent
" Fold using treesitter
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

set showcmd
" Set tabs from 8 spaces to 4 spaces
set tabstop=4 
set shiftwidth=4

" move around the splits with ctrl+[hjkl]
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" in order for tagbar to toggle bar
nnoremap <leader>t :TagbarToggle<CR>

" various settings for vundle
set nocompatible
filetype off

" NOTE: CopilotChat plugin is also installed, manually
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'majutsushi/tagbar'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'davidhalter/jedi-vim'
Plugin 'preservim/nerdtree'
Plugin 'wellle/targets.vim'
Plugin 'github/copilot.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'nvim-lua/plenary.nvim' " required by telescope
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'lukas-reineke/indent-blankline.nvim'
Plugin 'mechatroner/rainbow_csv'
call vundle#end()
filetype plugin indent on
