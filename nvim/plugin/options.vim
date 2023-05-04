"let mapleader = " "


set guifont=FiraCode-Retina:h12
" set macatsui


" By default timeoutlen is 1000 ms
set timeoutlen=500

set number
set relativenumber
"set mouse=a
set cursorcolumn
set cursorline
set termguicolors


" ignore filetype when file search
set wildignore+=*/tmp/*,*.so,*.swp,*.png,*.jpg,*.jpeg,*.gif,*.class,*.pyc,*.pyd

" command line lens menu
set wildmenu

" search
set hlsearch
set incsearch

" copy to system clipboard
vmap <leader>y "+y

" paste to vim register
nnoremap <leader>p "+p

" command to save file if changed
noremap <leader>s :update<CR>


" 自动缩进时,缩进长度为4
set shiftwidth=2
" 输入Tab字符时,自动替换成空格
set expandtab
" softtabstop的值为负数,会使用shiftwidth的值,两者保持一致,方便统一缩进.
set softtabstop=-1

" 设置 tab 字符的显示宽度为多少个空格
:set tabstop=2

nnoremap <silent><leader>:WhichKey '<Space>'<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
