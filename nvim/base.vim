"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------

" 編集中でも他のファイルを開けるようにする
set hidden
" 他で書き換えられたら自動で読み直す
set autoread

" バックアップ取らない
set nobackup
" スワップファイル作らない
set noswapfile
" ゴミファイルを作らせない
set noundofile

" スクロール時の余白確保
set scrolloff=5
" 一行に長い文章を書いていても自動折り返しをしない
set textwidth=0
" 折り返し
set nowrap
"if (v:version == 704 && has("patch338")) || v:version >= 705
"    set breakindent    " indent even for wrapped lines
"    set breakindentopt=min:0,shift:0
"endif

" バックスペースでなんでも消せるように
set backspace=indent,eol,start
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" コマンドをステータス行に表示
set showcmd
" 現在のモードを表示 -> lightlineで表示するため無効化
"set showmode
" モードラインは無効
set modelines=0

" テキスト整形オプション，マルチバイト系を追加
set formatoptions=lmoq

" viminfoファイルの設定
set viminfo='50,<1000,s100,\"50
" Exploreの初期ディレクトリ
set browsedir=buffer

" OSのクリップボードを使用する
set clipboard+=unnamed
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
"set ttymouse=xterm2

" ビープをならさない
set vb t_vb=
" escキーの反応を良くする
set timeout timeoutlen=1000 ttimeoutlen=10
" "Thanks for flying Vim"を回避
execute ":set titleold:".fnameescape($TITLE)
execute ":set titlestring:".fnameescape($TITLE." - %t")



" キーマップリーダー
" <Leader>を置き換える -> Qcuickrun用
let mapleader = ","

" ;でコマンド入力( ;と:を入れ替え)
noremap ; :
" pluginとかでnmap :call hoge..とかやってるやつがあるので、
" :でもexコマンドに入れるようにしておく
" noremap : ;

" 挿入モードでCtrl+pを押すとクリップボードの内容を貼り付けられるようにする
"imap <C-p>  <ESC>"*pa





"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------

" 常にステータスラインを表示
set laststatus=2

" カーソルが何行目の何列目に置かれているかを表示する
set ruler





"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------

" 自動でインデント
set autoindent

" ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
"set paste

" 新しい行の開始時、新しい行のインデントを現在行と同じ量にする
set smartindent

" Cプログラムファイルの自動インデントを始める
set cindent

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=4 shiftwidth=4 softtabstop=4

" インデント量を素早く変更
command! Indent2 :setlocal tabstop=2 shiftwidth=2
command! Indent4 :setlocal tabstop=4 shiftwidth=4





"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------

" 括弧の対応をハイライト
set showmatch

" 行番号表示
set number

" 不可視文字表示
set list

" 不可視文字の表示形式
set listchars=tab:>.,trail:_,extends:>,precedes:<

" 印字不可能文字を16進数で表示
set display=uhex

" Ambiguousな文字を全角で表示
set ambiwidth=double

