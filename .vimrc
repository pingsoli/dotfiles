"{{{ general settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Basic settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Autoindent based on filetype.
  filetype plugin indent on
  let g:mapleader=","

  set nocompatible      " Use vim defaults instead of 100% vi compatibily
  set nu rnu            " Absolute + Relative number simutaneously
  set ruler             " Show current cursor's positin (rows, cols)
  set encoding=utf-8
  set mouse=c           " Not allow cursor operation
  set nowrap            " Not automatically wrap even textwidth is bigger than 0
  set textwidth=0       " Disable autowrap

  " Show the trail whitespace
  set list listchars=tab:\ \ ,trail:•

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Indent settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " New lines inherit the indentation of previous line
  set autoindent      " Hit enter in insert mode or `O` or `o` in normal mode
  set smartindent     " Reacts based on syntax/style of the code
  set expandtab       " Convert tabs to whitespace
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2

  augroup indent_settings
    autocmd!
    " Edit Makefile using tabs substitute space, Indent based on filetype
    autocmd FileType make       setlocal noexpandtab
    autocmd FileType make       setlocal list listchars=tab:>-
    autocmd FileType html       setlocal shiftwidth=4 tabstop=4
    autocmd FileType java       setlocal shiftwidth=4 tabstop=4
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType python     setlocal shiftwidth=4 tabstop=4
  augroup END

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Theme settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set background=dark
  set t_Co=256            " Work with tmux together

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Folding settings, for help `:h fold`
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " za - fold toggle.
  " zc - close one fold under the cursor.
  " zC - close all folds under the cursor.
  " zo - open one fold under the cursor.
  " zO - open all folds under the cursor.
  " zR - open all folds.
  " zM - close all folds.
  " [z - move to start of the open fold.
  " ]z - move to end of the open fold.

  set nofoldenable        " Not fold when opening a new file
  set foldmethod=indent   " =syntax will affect performance
  set foldlevelstart=20
  set foldnestmax=3
  nnoremap <Space> za

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Highlight settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Selected Item color for Omni and YouCompleteMe.
  highlight PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE
  " Highlight 80th line
  highlight ColorColumn ctermbg=239
  set colorcolumn=81

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Search settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set hlsearch          " Highlight searching results
  set incsearch         " Goto the search place automatically
  set ignorecase        " Case insensitive
  set smartcase
  highlight Search cterm=NONE ctermfg=black ctermbg=gray
  nnoremap <silent> <Leader><Space> :nohlsearch<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Window settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Tab settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Goto nth tab (1-9th)
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
  " Remap J and K keys to work together with NERDTree.
  " J and K keys doesn't work within NERDTree(J/K goto first/last child).
  " J - Move to previous tab
  " K - Move to next tab
  nnoremap J :tabp<CR>
  nnoremap K :tabn<CR>

  " Opening and closing tabs
  nnoremap <Leader>tc :tabclose<CR>
  nnoremap <Leader>to :tabonly<CR>
  nnoremap <Leader>tn :tabnew<CR>

  " Move current tab page to left
  nnoremap <Leader>th :-tabmove<CR>
  " Move current tab page to right
  nnoremap <Leader>tl :+tabmove<CR>
  " Move current tab page to beginning of the tab list
  nnoremap <Leader>tk :0tabmove<CR>
  " Move current tab page to last
  nnoremap <Leader>tj :$tabmove<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Performance options
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Limit the files searched for auto-completes, for help: `h 'complete'`
  set complete-=i
  " Don't update screen during macro and script execution
  set lazyredraw

  augroup performance
    autocmd!
    " Resolve performance problems (memory leak).
    autocmd BufWinLeave * call clearmatches()
  augroup performance

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Autocomplete
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Auto complete when inserting comments in c,cpp.
  set formatoptions+=r

  inoremap <silent> (     ()<left>
  inoremap <silent> {     {}<left>
  inoremap <silent> {<CR> {<CR>}<ESC>O
  inoremap <silent> [     []<left>

  augroup autocompletion
    autocmd!
    " Auto-completes for closing characters in c, cpp.
    autocmd FileType c,cpp inoremap <buffer><silent> "      ""<left>
    autocmd FileType c,cpp inoremap <buffer><silent> ";     "";<left><left>
    autocmd FileType c,cpp inoremap <buffer><silent> (;     ();<left><left>
    autocmd FileType c,cpp inoremap <buffer><silent> {;<CR> {<CR>};<ESC>O
  augroup END

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Misc settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " If enable autoindent, the paste text will be indented and not neat.
  set pastetoggle=<F2>

  " IMPORTANT, <C-c> abort autocommand, but <Esc> does not.
  " If you use YouCompleteMe, <C-c> will abort the autosuggestion.
  " Why use double <Esc>? Avoid the delay.
  inoremap <silent> <C-c> <Esc><Esc>

  " Ignore directories
  set wildignore+=*/.git/*,*/CMakeFiles/*
  set wildignore+=*.o,*.swp

  " Switch between closing punctuation
  nnoremap <tab> %

  " Save current file, NOTE: won't affect other files.
  nnoremap <Leader>s :update<CR>
  " Close window quickly (save and quit)
  nnoremap <Leader>x ZZ<CR>

  " Reload ~/.vimrc without quit vim. (Global Source Vim confiure file)
  nnoremap gsv :source $MYVIMRC<CR>

  " Remap Q to nop, not entering Ex mode.
  nnoremap Q <nop>

  " Write to protected files forcely.
  cmap w!! w !sudo tee % >/dev/null

  " Comment for c, cpp quickly (uncomment using <Leader>cu in nerdcommenter).
  " It will be very uesful when you set `foldmethod=indent`.
  " `\s` whitespace, `\S` non-whitespace, `:noh<CR>` non-highlight.
  " `\%V` only highlight the searched content in visual mode.
  vnoremap <silent> // :s:\%V\(\S\)://\0<CR>:noh<CR>

  " Trim right whitespaces in visual mode.
  vnoremap <silent> <Leader><space> :s/\s\+$//e<CR>:noh<CR>

  augroup python_settings
    autocmd!
    " Execute current python file and read output to current location.
    autocmd FileType python nnoremap <buffer><silent> ,py :r! python %
  augroup END
"}}} --- general settings

"{{{ vim-plug (vim plugins manager, better than Vundle)
  " Check vim-plug whether installed properly.
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

    " Fuzzy search files, buffers, MRU, functions. leaderf is faster a lot than
    " ctrlp in big project.
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    " Plug 'ctrlpvim/ctrlp.vim'

    Plug 'tpope/vim-surround'
    Plug 'Valloric/YouCompleteMe'

    Plug 'SirVer/ultisnips'
    Plug 'derekwyatt/vim-fswitch'

    " Search word in whole project (work like ack.vim and :vimgrep)
    Plug 'easymotion/vim-easymotion'
    Plug 'rking/ag.vim'

  call plug#end()
"}}} --- vim-plug

"{{{ nerdtree
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
"}}} --- nerdtree

"{{{ nerdcommenter (quick commnet)
  " Add spaces after commet delimiters by default
  let g:NERDSpaceDelims = 1
  let g:NERDCompactSexyComs = 1

  let g:NERDCommentEmptyLines = 1
  let g:NERDTrimTrailingWhitespace = 1
  let g:NERDDefaultAlign = 'left'
"}}} --- nerdcommenter

"{{{ tagbar (switch between declaration and implementation)
  let g:tagbar_ctags_bin = "/usr/local/ctags/bin/ctags"
  nnoremap <silent> ;j :TagbarOpen fj<CR>
  nnoremap <silent> ;t :TagbarToggle<CR>

  " 2 relative line number, 0 don't show linenubmer, 1 absolute linenumbers
  let g:tagbar_show_linenumbers = 2

  " tags for ctags
  set tags=./tags;,tags
"}}} --- tagbar

"{{{ airline (beauty status bar in vim)
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
"}}} --- vim-airline

"{{{ highlight for cpp syntax
  let g:cpp_class_scope_highlight                  = 1
  let g:cpp_member_variable_highlight              = 1
  let g:cpp_class_decl_highlight                   = 1
  let g:cpp_experimental_simple_template_highlight = 1
"}}} --- highlight-cpp

"{{{ tmuxline (beauty status bar)
  let g:tmuxline_preset = {
    \'win'  : ['#I', '#W'],
    \'cwin' : ['#I', '#W', '#F'],
    \ }
"}}} --- tmuxline

"{{{ vim-easy-align
  " gaip + <space>   left alignment according to the first whitespace
  " gaip + 2<space>  left alignment according to the 2th whitespace
  " gaip + *<space>  left alignment according to the all whitespaces
  " gaip + -<space>  right alignment according to the first whitespace
  " gaip + <enter><enter>2<space> center alignment
  " gaip + <enter>*<space>        right alignment

  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
"}}} --- vim-easy-align

"{{{ leaderf (fuzzy search buffers, files, MRU, funciton declaration)
  " <leader>f   find files in the project
  " <leader>b   find buffers in the project
  " ;f          find function in current file (for cpp)

  let g:Lf_RootMarkers = ['.git']
  let g:Lf_WorkingDirectoryMode = 'Ac'
  let g:Lf_DefaultMode = 'FullPath'

  " refresh leaderf when startup everytime.
  " <F5> to refresh when entering LeaderF mannually.
  let g:Lf_UseVersionControlTool = 0
  let g:Lf_UseCache = 0
  let g:Lf_UseMemoryCache = 0

  let g:Lf_WildIgnore = {
    \ 'dir': ['.git', 'build'],
    \ 'file': ['*.sw?','~$*','*.bak','*.o','*.so','*.py[co]']
    \ }

  nnoremap ;f :LeaderfFunction<CR>
"}}} --- leaderf

"{{{ youcompleteme (autocomplete)
  " <c-y>  choose the item ("yes" to confirm)
  " <c-j>  next item
  " <c-k>  previous item

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
"}}} --- youcompleteme

"{{{ ultisnips (autocomplete some snippets)
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

  " Trigger configuration. Do not use <tab> if you use YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<c-space>"

  " Don't quit insert mode, or the trigger won't take effect.
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"}}} --- ultisnips

"{{{ fswitch (swtich between .cpp and .h files)
  nnoremap <silent> <Leader>go :FSHere<CR>
  nnoremap <silent> <Leader>gh :FSSplitLeft<CR>
  nnoremap <silent> <Leader>gl :FSSplitRight<CR>
  nnoremap <silent> <Leader>gj :FSSplitBelow<CR>
  nnoremap <silent< <Leader>gk :FSSplitAbove<CR>
"}}} --- fswitch

"{{{ ag (search context in the whole project)
  " ag command usage:
  "
  " ag foo
  "   search 'foo' in current directory recursively(the output info include
  "   filename and context)
  "
  " ag -i -o foo
  "   find files containing 'foo' case-insensitively, and print only the match,
  "   rather than the whole line.
  "
  " ag -l foo
  "   only list the filename not include context.
  "
  " ag foo -G bar
  "   find 'foo' in files with a name matching 'bar'
  "
  " ag -g bar
  "   find files with a name matching 'foo'
  "
  " ag foo --ignore-dir=build/
  "   search 'foo' in current directory exclude 'build' directory.
  "
  " ag '^ba(r|z)$'
  "   using regular expression.

  " NOTE: must use obsolete path.
  let g:ag_prg="/usr/local/ag/bin/ag --vimgrep --smart-case"
  " Searching from your root project instead of the cwd.
  let g:ag_working_path_mode="r"
"}}} --- ag

"{{{ ctrlp (fuzzy search, alike leaderf, not used any more)
  " let g:ctrlp_map = '<c-p>'
  " let g:ctrlp_cmd = 'CtrlP'
  " let g:ctrlp_working_path_mode = 'rw'
  " " open window as a new tab
  " let g:ctrlp_split_window = 0
  "
  " " for help: `:h ctrlp_prompt_mappings`
  " let g:ctrlp_prompt_mappings = {
  "   \ 'PrtCurLeft()':        ['<left>'],
  "   \ 'PrtCurRight()':       ['<right>'],
  "   \ 'ToggleType(1)':       ['<c-l>'],
  "   \ 'ToggleType(-1)':      ['<c-h>'],
  "   \ 'PrtBS()':             ['<bs>', '<c-]>'],
  "   \ }
  "
  " let g:ctrlp_custom_ignore = {
  "   \ 'dir': '\v[\/]\.(dir|git)$',
  "   \ 'file': '\v\.(a|bin|cmake|make|o|out|so|swp)$'
  "   \ }
"}}} --- ctrlp

"{{{ vim-surround
  " cs"'    - " -> '
  " cs'</q> - ' -> </q>
  " cst"    -   -> "
  " ds"     - remove delimiters entirely.
  " ysiw"   -
  " ysiw[   - hello world! -> [ hello ] world!
  " ysiw]   - hello world! -> [hello] world!
  " yss)    - wrap the entire line.
  "
  " Repeat operation
  " press dot '.', then hit punctuation.
"}}} --- vim-surround

"{{{ custom functions
  function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
  endfunction

  command! TrimWhitespace call TrimWhitespace()
"}}} --- custom functions
