"-------------------------------------------------------------------------------
" プラグインごとの設定 Plugins
"-------------------------------------------------------------------------------

" ------------------------------------------------
" smooth_scroll.vim
" ------------------------------------------------

map :call SmoothScroll("d",1, 1)<CR>
map :call SmoothScroll("u",1, 1)<CR>





" ------------------------------------------------
" vim-indent-guides
" ------------------------------------------------

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup = 1





" ------------------------------------------------
" vim-gitgutter
" ------------------------------------------------

let g:gitgutter_sign_added    = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed  = '✘'





" ------------------------------------------------
" open-browser.vim
" ------------------------------------------------

" Vimでワード指定するとブラウザが開き、Google検索
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)





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
" vim-markdown
" ------------------------------------------------

let g:vim_markdown_folding_disabled = 1





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
" emmet.vim
" ------------------------------------------------

" emmet.vimで言語属性をjaにする
let g:user_emmet_settings = {
\   'variables' : {
\       'lang'    : "ja",
\       'charset' : "utf-8"
\   },
\   'html' : {
\       'snippets' : {
\           'html:5': "<!DOCTYPE html>\n"
\           ."<html>\n"
\           ."\t<head>\n"
\           ."\t\t<meta charset=\"${charset}\">\n"
\           ."\t\t<meta name=\"robots\" content=\"noindex, nofollow\">\n"
\           ."\n"
\           ."\t\t<title></title>\n"
\           ."\t\t<meta name=\"description\" content=\"\">\n"
\           ."\t\t<link rel=\"icon\" type=\"image/\" href=\"\">\n"
\           ."\n"
\           ."\t\t<meta property=\"og:url\" content=\"\">\n"
\           ."\t\t<meta property=\"og:title\" content=\"\">\n"
\           ."\t\t<meta property=\"og:description\" content=\"\">\n"
\           ."\t\t<meta property=\"og:image\" content=\"\">\n"
\           ."\n"
\           ."\t\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
\           ."\t\t<meta name=\"format-detection\" content=\"telephone=no\">\n"
\           ."\n"
\           ."\t\t<meta name=\"viewport\" content=\"width=device-width\">\n"
\           ."\t\t<link rel=\"stylesheet\" href=\"https://unpkg.com/ress/dist/ress.min.css\">\n"
\           ."\t\t<link rel=\"stylesheet\" href=\"\">\n"
\           ."\t</head>\n"
\           ."\n"
\           ."\t<body>\n"
\           ."\t\t${child}${cursor}\n"
\           ."\t</body>\n"
\           ."</html>"
\       }
\   }
\}





" ------------------------------------------------
" lightline.vim
" ------------------------------------------------

let g:lightline = {
\   'colorscheme' : 'solarized',
\   'mode_map'    : {'c': 'NORMAL'},
\   'active': {
\       'left': [
\           ['mode', 'paste'],
\           ['fugitive', 'gitgutter', 'filename']
\       ],
\       'right': [
\           ['lineinfo', 'syntastic'],
\           ['percent'],
\           ['charcode', 'fileformat', 'fileencoding', 'filetype']
\       ]
\   },
\   'component_function': {
\       'modified'      : 'MyModified',
\       'readonly'      : 'MyReadonly',
\       'fugitive'      : 'MyFugitive',
\       'filename'      : 'MyFilename',
\       'fileformat'    : 'MyFileformat',
\       'filetype'      : 'MyFiletype',
\       'fileencoding'  : 'MyFileencoding',
\       'mode'          : 'MyMode',
\       'syntastic'     : 'SyntasticStatuslineFlag',
\       'charcode'      : 'MyCharCode',
\       'gitgutter'     : 'MyGitGutter'
\   },
\   'separator': {'left': '⮀', 'right': '⮂'},
\   'subseparator': {'left': '⮁', 'right': '⮃'}
\}

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            let _ = fugitive#head()
            return strlen(_) ? '⭠ '._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
    return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
        return ''
    endif
    let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
        if hunks[i] > 0
            call add(ret, symbols[i] . hunks[i])
        endif
    endfor
    return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
    if winwidth('.') <= 70
        return ''
    endif

    " Get the output of :ascii
    redir => ascii
    silent! ascii
    redir END

    if match(ascii, 'NUL') != -1
        return 'NUL'
    endif

    " Zero pad hex values
    let nrformat = '0x%02x'

    let encoding = (&fenc == '' ? &enc : &fenc)

    if encoding == 'utf-8'
        " Zero pad with 4 zeroes in unicode files
        let nrformat = '0x%04x'
    endif

    " Get the character and the numeric value from the return value of :ascii
    " This matches the two first pieces of the return value, e.g.
    " "<F>  70" => char: 'F', nr: '70'
    let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

    " Format the numeric value
    let nr = printf(nrformat, nr)

    return "'". char ."' ". nr
endfunction





" ------------------------------------------------
" colorscheme
" ------------------------------------------------

" カラースキーマ（以下から選ぶ
"colorscheme molokai
"colorscheme Zenburn
"colorscheme hybrid
"colorscheme solarized
"colorscheme jellybeans
"colorscheme mopkai
colorscheme iceberg
"colorscheme pencil
