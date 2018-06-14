""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
let g:mapleader=","

set nocompatible      " Use vim defaults instead of 100% vi compatibily
set nu rnu            " Absolute + Relative number simutaneously
set ruler             " Show current cursor's positin (rows, cols)
set encoding=utf-8
set mouse=c           " Not allow cursor operation
set nowrap            " Not automatically wrap even textwidth is bigger than 0
set textwidth=0       " Disable autowrap

" Searching settings
set hlsearch          " Highlight searching results
set incsearch         " Goto the search place automatically
set ignorecase        " Case insensitive
set smartcase
highlight Search cterm=NONE ctermfg=black ctermbg=gray
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

" Selected Item color for Omni and YouCompleteMe.
highlight PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE

" If enable autoindent, the paste text will be indented and not neat.
set pastetoggle=<F2>

" Important, <C-c> abort autocommand, but <Esc> does not.
" If you use YouCompleteMe, <C-c> will abort the autosuggestion.
" Why use double <Esc>? Avoid the delay.
inoremap <silent> <C-c> <Esc><Esc>

" Ignore directories, take effect on Ctrlp plugin
set wildignore+=*/.git/*,*/build/*,*/CMakeFiles/*

" 300ms for combined key maps(default is 1000ms)
" set timeoutlen=300

" set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" New lines inherit the indentation of previous line
set autoindent      " Hit enter in insert mode or with `O` or `o` in normal mode
set smartindent     " Reacts based on syntax/style of the code
set expandtab       " Convert tabs to whitespace
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Theme settings
set background=dark
set t_Co=256      " Use with tmux together

" Folding settings, for help `:h fold`
set nofoldenable        " Not fold when opening a new file
set foldmethod=indent   " =syntax will affect performance, don't do that
set foldlevelstart=20
set foldnestmax=3
" Folding toggle
nnoremap <Space> za

" Highlight 80th line
highlight ColorColumn ctermbg=239
set colorcolumn=81

" Switch between closing punctuation
nnoremap <tab> %

" Save current file, NOTE: other files don't take effect.
nnoremap <Leader>s :update<CR>
" Close window quickly
nnoremap <Leader>x ZZ<CR>

" Show the trail whitespace
set list listchars=tab:\ \ ,trail:•

" Show less output message
" set shortmess=a

" Reload ~/.vimrc without quit vim. (Global Source Vim confiure file)
nnoremap gsv :source $MYVIMRC<CR>

" Remap Q to nop, not entering Ex mode.
nnoremap Q <nop>

" Write to protected files forcely.
cmap w!! w !sudo tee % >/dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs settings
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>6 6gt<CR>
nnoremap <Leader>7 7gt<CR>
nnoremap <Leader>8 8gt<CR>
nnoremap <Leader>9 9gt<CR>

" Moving between tabs
" J and K keys confict with NERDTree(J goto first child, K goto last child).
nnoremap J :tabp<CR>
nnoremap K :tabn<CR>

nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>th :-tabmove<CR>
nnoremap <Leader>tl :+tabmove<CR>
nnoremap <Leader>tk :0tabmove<CR>
nnoremap <Leader>tj :$tabmove<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Performance options
" Limit the files searched for auto-completes
set complete-=i
" Don't update screen during macro and script execution
set lazyredraw

augroup performance
  autocmd!
  " Resolve performance problems (memory leak).
  autocmd BufWinLeave * call clearmatches()
augroup performance

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto complete when inserting comments in c,cpp.
set formatoptions+=r

" Comment for c, cpp quickly (uncomment using <Leader>cu in nerdcommenter).
" It can be very uesful when you set`foldmethod=indent`.
" `\s` whitespace, `\S` non-whitespace, `:noh<CR>` not highlight the searching.
" `\%V` only highlight the searched content in visual mode.
vnoremap <silent> // :s:\%V\(\S\)://\0<CR>:noh<CR>

" Trim right whitespaces in visual mode.
vnoremap <silent> <Leader><space> :s/\s\+$//e<CR>:noh<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show directory tree and locate based current file
nnoremap <silent> <Leader>w :NERDTreeToggle<CR><C-w>=<CR>
nnoremap <silent> <Leader>l :NERDTreeFind<CR><C-w>=<CR>

let g:NERDTreeIgnore = [
  \ '\.o$[[file]]', '\.out$[[file]]', '\.swp$[[file]]',
  \ '\.bin$[[dir]]', '\.git$[[dir]]',
  \ ]
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode  = 2

" Unmap the J and K key, used for moving between tabs
let g:NERDTreeMapJumpLastChild = ''
let g:NERDTreeMapJumpFirstChild = ''

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
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rw'
" open window as a new tab
let g:ctrlp_split_window = 0

" for help: `:h ctrlp_prompt_mappings`
let g:ctrlp_prompt_mappings = {
  \ 'PrtCurLeft()':        ['<left>'],
  \ 'PrtCurRight()':       ['<right>'],
  \ 'ToggleType(1)':       ['<c-h>'],
  \ 'ToggleType(-1)':      ['<c-l>'],
  \ }

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(dir|git)$',
  \ 'file': '\v\.(a|bin|cmake|make|o|out|so|swp)$'
  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = "/usr/local/ctags/bin/ctags"
nnoremap <silent> ;j :TagbarOpen fj<CR>
nnoremap <silent> ;t :TagbarToggle<CR>

" 2 relative line number, 0 don't show linenubmer, 1 absolute linenumbers
let g:tagbar_show_linenumbers = 2

" tags for ctags
set tags=./tags;,tags


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#whitespace#enables = 0
let g:airline#extensions#wordcount#enabled = 0

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
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custome airline theme
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'z' ]
  \ ]

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


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
" Autocomplete and set tab width based on file type
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

  " Auto-completes for closing characters in c, cpp.
  autocmd FileType c,cpp inoremap <buffer><silent> "      ""<left>
  autocmd FileType c,cpp inoremap <buffer><silent> ";     "";<left><left>
  autocmd FileType c,cpp inoremap <buffer><silent> (;     ();<left><left>
  autocmd FileType c,cpp inoremap <buffer><silent> {;<CR> {<CR>};<ESC>O

  " Run current script and read output to current file.
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

nnoremap ;f :LeaderfFunction<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" youcompleteme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
let g:ycm_complete_in_comments=1
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

" Debug for youcompleteme
" let g:ycm_keep_logfiles = 1
" let g:ycm_log_level = 'debug'

let g:ycm_semantic_triggers = {
  \ 'c,cpp' : ['re!\w{2}'],
  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ultisnips (autocomplete some snippets)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"

" Don't quit insert mode, or the trigger won't take effect.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fswitch (swtich between .cpp and .h files)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>go :FSHere<CR>
nnoremap <silent> <Leader>gh :FSSplitLeft<CR>
nnoremap <silent> <Leader>gl :FSSplitRight<CR>
nnoremap <silent> <Leader>gj :FSSplitBelow<CR>
nnoremap <silent< <Leader>gk :FSSplitAbove<CR>


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

  " NOTE: vim-fugitive conficts with vim-airline.
  " Description: cursor operation lag when saving file.
  " Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'edkolev/tmuxline.vim'

  " Fuzzy search files, buffers, MRU
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'tpope/vim-surround'
  Plug 'Valloric/YouCompleteMe'

  Plug 'SirVer/ultisnips'
  Plug 'derekwyatt/vim-fswitch'

call plug#end()
