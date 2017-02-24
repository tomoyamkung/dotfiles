
set history=500
set title
syntax on
set encoding=utf-8
set t_Co=256
"set paste " これを有効にしていると neocomplete が効かなくなるので無効にしている
" 大文字小文字を区別しない
set ignorecase
" 検索文字に大文字がある場合は大文字小文字を区別
set smartcase
"インクリメンタルサーチ
set incsearch
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 対応する括弧などをハイライト表示する
set showmatch
" 対応括弧のハイライト表示を3秒にする
set matchtime=3
" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
" swap ファイルと backup ファイルを作成しない
set nowritebackup
set nobackup
set noswapfile
" 不可視文字の可視化
"set list
" 長いテキストの折り返し
set wrap
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

"set expandtab
set tabstop=4 
set shiftwidth=4
set autoindent
set smartindent

" ファイルが未保存の場合でもバッファの切り替えを有効にする
set hidden

"unite.vim {{{
" インサートモードで使用する（ファイルを絞り込んで特定するため）
let g:unite_enable_start_insert = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" 最近使用したファイルリストの上限を 100 件とする
let g:unite_source_file_mru_limit = 100
let g:unite_source_history_yank_enable =1
" ESCキーを2回押すと終了する  
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" プレフィックスキーの変更（space + u に割り当て）
nnoremap [unite] <Nop>
nmap <Space>u [unite]
" バッファリストからファイルを選択する
nnoremap <silent>[unite]b :<C-u>Unite buffer<CR>
" バッファリストと最近使用したファイルリストからファイルを選択する
nnoremap <silent>[unite]u :<C-u>Unite buffer file_mru<CR>
" カレントディレクトリからファイルを選択する
nnoremap <silent>[unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"}}}

"" Buffer {{{
" プレフィックスキーの変更（space + b に割り当て）
nnoremap [buffer] <Nop>
nmap <Space>b [buffer]
" バッファリストの１つ前のバッファを開く
nnoremap <silent>[buffer]p :bprevious<CR>
" バッファリストの１つ後ろのバッファを開く
nnoremap <silent>[buffer]n :bnext<CR>
" 直前に開いていたバッファを開く
nnoremap <silent>[buffer]b :<C-u>b#<CR>
" バッファリストを開く
nnoremap <silent>[buffer]l :<C-u>ls<CR>
" バッファやウィンドウの状態をファイルに保存する
" 次回 Vim を起動するときは `vim -S ~/.vim.session` とすると復元された状態で Vim を起動することができる
au VimLeave * mks! ~/.vim.session
" バッファ番号での移動を簡略化する（`ls` でバッファリストを表示 → `b NUM` で移動） 
nnoremap <silent>[buffer]m :ls<CR>:buf 
"}}}

"vimgrep + quickfix-window {{{
" :vim[grep] での検索結果を自動的に quickfix-window で表示する
autocmd QuickFixCmdPost *grep* cwindow
" プレフィックスキーの変更（space + g に割り当て）
nnoremap [vimgrepquickfix] <Nop>
nmap <Space>g [vimgrepquickfix]
" 次の検索結果に移動する
nnoremap <silent>[vimgrepquickfix]n :cnext<CR>
" 前の検索結果に移動する
nnoremap <silent>[vimgrepquickfix]p :cprevious<CR>
" 先頭の検索結果に移動する
nnoremap <silent>[vimgrepquickfix]N :<C-u>cfirst<CR>
" 末尾の検索結果に移動する
nnoremap <silent>[vimgrepquickfix]P :<C-u>clast<CR>
"}}}
