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
  nnoremap <Leader>1  1gt<CR>
  nnoremap <Leader>2  2gt<CR>
  nnoremap <Leader>3  3gt<CR>
  nnoremap <Leader>4  4gt<CR>
  nnoremap <Leader>5  5gt<CR>
  nnoremap <Leader>6  6gt<CR>
  nnoremap <Leader>7  7gt<CR>
  nnoremap <Leader>8  8gt<CR>
  nnoremap <Leader>9  9gt<CR>

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
  set wildignore+=*.o,*.swp,tags,*.cmake

  " Save current file, NOTE: won't affect other files.
  nnoremap <Leader>s :update<CR>
  " Close window quickly (save and quit)
  nnoremap <Leader>x ZZ<CR>

  " Remap Q to nop, not entering Ex mode.
  nnoremap Q <nop>

  " Write to protected files forcely.
  cmap w!! w !sudo tee % >/dev/null

  " Comment for c, cpp quickly (uncomment using <Leader>cu in nerdcommenter).
  " It will be very uesful when you set `foldmethod=indent`.
  " `\s` whitespace, `\S` non-whitespace, `:noh<CR>` non-highlight.
  " `\%V` only highlight the searched content in visual mode.
  vnoremap <silent> // :s:\%V\(\S\)://\0<CR>:noh<CR>

  " Trim the right whitespaces in visual mode.
  vnoremap <silent> <Leader><space> :s/\s\+$//e<CR>:noh<CR>

  " Clear the last used search pattern when source .vimrc
  let @/=""

  " Reload ~/.vimrc without quit vim. (Global Source Vim confiure file)
  nnoremap gsv :source $MYVIMRC<CR>

  augroup python_settings
    autocmd!
    " Execute current python file and read output to current location.
    autocmd FileType python nnoremap <buffer><silent> ,py :r! python %
  augroup END
"}}} --- general settings

"{{{ vim-plug plugin (vim plugins manager, better than Vundle)
  " Check vim-plug whether installed properly.
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.vim/bundle')
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar'

    " Make git operations simpler.
    " NOTE: vim-fugitive conficts with vim-airline.
    " Description: cursor operation lag when saving file.
    " Plug 'tpope/vim-fugitive'

    " Beautify vim
    Plug 'vim-airline/vim-airline'
    Plug 'edkolev/tmuxline.vim'

    " Fuzzy search files, buffers, MRU, functions.
    " leaderf is faster than ctrlp in big project has tons of files.
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

    " Search tool based on ag command.
    Plug 'mileszs/ack.vim'

    " Auto-complementation.
    Plug 'Valloric/YouCompleteMe'
    " Auto-complementation for code snippets.
    Plug 'SirVer/ultisnips'

    " Alignment based on specific characters.
    Plug 'junegunn/vim-easy-align'
    " Surround a word or a line quickly.
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'

    " Switch between .c and .h, .cpp and .hpp files only for c-family.
    Plug 'pingsoli/a.vim'
    " Close all other buffers except the current.
    Plug 'pingsoli/BufOnly.vim'

    " Bookmarks operation.
    Plug 'kshenoy/vim-signature'
  call plug#end()
"}}} --- vim-plug

"{{{ nerdtree plugin
  " Show directory tree and locate based current file
  nnoremap <silent> <Leader>w :NERDTreeToggle<CR><C-w>=<CR>
  nnoremap <silent> <Leader>l :NERDTreeFind<CR><C-w>=<CR>

  " Use the wildignore.
  let g:NERDTreeRespectWildIgnore = 1
  let g:NERDTreeIgnore = [
    \ '\.o$[[file]]', '\.out$[[file]]', '\.swp$[[file]]',
    \ '\.bin$[[dir]]', '\.git$[[dir]]',
    \ ]

  let g:NERDTreeShowHidden = 1
  let g:NERDTreeChDirMode  = 2

  " Remove the default key mappings in nerdtree,
  " and remap J and K key for moving between tabs.
  let g:NERDTreeMapJumpLastChild = ''
  let g:NERDTreeMapJumpFirstChild = ''

  " Remap <C-j> and <C-k> for moving between windows.
  let g:NERDTreeMapJumpNextSibling = ''
  let g:NERDTreeMapJumpPrevSibling = ''

  " NERDTree use relative numbers
  let NERDTreeShowLineNumbers=1
  augroup nerdtree
    autocmd!
    autocmd FileType nerdtree setlocal relativenumber
  augroup END
