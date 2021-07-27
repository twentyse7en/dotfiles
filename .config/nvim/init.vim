set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set clipboard+=unnamedplus
set foldmethod=marker
set list
set listchars=tab:▏\ ,trail:𝁢
set inccommand=split
set cmdheight=2

call plug#begin(stdpath("data") . "/plugged")

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'
Plug 'glepnir/lspsaga.nvim'

" Useful
Plug 'tweekmonster/startuptime.vim'

" devicons
Plug 'kyazdani42/nvim-web-devicons'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

" Themes
Plug 'dracula/vim'
Plug 'folke/tokyonight.nvim'
Plug 'gruvbox-community/gruvbox'

" jab
Plug 'mattn/emmet-vim'

call plug#end()


" Colorscheme {{{
let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = v:false
let g:tokyonight_italic_comments = v:true

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme tokyonight
highlight Normal guibg=None
" }}}

" Lua {{{
lua require("configs")
" }}}

let mapleader = " "

" Keys {{{
" window movements -------
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

nnoremap <leader>= <C-W>5>
nnoremap <leader>- <C-W>5<

nnoremap <leader>H <C-W>H
nnoremap <leader>J <C-W>J
nnoremap <leader>K <C-W>K
nnoremap <leader>L <C-W>L

" telescope movements ----
nnoremap <leader>pw <cmd>lua require('telescope.builtin').live_grep{}<CR>
" nnoremap <leader>pc :Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>
" nnoremap <leader>pc <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending"})<CR>
" nnoremap <leader>pc <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy())<CR>
nnoremap <leader>pc <cmd>lua require("configs.telescope").curr_buff()<CR>
nnoremap <leader>pb <cmd>:Telescope buffers<CR>
noremap <leader>ff :Telescop find_files<CR>

"mapping ------------------------

nnoremap <leader><CR> :so %<CR>
nnoremap <leader>pv   :Vex<CR>


" }}}

let g:netrw_banner=0
let g:user_emmet_leader_key="<C-Y>"


" Augroups {{{
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

fun! JournalMode()
	execute 'normal gg'
	let filename = '#' . ' ' . expand('%:r')
	call setline(1, filename)
	call setline(2, system('fortune'))
	execute 'normal o'
endfun

augroup FRIDAY
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

augroup templates
	autocmd!
	autocmd BufNewFile *.sh 0r ~/.config/nvim/template/skeleton.sh
augroup END

augroup journal
	autocmd VimEnter */log/** 0r ~/.config/nvim/template/journal.md
	autocmd VimEnter */log/** :call JournalMode()
	autocmd VimEnter */log/** set complete=k~/Documents/log/**/*
augroup end
" }}}