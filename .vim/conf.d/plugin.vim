"--- Plugin ---------------------------
"Shougo/neocomplete (if_luaが有効ならneocompleteを使う)
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
  let g:neocomplete#enable_at_startup  = 1 
  let g:neocomplete#enable_ignore_case = 0 
  let g:neocomplete#enable_smart_case  = 1 
  let g:neocomplete#enable_quick_case  = 1 
  let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\'
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  let g:neocomplete#max_list = 25
endif

"Shougo/neocomplete (dictionary)
let g:neocomplete#sources#dictionary#dictionaries = { 
    \ 'default' : '', 
    \ 'ruby' : '~/dotfiles/.vim/dict/ruby.dict',
    \ }

"Shougo/neosnippet -------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"glidenote/serverspec-snippets --------
let g:neosnippet#snippets_directory = [ 
  \'~/dotfiles/.vim/snippets',
  \'~/dotfiles/.vim/conf.d/bundle/serverspec-snippets',
  \]

"Color (solarized)
if filereadable(expand('~/dotfiles/.vim/conf.d/bundle/vim-colors-solarized/colors/solarized.vim'))
  syntax enable
  set background=dark
  colorscheme solarized
endif
