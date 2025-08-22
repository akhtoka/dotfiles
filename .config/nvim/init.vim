" deinの設定を追加 

" dein settings {{{
if &compatible
  set nocompatible
endif
" (1) activateした仮想環境があればそちらを参照し、ない場合はデフォルトの仮想環境を参照
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
else
    let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
    " QuickRun実行時対応
    let $PATH = $HOME . '/.pyenv/versions/neovim3/bin:' . $PATH
endif

" (2) 管理プラグイン「dein」を使用するための設定
" Add the dein installation directory into runtimepath
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add(s:dein_repo_dir)
   
  " TOML を読み込み、キャッシュしておく
  let g:rc_dir    = $XDG_CONFIG_HOME . '/nvim/dein'
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif


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
set binary noeol

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
" colorscheme tender

if has("autocmd")
    filetype on

    " set filetype=perl
    autocmd FileType perl setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType sql  setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType rst  setlocal ts=3 sts=3 sw=3 expandtab
    autocmd FileType go   setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab

    autocmd BufNewFile,BufRead *.rss setfiletype xml
    autocmd BufNewFile,BufRead *.psgi setfiletype perl
    autocmd BufNewFile,BufRead *.t setfiletype perl
    autocmd BufNewFile,BufRead *.psgi setfiletype perl
    autocmd BufNewFile,BufRead *.rst setfiletype rst
    autocmd BufNewFile,BufRead *.tf setfiletype yaml
endif

" terminal modenの設定
tnoremap <silent> <ESC> <C-\><C-n>

" keymapping 設定
" Esc をCtrl + j に
imap <C-j> <esc>
noremap! <C-j> <esc>

let mapleader = "\<Space>"

" GO LSP
if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

" pylsの設定。LinterのON/OFFなどが可能
let s:pyls_config = {'pyls': {'plugins': {
	  \ 'pycodestyle': {'enabled': v:true},
	  \ 'pydocstyle': {'enabled': v:true},
	  \ 'pylint': {'enabled': v:false},
	  \ 'flake8': {'enabled': v:true},
	  \ 'jedi_definition': {
	  \   'follow_imports': v:true,
	  \   'follow_builtin_imports': v:true,
	  \ },
	  \ }}}

" pylsの起動定義
if (executable('pyls'))
	augroup LspPython
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'pyls',
			\ 'cmd': { server_info -> ['pyls'] },
			\ 'whitelist': ['python'],
			\ 'workspace_config': s:pyls_config
			\})
	augroup END
endif

nmap <silent> <Leader>d :LspDefinition<CR>
nmap <silent> <Leader>p :LspHover<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
nmap <silent> <Leader>s :split \| :LspDefinition <CR>
nmap <silent> <Leader>v :vsplit \| :LspDefinition <CR>
