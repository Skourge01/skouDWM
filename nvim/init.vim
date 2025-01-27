" Iniciar vim-plug
call plug#begin('~/.vim/plugged')

" Plugins recomendados
Plug 'junegunn/fzf.vim'               " Pesquisa rápida com fzf
Plug 'tpope/vim-fugitive'             " Controle de versão (git)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completação de código (LSP)
Plug 'preservim/nerdtree'             " Gerenciador de arquivos
Plug 'junegunn/goyo.vim'              " Modo distraction-free
Plug 'projekt0n/github-nvim-theme'    " Tema github
Plug 'vim-airline/vim-airline'        " Barra de status Airline
Plug 'vim-airline/vim-airline-themes'  " Temas para o Airline
Plug 'ThePrimeagen/vim-be-good' 
Plug 'tpope/vim-dispatch'
Plug 'voldikss/vim-floaterm'
" Finalizar vim-plug
call plug#end()

" Configurações adicionais
set background=dark
set relativenumber
set number relativenumber
set lazyredraw
nnoremap <C-p> :Files<CR>   " Abre o fzf
nnoremap <Leader>e :NERDTreeToggle<CR>  " Alternar NERDTree
nnoremap <C-s> :w<CR>
let g:airline_theme = 'luna'   " Definir o tema powerlineish para o airline

" Carregar o esquema de cores primeiro
syntax enable
set background=dark
colorscheme github_dark_default

" Mapeamentos para o NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>   " Alternar NERDTree
"autocmd vimenter * NERDTree          " Abrir o NERDTree automaticamente
autocmd bufwinleave * if !tabpagenr('$') | quit | endif  " Fechar NERDTree quando o último arquivo for fechado
vnoremap <C-c> "+y
nnoremap <C-v> "+p


