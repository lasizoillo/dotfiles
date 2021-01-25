set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
   silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | nested source $MYVIMRC 
endif 

" startup for vim-plug 
call plug#begin('~/.local/share/nvim/plugged')

" Completions and snippets
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'liuchengxu/vista.vim'
Plug 'pierreglaser/folding-nvim' 
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'prabirshrestha/async.vim'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-neosnippet'


" Helpers
"Plug 'sheerun/vimrc'
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/denite.nvim'
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'haya14busa/incsearch.vim'
"Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'edkolev/promptline.vim'
Plug 'kassio/neoterm'
"Plug 'hkupty/nvimux'

" IDE
Plug 'mhinz/vim-startify'
"Plug 'Shougo/vimfiler.vim'
Plug 'tomtom/tcomment_vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'euclio/gitignore.vim'
"Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
"Plug 'tpope/vim-dotenv'
Plug 'ajmwagar/vim-deus'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'airblade/vim-gitgutter'
"Plug 'miyakogi/seiya.vim'
"Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
call plug#end()

let mapleader = ","


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


let g:vista_executive_for = {
        \ 'cpp': 'vim_lsp',
        \ 'python': 'vim_lsp',
        \ }
let g:vista_ignore_kinds = ['Variable']


silent! nmap <Leader>t :NERDTreeToggle<CR>
silent! nmap <Leader>f :FZF<CR>
silent! nmap <Leader>n :Tags<CR>

