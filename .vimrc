"--- Include  -------------------------
set rtp+=~/dotfiles/.vim/
runtime! conf.d/*.vim

"--- Common --------------------------
set nocompatible                            "必ず最初に定義
set textwidth=80                            "80文字で改行
set number
set history=200
" TODO:
"if has('mac')
"  source ~/.vimrc.mac
"endif

"Assist imputting
set formatoptions+=m                        "整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,s,<,>,[,]               "カーソルを行頭、行末で止まらないようにする"

"Completemnet Command
set wildmenu                                " コマンド補完を強化
set wildmode=list:full                      " リスト表示，最長マッチ

"File
set nobackup
set autoread
set noswapfile
if v:version > 740                          " 7.4以降で変なファイルが出来ないようにする
  set noundofile
endif

"Tab
set expandtab                               "tab文字を空白文字に展開
set tabstop=4 shiftwidth=4 softtabstop=0
set autoindent cindent

"Quote
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" Search 
set wrapscan                                "最後まで検索したら先頭へ戻る
set ignorecase                              "大文字小文字無視
set smartcase                               "大文字ではじめたら大文字小文字無視しない
set incsearch                               "インクリメンタルサーチ
set hlsearch                                "検索文字をハイライト
nmap <ESC><ESC> :nohlsearch<CR>             "ESC2回押しでクリア

" Show
set title                                   "タイトルをウインドウ枠に表示
set ruler                                   "ルーラーを表示
set laststatus=2                            "ステータスラインを常に表示
function! GetStatusEx()
  let str = ''
  if &ft != ''
    let str = str . '[' . &ft . ']'
  endif
  if has('multi_byte')
    if &fenc != ''
      let str = str . '[' . &fenc . ']'
    elseif &enc != ''
      let str = str . '[' . &enc . ']'
    endif
  endif
  if &ff != ''
    let str = str . '[' . &ff . ']'
  endif
  return str
endfunction
set statusline=%<%f\ %m%r%h%w%=%{GetStatusEx()}\ \ %l,%c%V%8P

set showmatch                               "括弧の対応をハイライト
set showcmd                                 "入力中のコマンド表示
syntax on                                   "シンタックスカラーON
augroup vimrcEx                             "前回編集位置を記憶
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END
