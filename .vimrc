"set nocompatible
set viminfo+=!


filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#incubate()
filetype on
filetype indent on
filetype plugin on

syntax on

set expandtab
set encoding=utf-8
set nobomb
set fileformat=unix

set cmdheight=2
set number
set ruler
set showmode
set title

set incsearch
set noignorecase
set smartcase
set hlsearch

"()
set showmatch
set matchpairs=(:),{:},[:],<:>

set wrap

set wildmenu

"set backupdir=~/.vim/vimbackup


function! JISX0208SpaceHilight()
    syntax match JISX0208Space "@" display containedin=ALL
    highlight JISX0208Space term=underline ctermbg=LightCyan
endf

if has("syntax")
    syntax on
        augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    augroup END
endif


set tabstop=4
set shiftwidth=4
" 不可視文字を表示する
"set list
"set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

set foldlevel=99
set foldlevelstart=99
set nofoldenable


" F6で日時を挿入
nnoremap <F6> :r!date/T<CR>

" マーク一覧とレジスタ一覧をspace-m, space-rで開けるようにする
nnoremap <Space>m  :<C-u>marks<Enter>
nnoremap <Space>r  :<C-u>registers<Enter>
" ノーマルモード時は;と:の位置を入れ替える
"noremap ;  :
"noremap :  ;

" コードリーディングのための設定
" grep コマンドの設定
"set grepprg=grep\ -rnIH\ --exclude-dir=.git\ --exclude-dir=.svn\ exclude-dir=.hg
set grepprg=grep\ -rnIH
autocmd QuickfixCmdPost * copen
" ctags関連の設定
" <C-]>でタグジャンプ時にタグが複数あったらリスト表示。カーソルがウィンドウの中心行になるようにジャンプ
nnoremap <C-]> g<C-]>zz
" タグを上向き検索
set tags=./tags;
"

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_snippets_dir = "~/.vim/bundle/snipmate-snippets/snippets"


