" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   ,n = toggle NERDTree off and on                                         |
" |                                                                           |
" |   ,f = fuzzy find all files                                               |
" |   ,b = fuzzy find in all buffers                                          |
" |   ,p = go to previous file                                                |
" |                                                                           |
" |   hh = inserts '=>'                                                       |
" |   aa = inserts '@'                                                        |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------  


set nocompatible
set hidden
let mapleader = ","


" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()


" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase


" Colors **********************************************************************
"set t_Co=256 " 256 colors
"set background=dark 
syntax on
colorscheme mustang


" Status Line *****************************************************************
set laststatus=2
set showcmd
set ruler " Show ruler
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c/%L
"set ch=2 " Make command line two lines high


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word


" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h

" Pathogen plugin *************************************************************
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" File Stuff ******************************************************************
filetype on
filetype plugin indent on
filetype plugin on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml


" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible chars


" Mouse ***********************************************************************
"set mouse=a " Enable the mouse
"behave xterm
"set selectmode=mouse


" Misc settings ***************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
set nofoldenable " Turn off folding 


" Navigation ******************************************************************

" Make cursor move by visual lines instead of file lines (when wrapping)
"map <up> gk
"map k gk
"imap <up> <C-o>gk
"map <down> gj
"map j gj
"imap <down> <C-o>gj
"map E ge

map <Leader>p <C-^> " Go to previous file


" Ruby stuff ******************************************************************
compiler ruby         " Enable compiler support for ruby
"map <F5> :!ruby %<CR>


" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 

"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
"autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1



" Hard to type *****************************************************************
imap uu _
imap hh =>
imap aa @


" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

" NERDTree ********************************************************************
:noremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything


" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.


" CommandT ********************************************************
  " To compile:
  " cd ~/cl/etc/vim/ruby/command-t
  " ruby extconf.rb
  " make
let g:CommandTMatchWindowAtTop = 1
map <Leader>f :CommandT<CR>


" fuzzyfinder ********************************************************
" I'm using CommandT for main searching, but it doesn't do buffers, so I'm
" using FuzzyFinder for that
"map <Leader>b :FufBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'


" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2
let g:acp_behaviorSnipmateLength = 1

" railsvim ***************************************************************
map <Leader>ra :AS<CR>
map <Leader>rs :RS<CR>


" Taglists *******************************************************************
" Select the exuberant ctags (had to be downloaded and installed!)
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1
"let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
"let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
"let Tlist_Auto_Highlight_Tag = 0

nmap <Leader>t :TlistToggle<CR>


noremap <C-left> :bn<CR>
noremap <C-right> :bp<CR>



" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
"if has("mac") 
  "" 
"endif
 
" Windows *********************************************************************
"if has("gui_win32")
  "" 
"endif



" -----------------------------------------------------------------------------  
" |                               Startup                                     |
" -----------------------------------------------------------------------------  
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l 



" -----------------------------------------------------------------------------  
" |                               Host specific                               |
" -----------------------------------------------------------------------------  
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"if hostname() == "foo"
  " do something
"endif

" Example .vimrc.local:

"call Tabstyle_tabs()
"colorscheme ir_dark
"match LongLineWarning '\%120v.*'

"autocmd User ~/git/some_folder/* call Tabstyle_spaces() | let g:force_xhtml=1