"}}} --- nerdtree

"{{{ nerdcommenter plugin (quick commnet)
  " <leader>cc - Comment out the current line or text selected in visual mode
  " <leader>cn - same as cc but forces nesting.
  " <leader>cb - comment and align automatically.
  " <leader>cu - uncomment the selected lines.

  " Add spaces after commet delimiters by default
  let g:NERDSpaceDelims = 1
  let g:NERDCompactSexyComs = 1

  let g:NERDCommentEmptyLines = 1
  let g:NERDTrimTrailingWhitespace = 1
  let g:NERDDefaultAlign = 'left'
"}}} --- nerdcommenter

"{{{ tagbar plugin (switch between declaration and implementation)
  " tags operations
  " :ta main  goto the main function definition
  " <c-]>  goto the declaration
  " g]     view all declaration
  " <c-t>  goto the last location
  " <c-w>] preview

  let g:tagbar_ctags_bin = "/usr/local/ctags/bin/ctags"
  nnoremap <silent> ;j :TagbarOpen fj<CR>
  nnoremap <silent> ;t :TagbarToggle<CR>

  " 2 relative line number, 0 don't show linenubmer, 1 absolute linenumbers
  let g:tagbar_show_linenumbers = 2

  " tags for ctags
  set tags=./tags
"}}} --- tagbar

"{{{ airline plugin (beauty status bar in vim)
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

"{{{ vim-easy-align plugin
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

"{{{ leaderf plugin (fuzzy search buffers, files, MRU, funciton declaration)
  " <leader>f   find files in the project
  " <leader>b   find buffers in the project
  " ;f          find function in current file (for cpp)
  " <c-x>       open in horizontal split window
  " <c-]>       open in vertical split window
  " <leader>b<tab>d  delete the buffer under the cursor line.

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

"{{{ youcompleteme plugin (autocomplete)
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

"{{{ ultisnips plugin (autocomplete some snippets)
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

  " Trigger configuration. Do not use <tab> if you use YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<c-space>"

  " Don't quit insert mode, or the trigger won't take effect.
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"}}} --- ultisnips

"{{{ ack plugin (search context in the whole project)
  " ag command usage:
  "   ag foo
  "     search 'foo' in current directory recursively(the output info include
  "     filename and context)
  "
  "   ag -i -o foo
  "     find files containing 'foo' case-insensitively, and print only the match,
  "     rather than the whole line.
  "
  "   ag -l foo
  "     only list the filename not include context.
  "
  "   ag foo -G bar
  "     find 'foo' in files with a name matching 'bar'
  "
  "   ag -g bar
  "     find files with a name matching 'foo'
  "
  "   ag foo --ignore-dir=build/
  "     search 'foo' in current directory exclude 'build' directory.
  "
  "   ag '^ba(r|z)$'
  "     using regular expression.
	"
	" Ack plugin key shortcuts
	" ?    a quick summary of these keys, repeat to close
	" o    to open (same as Enter)
	" O    to open and close the quickfix window
	" go   to preview file, open but maintain focus on ack.vim results
	" t    to open in new tab
	" T    to open in new tab without moving to it
	" h    to open in horizontal split
	" H    to open in horizontal split, keeping focus on the results
	" v    to open in vertical split
	" gv   to open in vertical split, keeping focus on the results
	" q    to close the quickfix window

  " Use ag command.
  let g:ackprg = '/usr/local/ag/bin/ag --vimgrep'

  cnoreabbrev Ack Ack!
  nnoremap <leader>a :Ack!<space>
"}}} --- ack

"{{{ vim-surround
  " Normal mode: cs, ds, ys
  " cs"'   - " -> '
  " cs'<q> - ' -> </q>
  " cst'   - <q>word</q>  -> 'word'
  " ds"    - remove delimiters entirely.
  " ysiw"  -
  " ysiw[  - hello world! -> [ hello ] world!
  " ysiw]  - hello world! -> [hello] world!
  " yss)   - surround the entire line.
  "
  " Visual mode: S
  " VS<strong>
  "   V: enter visual line mode
  "   S: start surround
  "   <strong>: the label we want to surround
  "
  " <strong>
  " Hello world!
  " </strong>
  "
  " Repeat operation
  " press dot '.', then hit punctuation.
