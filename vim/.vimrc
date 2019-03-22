"{{{ vim-plug plugin (vim plugins manager, better than Vundle)
  " Check vim-plug whether installed properly.
  " NOTE: required curl preinstalled.
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

    " Auto-completion.
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    " Auto-completion for code snippets. NOTE: must install YCM before using
    " UltiSnips.
    Plug 'SirVer/ultisnips'

    " Align based on specific characters.
    Plug 'junegunn/vim-easy-align'
    " Surround a word or a line quickly.
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'

    " Switch between .c and .h, .cpp and .hpp files only for c-family.
    " Close all other buffers except the current.
    Plug 'pingsoli/vim-plugins', {'as': 'a.vim', 'rtp': 'a.vim'}
    Plug 'pingsoli/vim-plugins', {'as': 'BufOnly.vim', 'rtp': 'BufOnly.vim'}

    " Bookmarks operation.
    " Plug 'kshenoy/vim-signature'

    " C++ syntax highlight
    Plug 'octol/vim-cpp-enhanced-highlight'
  call plug#end()
"}}} --- vim-plug

"{{{ general settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Basic settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  filetype plugin indent on
  let g:mapleader=","

  syntax on              " Syntax highlight based on 'filetype'
  set nocompatible       " Use vim defaults instead of 100% vi compatibily
  set nu rnu             " Absolute + Relative number simutaneously
  set ruler              " Show current cursor's positin (rows, cols)
  set mouse=             " Disable mouse movement in all mode.
  set encoding=utf-8     " The encoding displayed.
  set showmatch          " (), [], {} highlight the match pairs.
  set timeoutlen=500     " Mapping delay
  set ttimeoutlen=100    " Key code delay

  " Show the trail whitespace, show tab specially.
  set list listchars=tab:>-,trail:•

  set autochdir          " Auto change directory according current file.

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Indent settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " New lines inherit the indentation of previous line
  set smarttab
  set autoindent        " Hit enter in insert mode or `O` or `o` in normal mode
  " set smartindent       " Reacts based on syntax/style of the code.
  set nosmartindent     " `smartindent` will mess up the comment on python file.
  set expandtab         " Convert tabs to whitespaces
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set nowrap            " Not wrap automatically even textwidth is bigger than 0
  set textwidth=0       " Disable autowrap.

  augroup indent_settings
    autocmd!

    " Edit Makefile using tabs substitute space, Indent based on filetype
    " autocmd FileType make       setlocal noexpandtab
    " autocmd FileType make       setlocal list listchars=tab:\ \ ,
    autocmd FileType html       setlocal shiftwidth=4 tabstop=4
    autocmd FileType java       setlocal shiftwidth=4 tabstop=4
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType python     setlocal shiftwidth=4 tabstop=4
  augroup END

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Theme settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " refer to https://jonasjacek.github.io/colors/
  set background=dark
  " Make sure set it to work together with tmux.
  set t_Co=256

  " Highlight 80th line
  highlight ColorColumn ctermbg=239
  set colorcolumn=81

  " Autocomplete color scheme for Omni and YCM.
  " 236 = gray, 77 = green
  highlight Pmenu      ctermbg=235 ctermfg=77
  highlight PmenuSel   ctermbg=24  ctermfg=NONE cterm=NONE
  highlight PmenuSbar  ctermbg=102
  highlight PmenuThumb ctermbg=239

  " Highlight color for search results.
  highlight Search cterm=NONE ctermfg=black ctermbg=gray

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
  set foldmethod=indent   " '=syntax' causes cursor motion lag sometimes.
  set foldlevelstart=20
  set foldnestmax=3
  nnoremap <Space> za

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Search settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Clear the last used search pattern when source .vimrc
  let @/=""
  set hlsearch          " Highlight searching results
  set incsearch         " Goto the search place automatically
  set ignorecase        " Case insensitive
  set smartcase
  nnoremap <silent> <Leader><Space> :nohlsearch<CR>

  " Cursor moving in insert mode
  inoremap <C-H> <Left>
  inoremap <C-L> <Right>
  inoremap <C-J> <Down>
  inoremap <C-K> <Up>

  " Command-line mode cursor movement.
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-h> <Left>
  cnoremap <C-l> <Right>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Window settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Moving between windows
  nnoremap <C-H> <C-W><C-H>
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>

  " Change windows resize default value
  nnoremap <silent> <Right> :vertical resize +5<CR>
  nnoremap <silent> <Left>  :vertical resize -5<CR>
  nnoremap <silent> <Up>    :resize +5<CR>
  nnoremap <silent> <Down>  :resize -5<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Tab settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 0 never, 1 only if there are at least two tab pages, 2 always.
  " Work together with airline#tabline#tab_min_count=2
  set showtabline=1

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

  " Moving tabs around.
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
  " Not scan current and included files. for help: `h 'complete'`
  set complete-=i

  " Don't update screen during macro and script execution
  set lazyredraw
  set ttyfast

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
  inoremap <silent> "     ""<left>
  inoremap <silent> ";    "";<left><left>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Misc settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " If enable autoindent, the paste text will be indented and not neat.
  " NOTE: paste mode will set noexpandtab.
  set pastetoggle=<F2>

  " IMPORTANT, <C-c> abort autocommand, but <Esc> does not.
  " If you use YouCompleteMe, <C-c> will abort the autosuggestion.
  " Why use double <Esc>? Avoid the delay.
  inoremap <silent> <C-c> <Esc><Esc>

  " Ignore directories
  set wildignore+=*/.git/*,*/CMakeFiles/*
  set wildignore+=*.o,*.swp,tags,*.cmake

  " Save current file, NOTE: other files won't save.
  nnoremap <Leader>s :update<CR>
  " Close window quickly (save and quit)
  nnoremap <Leader>x ZZ<CR>

  " Remap Q to <nop>(no operation), rather entering Ex mode.
  nnoremap Q <nop>

  " Write to protected files forcely.
  " cnoreabbrev is better than cnoremap.
  cnoreabbrev w!! w !sudo tee % >/dev/null

  " Comment for c, cpp quickly (uncomment using <Leader>cu in nerdcommenter).
  " It will be very uesful when you set `foldmethod=indent`.
  " `\s` whitespace, `\S` non-whitespace, `:noh<CR>` non-highlight.
  " `\%V` only highlight the selected content in visual mode.
  vnoremap <silent> // :s:\%V\(\S\):// \0<CR>:noh<CR>

  " Trim the right whitespaces in visual mode.
  vnoremap <silent> <Leader><space> :s/\s\+$//e<CR>:noh<CR>

  " Reload ~/.vimrc without quit vim. (Global Source Vim confiure file)
  nnoremap gsv :source $MYVIMRC<CR>

  " Load ctags recursively. check current folder for tags file and keep going
  " one directory up all the way to the root folder.
  set tags=tags;/

  " Man page in vim. (Because the 'K' key has been mapped)
  " runtime! ftplugin/man.vim
  " nnoremap <leader>m :Man<space>

  augroup python_programming
    autocmd!
    " Execute current python file and read output to current location.
    autocmd filetype python nnoremap <buffer><silent> ,py :r! python %<CR>
    autocmd filetype python inoremap <buffer><silent> (: ():<left><left>
  augroup END

  augroup c_family_programming
    autocmd!
    " Auto-completes for closing characters in c, cpp.
    autocmd filetype c,cpp inoremap <buffer><silent> (;     ();<left><left>
    autocmd filetype c,cpp inoremap <buffer><silent> {;<CR> {<CR>};<ESC>O

    " '=', ';' is a match pair, if you set 'showmatch', they'll be highlighted.
    autocmd filetype c,cpp set matchpairs+==:;
  augroup END
"}}} --- general settings

"{{{ nerdtree plugin
  " Show directory tree and locate to the current opened file.
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

  " NERDTree file highlighting according to file extension.
  " function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  "  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  "  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  " endfunction

  " call NERDTreeHighlightFile('md',     'blue',   'none', '#3366FF', '#151515')
  " call NERDTreeHighlightFile('conf',   'yellow', 'none', 'yellow',  '#151515')
  " call NERDTreeHighlightFile('json',   'yellow', 'none', 'yellow',  '#151515')
  " call NERDTreeHighlightFile('html',   'yellow', 'none', 'yellow',  '#151515')
  " call NERDTreeHighlightFile('js',     'red',    'none', '#ffa500', '#151515')
  " call NERDTreeHighlightFile('so',     'green',  'none', 'yello',   '#151515')
"}}} --- nerdtree

"{{{ nerdcommenter plugin (quick commnet)
  " NERDCommenter default mappings
  " <leader>cc - Comment out the current line or text selected in visual mode
  " <leader>cn - same as cc but forces nesting.
  " <leader>cb - comment and align automatically.
  " <leader>cu - uncomment the selected lines.

  " Custom mappings
  " <leader>c - Comment
  " <leader>u - Uncomment

  " Add spaces after commet delimiters by default
  let g:NERDSpaceDelims = 1
  let g:NERDCompactSexyComs = 1

  let g:NERDCommentEmptyLines = 1
  let g:NERDTrimTrailingWhitespace = 1
  let g:NERDDefaultAlign = 'left'

  " Disable default mapping for us.
  let g:NERDCreateDefaultMappings = 0
  map <Leader>c <Plug>NERDCommenterComment
  map <Leader>u <plug>NERDCommenterUncomment

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
"}}} --- tagbar

"{{{ airline plugin (beauty status bar in vim)
  let g:airline_powerline_fonts = 1

  let g:airline#extensions#whitespace#enables = 0
  let g:airline#extensions#wordcount#enabled = 0

  " tabline settings
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tab_type = 0

  " show tab number from 1 ~ N.
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

"{{{ tmuxline (beauty status bar)
  " #S - Seesion name
  " #I - Current window index
  " #W - Current window name
  let g:tmuxline_preset = {
    \ 'a': '#S',
    \ 'win' : ['#I', '#W'],
    \ 'cwin': ['#I', '#W'],
    \ }

"}}} --- tmuxline
"
"{{{ highlight for cpp syntax
  let g:cpp_class_scope_highlight                  = 1
  let g:cpp_member_variable_highlight              = 1
  let g:cpp_class_decl_highlight                   = 1
  let g:cpp_experimental_simple_template_highlight = 1
"}}} --- highlight-cpp

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
  nnoremap ;l :LeaderfLine<CR>
"}}} --- leaderf

"{{{ youcompleteme plugin (autocomplete)
  " <c-y>  Stop completion
  " <c-j>  next item
  " <c-k>  previous item
  " <tab>  choose next, same as <c-i>

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
  " :UltiSnipsEdit to edit your own ultisnips.

  " All UltiSnips location.
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

  " Open UltiSnips window vertically.
  let g:UltiSnipsEditSplit="vertical"

  " Trigger configuration. Do not use <tab> if you use YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<c-Space>"

  " Don't quit insert mode, or the trigger won't take effect.
  let g:UltiSnipsJumpForwardTrigger="<c-f>"
  let g:UltiSnipsJumpBackwardTrigger="<c-b>"
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
  "     use `Ack! test %`, search 'test' in current file.
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
  " ack.vim use quickfix window, you can use these keyboard shortcuts.
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
  let g:ackprg = '/usr/bin/ag --vimgrep'

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

"{{{ multiple-cursors plugin
  " normal/visual mode:
  "   <c-n> start multicursor and add a visual cursor + selection on the match
  "     next: <C-n> add a virtual cursor + selection on the next match
  "     skip: <C-x> skip the next match
  "     prev: <C-p> remove current virtual cursor + selection and go back to
  "           previous match
  "   select all:
  "     <c-m> select all words under the cursor.
  "     see the following key mappings.
  "
  " multiple-cursors mode:
  "   c, s, I, A work same as before in vim.
  "   Use 'c' to change the word, 's' to substitue the word, and etc.
  "
  " Quit multiple-cursor mode:
  "   Use <Esc> to quit multicursor.
  "
  "   NOTE: don't use <C-c> to exit multicursor, and the highlighted text will
  "   not disappear.

  " It's kind of annoying.
  " let g:multi_cursor_select_all_word_key = '<C-m>'
  " let g:multi_cursor_select_all_key      = 'g<C-m>'
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

  " Open in current window
  nnoremap <silent> <leader>go  :A<CR>
  nnoremap <silent> <leader>gio :IH<CR>

  " Horizontal
  nnoremap <silent> <leader>gs  :AS<CR>
  nnoremap <silent> <leader>gis :IHS<CR>

  " Vertical
  nnoremap <silent> <leader>gv  :AV<CR>
  nnoremap <silent> <leader>giv :IHV<CR>

  " Open in other tab
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

  " If you really want vim-signature, uncomment the below.
  " highlight SignColumn ctermbg=none
  " highlight SignatureMarkText ctermbg=none
"}}}

"{{{ cpp-enhanced-hight plugin
  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_experimental_simple_template_highlight = 1
"}}}

"{{{ bufonly (close all other buffers)
  nnoremap ;bo :BufOnly<CR>
")}}}
