"Filetype"
filetype on
filetype plugin on
filetype indent on

"Ctrl+T: Syntax Check"
autocmd FileType   sh :map <C-t> <ESC>:!bash -n %<CR>
"Ctrl+E: Execute Program"
autocmd FileType   sh :map <C-e> <ESC>:!bash %<CR>

"Markdown"
autocmd BufRead,BufNewFile *.mkd  setfiletype md
autocmd BufRead,BufNewFile *.mkdn setfiletype md
autocmd BufRead,BufNewFile *.md   setfiletype md

"Skelton"
augroup SkeletonAu
  autocmd!
  autocmd BufNewFile *.*sh  0r ~/dotfiles/.vim/skel/bash
  autocmd BufNewFile *.html 0r ~/dotfiles/.vim/skel/html
  autocmd BufNewFile *.md   0r ~/dotfiles/.vim/skel/md
  augroup END
