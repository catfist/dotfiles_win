" 設定しない項目
" set term=xterm " vimを抜けた後表示がターミナル上に残り、おかしくなる

" 設定する項目
" 日本語を使いやすくする
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
"画面最後の行をできる限り表示する。
set display+=lastline
set formatoptions+=mMj
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 

set hidden
set number
set clipboard+=unnamed
syntax on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a
set ttymouse=xterm2
set nocompatible
set backspace=2
set backup                      " ファイルのバックアップを有効にする
set writebackup                 " 取得するバックアップを編集前のファイルとする(無効化する場合は「nowritebackup」)
set backupdir=~/.vim/backup  " このディレクトリはあらかじめ作っておく。chmod 700 するのを忘れずに
au BufWritePre * let &bex = '.' . strftime("%Y%m%d_%H%M%S")
                                 " バックアップを取得するファイル名を「ファイル名.タイムスタンプ」とする
set undodir=~/.vim/undo         " undoファイル作成ディレクトリ

" if !has("gui_running")
"     inoremap <Esc>[62~ <C-X><C-E>
"     inoremap <Esc>[63~ <C-X><C-Y>
"     nnoremap <Esc>[62~ <C-E>
"     nnoremap <Esc>[63~ <C-Y>
" endif
