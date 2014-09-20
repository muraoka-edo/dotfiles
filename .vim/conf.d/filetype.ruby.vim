filetype on
filetype plugin on
filetype indent on

autocmd BufRead,BufNewFile *_ss_spec.rb setfiletype ruby.serverspec
autocmd BufRead,BufNewFile *_spec.rb  set syntax=rspec
autocmd BufReadPost,BufNewFile *_spec.rb setlocal commentstring=#\ %s
autocmd BufRead,BufNewFile *.erb   setfiletype erb
autocmd BufRead,BufNewFile *.rhtml setfiletype erb

autocmd FileType ruby :map <C-t> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby :map <C-e> <ESC>:!ruby %<CR>
au BufNewFile,BufRead *.{erb,rhtml,rb}{,.in} set tabstop=2 shiftwidth=2 fileencoding=utf-8

"Skelton
augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *_spec.rb  0r ~/dotfiles/.vim/skel/rspec
    autocmd BufNewFile !*_spec.rb *.rb   0r ~/dotfiles/.vim/skel/rb
    autocmd BufNewFile *.erb  0r ~/dotfiles/.vim/skel/erb
    augroup END

"Dict
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'ruby' : '~/dotfiles/.vim/dict/ruby.dict',
        \ }
