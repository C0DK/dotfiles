call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
call plug#end()

let g:deoplete#enable_at_startup = 1

:let g:notes_directories = ['~/Documents/Notes']


let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

set number
