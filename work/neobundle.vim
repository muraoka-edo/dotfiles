" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

filetype plugin indent off

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/dotfiles/.vim/conf.d/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/.vim/conf.d/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'open-browser.vim'
NeoBundle 'glidenote/serverspec-snippets'

filetype plugin indent on
