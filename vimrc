" vim: foldmethod=marker

" General {{{1
set encoding=utf-8
set clipboard=unnamed
syntax on
set number
set nowrapscan
set listchars=eol:$,space:.,tab:»-
nmap § :set list!<CR>
filetype indent plugin on
set hidden
command! -nargs=* Wrap set wrap linebreak nolist
set foldcolumn=4
set ts=2 sts=2 sw=2 noexpandtab "Default Tab/Whitespace"
colorscheme desert

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC

	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType Python setlocal ts=4 sts=4 sw=4 expandtab
endif

" Plugins {{{1
" NetRW {{{2
let g:netrw_liststyle=3
let g:netrw_banner=1
let g:netrw_browse_split=2
let g:netrw_winsize=15

" VimGo {{{2
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
if has("autocmd")
	autocmd FileType go nmap <Leader>b <Plug>(go-build)
	autocmd FileType go nmap <Leader>r <Plug>(go-run)
	autocmd FileType go nmap <Leader>t <Plug>(go-test)
	autocmd BufNewFile,BufRead *.go setlocal tabstop=4 shiftwidth=4
endif

" Status Line {{{1
set laststatus=2
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#
set statusline+=%R              " readonly flag
set statusline+=%M              " modified [+] flag
set statusline+=%#CursorLine#
set statusline+=\ %t\           " short file name
set statusline+=\ %3l:%-2c\     " line + column
set statusline+=%=              " right align
set statusline+=%#CursorLine#
set statusline+=\ %Y\           " file type
set statusline+=%#CursorIM#
set statusline+=%#Cursor#
set statusline+=\ %3p%%\        " percentage

