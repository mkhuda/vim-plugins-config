set shell=/bin/bash
"""""""""""
" VIMKU
"""""""""""
" Edit vim config
let g:move_key_modifier = 'C'

" view line numbers
set number

" nerdtree open automatically at startup
" au VimEnter *  NERDTree

" show typed command
set showcmd

" map all quit command
map <leader>. :qa!<cr>

" map MRU
map <C-l> :MRU<cr>

" split open terminal
map <leader>t :term++rows=13<cr>

" new nerdTreeToggle
map <leader>; :NERDTreeToggle<cr>

" Goyo
map <leader>0 :Goyo<cr>

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
" autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
"

" prettier config
" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'false'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon

" cli-override|file-override|prefer-file

" always|never|preserve
let g:prettier#autoformat = 0
let g:prettier#config#parser = 'babylon'
nmap <Leader>py <Plug>(Prettier)
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" vim es6 unused import
let g:es6_imports_gui_fg_color = 'black'
let g:es6_imports_gui_bg_color = 'yellow'
autocmd BufWinEnter *.js,*.jsx,*.ts,*.tsx execute "ES6ImportsHighlight"
autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx execute "ES6ImportsHighlight"
" language server for reasonml
let g:LanguageClient_serverCommands = {
    \ 'reason': ['/Users/ruangguru/Documents/reason-language-server']
    \ }
