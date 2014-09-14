"filetype plugin on
"autocmd FileType python :map <C-t> <ESC>:!pychecker %
autocmd FileType python :map <C-e> <ESC>:!python %<CR>
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python let  g:pydiction_location = '/dotfiles/.vim/tool/ftplugin/python_pydiction.vim'
function! s:ExecPy()
    exe "!" . &ft . " %"
    :endfunction
    command! Exec call ExecPy()
    autocmd FileType python map   :call ExecPy()

"  Skel
augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.*py  0r ~/dotfiles/.vim/skel/py
    augroup END