" 行末の空白文字をハイライトする
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行をハイライト(カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

" カーソル列をハイライト
"set cursorcolumn

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast





"-------------------------------------------------------------------------------
" 補完・履歴 Complete
"-------------------------------------------------------------------------------

" コマンド補完を強化
set wildmenu

" コマンド補完を開始するキー
set wildchar=<tab>

" リスト表示，最長マッチ
set wildmode=list:full

" コマンド・検索パターンの履歴数
set history=1000

" 補完に辞書ファイル追加
"set complete+=k

" Ex-modeでの<C-p><C-n>をzshのヒストリ補完っぽくする
"cnoremap <C-p> <Up>
"cnoremap <Up>  <C-p>
"cnoremap <C-n> <Down>
"cnoremap <Down>  <C-n>





"-------------------------------------------------------------------------------
" タグ関連 Tags
"-------------------------------------------------------------------------------

" set tags
if has("autochdir")
    " 編集しているファイルのディレクトリに自動で移動
    set autochdir
    set tags=tags;
else
    set tags = {
    \   ./tags,
    \   ./../tags,
    \   ./*/tags,
    \   ./../../tags,
    \   ./../../../tags,
    \   ./../../../../tags,
    \   ./../../../../../tags
    \}
endif

set notagbsearch

" tab pagesを使い易くする
"   <C-t>はscreentとかぶるので削除
"nnoremap <C-t>  <Nop>
"nnoremap <C-t>n  ;<C-u>tabnew<CR>
"nnoremap <C-t>c  ;<C-u>tabclose<CR>
"nnoremap <C-t>o  ;<C-u>tabonly<CR>
"nnoremap <C-t>j  ;<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
"nnoremap <C-t>k  gT

" tags-and-searchesを使い易くする
nnoremap t  <Nop>

" 「飛ぶ」
nnoremap tt  <C-]>

" 「進む」
nnoremap tj  ;<C-u>tag<CR>

" 「戻る」
nnoremap tk  ;<C-u>pop<CR>

" 履歴一覧
nnoremap tl  ;<C-u>tags<CR>





"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------

" 最後まで検索したら先頭へ戻る
set wrapscan

" 大文字小文字無視
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" インクリメンタルサーチ
set incsearch

" 検索文字をハイライト
set hlsearch

" Escの2回押しでハイライト消去
nmap <silent> <ESC><ESC> :nohlsearch<CR><ESC>

" 選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" 選択した文字列を置換
vnoremap /r "xy;%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

" s*置換後文字列/g<Cr>でカーソル下のキーワードを置換
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>

" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" :Gb <args> でGrepBufferする
command! -nargs=1 Gb :GrepBuffer <args>

" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

" :Gr <args>でカレントディレクトリ以下を再帰的にgrepする
command! -nargs=1 Gr :Rgrep <args> *<Enter><CR>

" カーソル下の単語をgrepする
nnoremap <silent> <C-g><C-r> :<C-u>Rgrep<Space><C-r><C-w> *<Enter><CR>

let Grep_Skip_Dirs  = '.svn .git'
let Grep_Skip_Files = '*.bak *~'





"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h      <Left>
nnoremap j      gj
nnoremap k      gk
nnoremap l      <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" 0, 9で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $

" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>

" インサートモードでもhjklで移動（Ctrl押すけどね）
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
inoremap <C-l> <Right>

" <space>j, <space>kで画面送り
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" spaceで次のbufferへ。back-spaceで前のbufferへ
"nmap <Space><Space> ;MBEbn<CR>
"nmap <BS><BS> ;MBEbp<CR>

" F2で前のバッファ
"map <F2> <ESC>;bp<CR>

" F3で次のバッファ
"map <F3> <ESC>;bn<CR>

" F4でバッファを削除する
"map <F4> <ESC>:bnext \| bdelete #<CR>
"command! Bw :bnext \| bdelete #

" フレームサイズを怠惰に変更する
map <kPlus> <C-W>+
map <kMinus> <C-W>-

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" HTMLタグでも対応する閉じタグに動くようにする
source $VIMRUNTIME/macros/matchit.vim

" 対応する括弧に移動
nnoremap <silent> ( :<C-U>call matchit#Match_wrapper('',1,'n')<CR>
nnoremap <silent> ) :<C-U>call matchit#Match_wrapper('',1,'n')<CR>

" 最後に変更されたテキストを選択する
nnoremap gc  `[v`]
vnoremap gc <C-u>normal gc<Enter>
onoremap gc <C-u>normal gc<Enter>

" カーソル位置の単語をyankする
nnoremap vy vawy

" 矩形選択で自由に移動する
set virtualedit+=block

" ビジュアルモード時vで行末まで選択
vnoremap v $h

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" git-diff-aware version of gf commands.
" http://labs.timedia.co.jp/2011/04/git-diff-aware-gf-commands-for-vim.html
nnoremap <expr> gf  <SID>do_git_diff_aware_gf('gf')
nnoremap <expr> gF  <SID>do_git_diff_aware_gf('gF')
nnoremap <expr> <C-w>f  <SID>do_git_diff_aware_gf('<C-w>f')
nnoremap <expr> <C-w><C-f>  <SID>do_git_diff_aware_gf('<C-w><C-f>')
nnoremap <expr> <C-w>F  <SID>do_git_diff_aware_gf('<C-w>F')
nnoremap <expr> <C-w>gf  <SID>do_git_diff_aware_gf('<C-w>gf')
nnoremap <expr> <C-w>gF  <SID>do_git_diff_aware_gf('<C-w>gF')

function! s:do_git_diff_aware_gf(command)
    let target_path = expand('<cfile>')
    if target_path =~# '^[ab]/'  " with a peculiar prefix of git-diff(1)?
        if filereadable(target_path) || isdirectory(target_path)
            return a:command
        else
            " BUGS: Side effect - Cursor position is changed.
            let [_, c] = searchpos('\f\+', 'cenW')
            return c . '|' . 'v' . (len(target_path) - 2 - 1) . 'h' . a:command
        endif
    else
        return a:command
    endif
endfunction

" insert mode でjjでesc
inoremap jj <Esc>

" insert mode でddでescしてdd
"inoremap dd <Esc>dd

" insert mode でyyでescしてyy
"inoremap yy <Esc>yy

" insert mode でもZZやZQで終了
"inoremap ZZ <Esc>ZZ
"inoremap ZQ <Esc>ZQ





"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------

set background=dark
"set background=light

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
    " 256色
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-color"
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

" ポップアップメニューのカラーを設定
"hi Pmenu guibg=#666666
"hi PmenuSel guibg=#8cd0d3 guifg=#666666
"hi PmenuSbar guibg=#333333

" ハイライト on
syntax enable

" 補完候補の色づけ for vim7（以下から選ぶ
" hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
" hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" hi PmenuSbar ctermbg=0 ctermfg=9
" hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF





"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------

" yeでそのカーソル位置にある単語をレジスタに追加
nmap ye ;let @"=expand("<cword>")<CR>

" Visualモードでのpで選択範囲をレジスタの内容に置き換える
vnoremap p <Esc>;let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Tabキーを空白に変換
set expandtab

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>

" XMLの閉タグを自動挿入
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" Insert mode中で単語単位/行単位の削除をアンドゥ可能にする
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" :Ptでインデントモード切替
"command! Pt :set paste!

" インサートモード中に<C-o>でyankした内容をputする
"inoremap <C-o> <ESC>:<C-U>YRPaste 'p'<CR>i

" y9 ydで行末までヤンク
nmap y9 y$
nmap yd y$
" y0 ykで行頭までヤンク
nmap y0 y^
nmap yk y^

" カーソルから行頭まで削除
nnoremap <silent> <C-d> d0

" カーソルから行頭まで削除(インサートモード)
"inoremap <silent> <C-k> <Esc>lc^

" カーソルから行末まで削除(インサートモード)
"inoremap <silent> <C-d> <Esc>lc$

" カーソルから行頭までヤンク(インサートモード)
"inoremap <silent> <C-y>e <Esc>ly0<Insert>

" カーソルから行末までヤンク(インサートモード)
"inoremap <silent> <C-y>0 <Esc>ly$<Insert>

" 保存時に行末の空白を除去する
autocmd BufWrite    * :%s/\s\+$//ge
autocmd BufWritePre * :%s/\s\+$//ge

" 保存時にtabをスペースに変換する
autocmd BufWrite    * :%s/\t/    /ge
autocmd BufWritePre * :%s/\t/    /ge

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" quickfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" cwでquickfixウィンドウの表示をtoggleするようにした
function! s:toggle_qf_window()
    for bufnr in range(1,  winnr('$'))
        if getwinvar(bufnr,  '&buftype') ==# 'quickfix'
            execute 'ccl'
            return
        endif
    endfor
    execute 'botright cw'
endfunction
nnoremap <silent> cw :call <SID>toggle_qf_window()<CR>

let _curfile=expand("%:r")
if _curfile == 'makefile'
    set noexpandtab
endif





"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------

" 改行文字
set ffs=unix,dos,mac

" デフォルトエンコーディング
set encoding=utf-8

" 文字コード認識はbanyan/recognize_charcode.vimへ

" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs    :set fileencoding=euc-jp

" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn    :set fileencoding=utf-8
autocmd FileType js     :set fileencoding=utf-8
autocmd FileType css    :set fileencoding=utf-8
autocmd FileType html   :set fileencoding=utf-8
autocmd FileType xml    :set fileencoding=utf-8
autocmd FileType java   :set fileencoding=utf-8
autocmd FileType scala  :set fileencoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


" 指定文字コードで強制的にファイルを開く
command! Cp932      edit ++enc=cp932
command! Eucjp      edit ++enc=euc-jp
command! Iso2022jp  edit ++enc=iso-2022-jp
command! Utf8       edit ++enc=utf-8
command! Jis        Iso2022jp
command! Sjis       Cp932
