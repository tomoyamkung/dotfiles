"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath^=/home/vagrant/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('/home/vagrant/.vim/dein'))
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('Shougo/neosnippet.vim')

call dein#end()
filetype plugin indent on

if dein#check_install()
  call dein#install()
  endif
"End dein Scripts-------------------------

