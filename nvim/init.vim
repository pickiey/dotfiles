" dein settings {{{
if &compatible
    set nocompatible
endif

" dein.vimのディレクトリ
let s:dein_dir      = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" deinのパス通し
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " 管理するプラグインを記述したファイル
    let s:toml = '~/.dotfiles/nvim/dein.toml'
    let s:lazy_toml = '~/.dotfiles/nvim/dein_lazy.toml'
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" 未インストールのチェック
if dein#check_install()
    call dein#install()
endif
" }}}



" 基本設定
source $HOME/.dotfiles/nvim/base.vim



" プラグインに依存する設定
source $HOME/.dotfiles/nvim/plugins.vim