"}}} --- vim-surround

"{{{ vim-easymotion plugin
  " Key mappings
  " char
  " <leader><leader>f{char} - find {char} to the right.
  " <leader><leader>F{char} - find {char} to the left.
  " <leader><leader>s{char} - Find {char} forward and backward.
  "
  " word
  " <leader><leader>w       - beginning of the word forward.
  " <leader><leader>W       - beggining of the WORD forward.
  " <leader><leader>b       - beginning of the word backward.
  " <leader><leader>B       - beginning of the WORD backward.
  " <leader><leader>e       - end of the word forward.
  " <leader><leader>ge      - end of the word backward.
  " <leader><leader>gE      - end of the WORD backword.
  "
  " line
  " <leader><leader>j       - line downward.
  " <leader><leader>k       - line upward.
"}}} --- vim-easymotion

"{{{ multiple-cursors
  " normal/visual mode
  " <c-n> start multicursor and add a visual cursor + selection on the match
  "   next: <C-n> add a virtual cursor + selection on the next match
  "   skip: <C-x> skip the next match
  "   prev: <C-p> remove current virtual cursor + selection and go back to
  "         previous match
  " select all:
  " For instance: c, s, I, A work without any issue.
  " <Esc> to quit multicursor. NOTE: don't use <C-c> to exit multicursor.

  let g:multi_cursor_select_all_word_key = ''
  let g:multi_cursor_select_all_key      = ''
"}}} --- multiple-cursors

"{{{ a.vim (switch between header and implementation files)
	" :A 	 switches to the header file corresponding to the current file being edited (or vise versa)
	" :AS  splits and switches
	" :AV  vertical splits and switches
	" :AT  new tab and switches
	" :AN  cycles through matches
	" :IH  switches to file under cursor
	" :IHS splits and switches
	" :IHV vertical splits and switches
	" :IHT new tab and switches
	" :IHN cycles through matches

  nnoremap <silent> <leader>go  :A<CR>
  nnoremap <silent> <leader>gio :IH<CR>

  nnoremap <silent> <leader>gs  :AS<CR>
  nnoremap <silent> <leader>gis :IHS<CR>

  nnoremap <silent> <leader>gv  :AV<CR>
  nnoremap <silent> <leader>giv :IHV<CR>

  nnoremap <silent> <leader>gt  :AT<CR>
  nnoremap <silent> <leader>git :IHT<CR>
"}}} --- a.vim

"{{{ vim-signature
  " mx           Toggle mark 'x' and display it in the leftmost column
  " dmx          Remove mark 'x' where x is a-zA-Z
  "
  " m,           Place the next available mark
  " m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
  " m-           Delete all marks from the current line
  " m<Space>     Delete all marks from the current buffer
  " ]`           Jump to next mark
  " [`           Jump to prev mark
  " ]'           Jump to start of next line containing a mark
  " ['           Jump to start of prev line containing a mark
  " `]           Jump by alphabetical order to next mark
  " `[           Jump by alphabetical order to prev mark
  " ']           Jump by alphabetical order to start of next line having a mark
  " '[           Jump by alphabetical order to start of prev line having a mark
  " m/           Open location list and display marks from current buffer
  "
  " m[0-9]       Toggle the corresponding marker !@#$%^&*()
  " m<S-[0-9]>   Remove all markers of the same type
  " ]-           Jump to next line having a marker of the same type
  " [-           Jump to prev line having a marker of the same type
  " ]=           Jump to next line having a marker of any type
  " [=           Jump to prev line having a marker of any type
  " m?           Open location list and display markers from current buffer
  " m<BS>        Remove all markers

  highlight SignColumn ctermbg=none
  highlight SignatureMarkText ctermbg=none
"}}}

"{{{ bufonly (close all other buffers
  nnoremap <silent> bo :BufOnly<CR>
")}}}

"{{{ custom functions
  function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
  endfunction

  command! TrimWhitespace call TrimWhitespace()
"}}} --- custom functions
