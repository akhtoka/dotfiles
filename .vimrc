" deinの設定を追加 

" dein settings {{{
if &compatible
  set nocompatible
endif
set runtimepath+=/Users/a_oka/.cache/dein/repos/github.com/Shougo/dein.vim

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep anaconda3)/bin/python") || echo -n $(which python3)')

" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update や call dein#clear_state を呼んでください。
" そもそもキャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。

" 2016.04.16 追記
" load_cache -> load_state
" save_cache -> save_state
" となり書き方が少し変わりました。
" 追記終わり

" vimprocだけは最初にインストールしてほしい

if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif
" }}}

set tabstop=4
set softtabstop=4
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set number
set backspace=start,eol,indent
set hlsearch
set ambiwidth=double
set clipboard+=unnamedplus
set mouse=a

colorscheme atom-dark 
" set termguicolors
syntax on

if has("autocmd")
    filetype on

    " set filetype=perl
    autocmd FileType php  setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType perl setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType rst setlocal ts=3 sts=3 sw=3 expandtab

    autocmd BufNewFile,BufRead *.rss setfiletype xml
    autocmd BufNewFile,BufRead *.psgi setfiletype perl
    autocmd BufNewFile,BufRead *.t setfiletype perl
    autocmd BufNewFile,BufRead *.psgi setfiletype perl
    autocmd BufNewFile,BufRead *.rst setfiletype rst
endif

" terminal modenの設定
tnoremap <silent> <ESC> <C-\><C-n>
