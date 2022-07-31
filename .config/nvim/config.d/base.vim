
autocmd BufRead,BufNewFile * setlocal conceallevel=0

" STATUS LINE {{{
" :h mode() to see all modes
let g:currentmode={
            \ 'n':  'NORMAL ',
            \ 'no': 'N·OPERATOR PENDING ',
            \ 'v':  'VISUAL ',
            \ 'V':  'V·LINE ',
            \ '': 'V·BLOCK ',
            \ 's':  'SELECT ',
            \ 'S':  'S·LINE ',
            \ '': 'S·BLOCK ',
            \ 'i':  'INSERT ',
            \ 'R':  'REPLACE ',
            \ 'Rv': 'V·REPLACE ',
            \ 'c':  'COMMAND ',
            \ 'cv': 'VIM EX ',
            \ 'ce': 'EX ',
            \ 'r':  'PROMPT ',
            \ 'rm': 'MORE ',
            \ 'r?': 'CONFIRM ',
            \ '!':  'SHELL ',
            \ 't':  'TERMINAL '
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
    if (mode() =~# '\v(n|no)')
        exe 'hi! StatusLine guifg=#ffffff guibg=#222222'
    elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
        exe 'hi! StatusLine guibg=#87005f guifg=#ffffff'
    elseif (mode() ==# 'i')
        exe 'hi! StatusLine guifg=#000000 guibg=#00ff00'
    else
        exe 'hi! StatusLine guifg=#008080 guifg=#ffffff'
    endif

    return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
    endif
endfunction

function! GitInfo()
    let git = FugitiveHead()
    if git != ''
        return ' '.FugitiveHead()
    else
        return ''
    endif
endfunction

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %{GitInfo()}                        " Git Branch name: requires https://github.com/tpope/vim-fugitive
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)

hi User1 ctermfg=007
hi User2 ctermfg=008
hi User3 ctermfg=008
hi User4 ctermfg=008
hi User5 ctermfg=008
hi User7 ctermfg=008
hi User8 ctermfg=008
hi User9 ctermfg=007


" }}}

"   EASYMOTION ------------------------------------------------------------- {{{
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
map f <Plug>(easymotion-w)
map F <Plug>(easymotion-W)
map t <Plug>(easymotion-b)
map T <Plug>(easymotion-B)
map <leader>f <Plug>(easymotion-e)
map <leader>F <Plug>(easymotion-E)
map <leader>t <Plug>(easymotion-ge)
map <leader>F <Plug>(easymotion-gE)
map <leader>s <Plug>(easymotion-f)
map <leader>S <Plug>(easymotion-t)
"   }}}

" EASY ALIGN {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" FZF-VIM {{{
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-b']
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)

nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fp :Helptags<CR>
" }}}

" NERDCOMMENTER {{{
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
" }}}

" LUASNIPS {{{
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
" imap <silent><expr> <C-l> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <C-l> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" }}}

" VIMUX {{{
 " Prompt for a command to run
 map <Leader>vp :VimuxPromptCommand<CR>
 " Run last command executed by VimuxRunCommand
 map <Leader>vl :VimuxRunLastCommand<CR>
 " Inspect runner pane
 map <Leader>vi :VimuxInspectRunner<CR>
 " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>vq :VimuxCloseRunner<CR>
 " Interrupt any command running in the runner pane
 map <Leader>vx :VimuxInterruptRunner<CR>
 " Zoom the runner pane (use <bind-key> z to restore runner pane)
 map <Leader>vz :call VimuxZoomRunner()<CR>
 " Clear the terminal screen of the runner pane. 
map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>
" }}}
