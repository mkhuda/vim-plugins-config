"""""""""""
" VIMKU
"""""""""""
" Edit vim config
let g:move_key_modifier = 'C'

" view line numbers
set number

" nerdtree open automatically at startup
au VimEnter *  NERDTree

" show typed command
set showcmd

" map all quit command
map <leader>. :qa!<cr>

" map MRU
map <C-l> :MRU<cr>

" split open terminal
map <leader>t :term++rows=13<cr>

" nerdTreeFocus
map <leader>' :NERDTreeFocus<cr>
" jsDoc configuration
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1

" prettify JSON
command! Json :%!python -m json.tool

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  CtrP Plugin
" =>  To let OpenFile on new Windows, instead opened in Nerdtree section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SwitchToWriteableBufferAndExec(command)
        let c = 0
        let wincount = winnr('$')
        " Don't open it here if current buffer is not writable (e.g. NERDTree)
        " while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
        while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
            exec 'wincmd w'
            let c = c + 1
        endwhile
        exec a:command
endfunction
let g:ctrlp_map = ''
nnoremap <C-f> :call SwitchToWriteableBufferAndExec('CtrlP')<CR>
nnoremap <C-l> :call SwitchToWriteableBufferAndExec('CtrlPMRUFiles')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtree Git Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fixing JS with Eslint
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \}
"let g:syntastic_javascript_checkers = ['jscs']

function! SwitchToProseMode()
  " setlocal formatoptions=ant
  " setlocal textwidth=80
  " setlocal wrapmargin=0
  :set formatoptions+=a
endfunction
command! FreeMode :call SwitchToProseMode()<CR>
