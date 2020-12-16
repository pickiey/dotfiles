"-------------------------------------------------------------------------------
" プラグインごとの設定 Plugins
"-------------------------------------------------------------------------------

" ------------------------------------------------
" vim-indent-guides
" ------------------------------------------------

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup = 1





" ------------------------------------------------
" vim-markdown
" ------------------------------------------------

let g:vim_markdown_folding_disabled = 1





" ------------------------------------------------
" smooth_scroll.vim
" ------------------------------------------------

map :call SmoothScroll("d",1, 1)<CR>
map :call SmoothScroll("u",1, 1)<CR>





" ------------------------------------------------
" quickrun.vim
" ------------------------------------------------

" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定できます
" updatetime が一時的に書き換えられてしまうので注意して下さい
let g:quickrun_config = {
\   '_' : {
\       'runner'                          : 'vimproc',
\       'runner/vimproc/updatetime'       : 60,
\       'outputter/buffer/split'          : ':botright 8sp',
\       'outputter/buffer/close_on_empty' : 1
\   }
\}

" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright

let g:quickrun_config['html'] = {
\   'command'   : 'open',
\   'cmdopt'    : '-g'
\}
let g:quickrun_config['markdown'] = {
\   'outputter' : 'browser'
\}





" ------------------------------------------------
" open-browser.vim
" ------------------------------------------------

" Vimでワード指定するとブラウザが開き、Google検索
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)





" ------------------------------------------------
" emmet.vim
" ------------------------------------------------

" emmet.vimで言語属性をjaにする
let g:user_emmet_settings = {
\   'variables' : {
\       'lang' : "ja"
\   }
\}





" ------------------------------------------------
" vim-autoft
" ------------------------------------------------

let g:autoft_config = [{
\       'filetype'  : 'html',
\       'pattern'   : '<\%(!DOCTYPE\|html\|head\|script\)\|^html:5\s*$'
\   }, {
\       'filetype'  : 'c',
\       'pattern'   : '^\s*#\s*\%(include\|define\)\>'
\   }, {
\       'filetype'  : 'diff',
\       'pattern'   : '^diff -'
\   }, {
\       'filetype'  : 'sh',
\       'pattern'   : '^#!.*\%(\<sh\>\|\<bash\>\)\s*$'
\   }
\]





" ------------------------------------------------
" vim-gitgutter
" ------------------------------------------------

let g:gitgutter_sign_added    = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed  = '✘'
