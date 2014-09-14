set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/conf.d/bundle/neobundle.vim/
  call neobundle#rc(expand('~/dotfiles/.vim/conf.d/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'rails.vim'
NeoBundle 'Gist.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'glidenote/serverspec-snippets'

filetype plugin indent on
