let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=
set encoding=utf8
set foldmethod=indent
set hidden
set gdefault
set number
set backupcopy=yes
set iskeyword+=-

let mapleader = " "
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore'

nnoremap <Leader>feR :source ~/.config/nvim/init.vim<CR> 
nnoremap <Leader>fep :PlugInstall<CR>
nnoremap <Leader>feP :PlugClean<CR>
nnoremap <Leader>fed :edit ~/.config/nvim/init.vim<CR> 

nnoremap <Leader>bb :CtrlPBuffer<CR>
" nnoremap <Leader>fr :CtrlPMRUFiles<CR>
nnoremap <Leader>fr :History<CR>
"nnoremap <Leader>fD :call delete(expand('%'))<CR> | :bdelete!<CR>

nnoremap <Leader>pt :NERDTreeToggle<CR>
nnoremap <Leader>ptt :NERDTreeFind<CR>

nnoremap <Leader>w <C-w>
nnoremap <Leader>wd <C-w>c
nnoremap <Leader>wn <C-w>v<C-w>l

nnoremap <Leader>pf :Files<CR>

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :!git checkout<space>
nnoremap <Leader>gC :!git commit -m 
nnoremap <Leader>ga :!git add % 
nnoremap <Leader>gP :!git push
nnoremap <Leader>gf :!git fetch --all --prune<CR>
nnoremap <Leader>gF :!git pull<CR>
nnoremap <Leader>gl :GV --all<CR>


"nnoremap <Leader>cl :call NERDComment(0,"Toggle")<CR>
"vnoremap <Leader>cl :call NERDComment(0,"Toggle")<CR>

nnoremap <Leader>dr :!nvidia-docker-compose run
nnoremap <Leader>db :!nvidia-docker-compose build

nnoremap <Leader>tt :terminal<CR>
tnoremap <Esc> <C-\><C-n> "exit terminal with Esc
nnoremap <Leader>tr i<Up><CR><C-\><C-n>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"

"autocmd FileType python nnoremap <leader>bf :call yapf#YAPF()<CR>
nnoremap <Leader>bf gg=G

augroup python
    au!
    au FileType python setlocal equalprg=python3\ -m\ yapf\ --style=/home/toto/.config/yapf/style
augroup END

augroup yaml 
    function OnYAML()
      setlocal tabstop=2
      set shiftwidth=2 
      set expandtab 
    endfunction
    au!
    au FileType yaml call OnYAML()
augroup END

augroup javascriptlike
    function OnJsLike()
      setlocal foldmethod=syntax
      set tabstop=2 
      set shiftwidth=2 
      set expandtab 
      nnoremap <Leader>bf :Prettier<CR>
      autocmd BufWritePre <buffer> Prettier
    endfunction

    au!
    au FileType javascript,typescript,scss,json call OnJsLike()
augroup END

" Create file parent dir on write if they do not exist
augroup createDirOnSave
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

" Plugins
call plug#begin('~/.local/share/nvim/plugged')


Plug 'tpope/vim-sensible' " Reasonable defaults
Plug 'scrooloose/nerdtree' " Project tree
Plug 'tpope/vim-fugitive' " Git management
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'airblade/vim-gitgutter' " Git modifs in gutter
Plug 'tpope/vim-commentary' " Comment lines
Plug 'junegunn/gv.vim' " Commit log graph
Plug 'jremmen/vim-ripgrep' " Search regex in project
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy filename finder
Plug 'junegunn/fzf.vim'

" Python
Plug 'davidhalter/jedi-vim' " Python IDE integration
Plug 'zchee/deoplete-jedi'

" JS / Typescript
Plug 'pangloss/vim-javascript' 
Plug 'mxw/vim-jsx' 
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' } 
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" SCSS
Plug 'cakebaker/scss-syntax.vim'

" Theme
Plug 'morhetz/gruvbox' 

call plug#end()


" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

" vim-dev-icons
let g:airline_powerline_fonts = 1

" theme
colorscheme gruvbox
set background=dark    " Setting dark mode

" ctrlp
let g:ctrlp_working_path_mode = 0 " Stay in the original working dir
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_mruf_case_sensitive = 1

" deoplete
let g:deoplete#enable_at_startup = 1 

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_char = "."

" nerdtree
let NERDTreeIgnore = ['\.pyc$', 'node_modules']

" jedi-vim 
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>cd"
let g:jedi#goto_assignments_command = "<leader>cg"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>cn"
"let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>cr"

" vim-autoformat
let g:formatters_python = ['yapf']
let g:autoformat_verbosemode=1

" vim-ripgrep
let g:rg_highlight = 1

" neomake
call neomake#configure#automake('w')

" vim-jsx 
let g:jsx_ext_required = 0
let g:deoplete#num_processes = 1
