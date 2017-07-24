set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

"
" " will not be implemented
"
" " Respect modeline in files
" set modeline
" set modelines=4
" " Disable error bells
" set noerrorbells
" " Don’t show the intro message when starting Vim
" set shortmess=atI
" " Show the current mode
" set showmode
" " Use relative line numbers
" if exists("&relativenumber")
" 	set relativenumber
" 	au BufReadPost * set relativenumber
" endif
" " Save a file as root (,W)
" noremap <leader>W :w !sudo tee % > /dev/null<CR>
"
" " Not yet implemented
"
" " Strip trailing whitespace (,ss)
" function! StripWhitespace()
" 	let save_cursor = getpos(".")
" 	let old_query = getreg('/')
" 	:%s/\s\+$//e
" 	call setpos('.', save_cursor)
" 	call setreg('/', old_query)
" endfunction
" noremap <leader>ss :call StripWhitespace()<CR>
