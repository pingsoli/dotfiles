""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
let g:mapleader=","

" Use vim defaults instead of 100% vi compatibily
set nocompatible
" Absolute + Relative number simutaneously
set nu rnu
" Show current cursor's positin (rows, cols)
set ruler
set encoding=utf-8
set nowrap
set mouse=c

" Searching and match settings
set hlsearch incsearch
set ignorecase smartcase
set showmatch
highlight Search cterm=NONE ctermfg=black ctermbg=gray
nnoremap <silent> <Leader><Space> :nohlsearch<CR>


" Auto complete when inserting comments in c and cpp
set formatoptions+=r

" Selected Item color for Omni and YouCompleteMe
highlight PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE

" If enable autoindent, the paste text will be indented and not neat.
set pastetoggle=<F2>

" Important, <C-c> does not trigger autocommand, but <Esc> does.
" If you use YouCompleteMe, use <Esc> instead <C-c>.
" Why use double <Esc>? Avoid the delay.
inoremap <C-c> <Esc><Esc>

" Ignore directories
set wildignore+=*/.git/*,*/build/*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Performance options

" Limit the files searched for auto-completes
set complete-=i
" Don't update screen during macro and script execution
set lazyredraw

augroup performance
  autocmd!
  " Resolve performance problems (memory leak)
  autocmd BufWinLeave * call clearmatches()
augroup performance

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" New lines inherit the indentation of previous line
set autoindent
set expandtab    " Convert tabs to whitespace
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Theme settings
set background=dark
set t_Co=256

" Fold code settigs, ':h fold' for more detail.
set nofoldenable " Not fold when opening a new file
set foldmethod=indent
set foldlevelstart=20
set foldnestmax=3
nnoremap <Space> za

" Goto closing character
nnoremap <tab> %

" Cursor moving in insert mode
inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-J> <Down>
inoremap <C-K> <Up>

" Moving between windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Change windows resize default value
nnoremap <C-w>< <C-w>5<<CR>
nnoremap <C-w>> <C-w>5><CR>
nnoremap <C-w>+ <C-w>5+<CR>
nnoremap <C-w>- <C-w>5-<CR>

" Save current file, NOTE: other files not work
nnoremap <Leader>s :update<CR>
" Close window
nnoremap <Leader>x ZZ<CR>

" Highlight 80th line
highlight ColorColumn ctermbg=239
set colorcolumn=81

" Show the trail whitespace
set list listchars=tab:\ \ ,trail:•

" Show less output message
set cmdheight=1
set shortmess=a

" Reload ~/.vimrc without quit. (global source ~/.vimrc)
nnoremap gsv :so $MYVIMRC<CR>

" Remap Q to nop, not enter Ex mode
nnoremap Q <nop>

" Useful when open protected file
cmap w!! w !sudo tee % >/dev/null


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find current file and switch to the directory
nnoremap <silent> <Leader>w :NERDTreeToggle<CR>
nnoremap <silent> <Leader>l :NERDTreeFind<CR>

let g:NERDTreeIgnore = [
  \ '\.o$[[file]]', '\.out$[[file]]', '\.swp$[[file]]', '\.png$[[file]]',
  \ '\.bin$[[dir]]', '\.git$[[dir]]' 
  \ ]
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode  = 2

" NERDTree use relative numbers
let NERDTreeShowLineNumbers=1
augroup nerdtree
  autocmd!
  autocmd FileType nerdtree setlocal relativenumber
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after commet delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'rw'
"" open window as a new tab
"let g:ctrlp_split_window = 0
"
"" Ctrlp ignore build and CMakeFiles directories
"set wildignore+=*/build/*,*/CMakeFiles/*
"
"let g:ctrlp_custom_ignore = {
"  \ 'dir': '\v[\/]\.(dir|git)$',
"  \ 'file': '\v\.(a|bin|cmake|make|o|out|so|swp)$'
"  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = "/usr/local/ctags/bin/ctags"
nnoremap <silent> <Leader>j :TagbarOpen fj<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" 2 relative line number, 0 don't show linenubmer, 1 absolute linenumbers
let g:tagbar_show_linenumbers = 2

" tags for ctags
set tags=./tags;,tags


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#whitespace#enables = 0

" tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 0
" show tab number
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#show_splits = 0

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" the settings like the following tabs operation
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>6 6gt<CR>
nnoremap <Leader>7 7gt<CR>
nnoremap <Leader>8 8gt<CR>
nnoremap <Leader>9 9gt<CR>

" Move to previous and next tabs
nnoremap J :tabp<CR>
nnoremap K :tabn<CR>

nnoremap <Leader>ct :tabclose<CR>

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'z', 'error', 'warning' ]
  \ ]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight cpp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight                  = 1
let g:cpp_member_variable_highlight              = 1
let g:cpp_class_decl_highlight                   = 1
let g:cpp_experimental_simple_template_highlight = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmuxline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxline_preset = {
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W', '#F'],
  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" program based on file type
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> (     ()<left>
inoremap <silent> {     {}<left>
inoremap <silent> {<CR> {<CR>}<ESC>O
inoremap <silent> [     []<left>

augroup filetype_indent
  autocmd!
  " Edit Makefile using tabs substitute space, Indent based on filetype
  autocmd FileType make       setlocal noexpandtab
  autocmd FileType make       setlocal list listchars=tab:>-
  autocmd FileType html       setlocal shiftwidth=4 tabstop=4
  autocmd FileType java       setlocal shiftwidth=4 tabstop=4
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType python     setlocal shiftwidth=4 tabstop=4

  " Shortcuts only for cpp, auto-complete closing characters
  autocmd FileType c,cpp inoremap <buffer><silent> "      ""<left>
  autocmd FileType c,cpp inoremap <buffer><silent> ";     "";<left><left>
  autocmd FileType c,cpp inoremap <buffer><silent> (;     ();<left><left>
  autocmd FileType c,cpp inoremap <buffer><silent> {;<CR> {<CR>};<ESC>O

  " Run current script and read output to vim
  autocmd FileType python nnoremap <buffer><silent> ,py :r! python %
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

command! TrimWhitespace call TrimWhitespace()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leaderf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_WorkingDirectoryMode = 'Ac'

nnoremap <Leader>ff :LeaderfFunction<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" youcompleteme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
let g:ycm_complete_in_comments=1
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

" Debug for youcompleteme
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

let g:ycm_semantic_triggers = {
  \ 'c,cpp' : ['re!\w{2}'],
  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ultisnips (autocomplete some snippets)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"

" Don't quit insert mode, or the trigger won't take effect.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fswitch (swtich between .cpp and .h files)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>gg :FSHere<CR>
nnoremap <silent> <Leader>gl :FSSplitLeft<CR>
nnoremap <silent> <Leader>gr :FSSplitRight<CR>
nnoremap <silent> <Leader>gb :FSSplitBelow<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug (vim plugins manager)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug plugin manager downloader
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/vim-easy-align'
  Plug 'majutsushi/tagbar'

  " NOTE: vim-fugitive conficts with vim-airline
"  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'edkolev/tmuxline.vim'

  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  Plug 'tpope/vim-surround'
  Plug 'Valloric/YouCompleteMe'

  Plug 'SirVer/ultisnips'
  Plug 'derekwyatt/vim-fswitch'

call plug#end()
