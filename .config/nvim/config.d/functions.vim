
" Carga una configuración de un archivo *.vim
function g:VimConfig(plugin)
    exec ':source ' . g:nvimPathConfig . a:plugin . '.vim'
endfunction

" Carga una configuración de un archivo *.lua
function g:LuaConfig(plugin)
    exec ':source ' . g:nvimPathConfig . a:plugin . '.lua'
endfunction

" Si se tiene una configuración extra en el proyecto con el nombre `.nvimrc` Se carga
function! LoadProjectVimrc()
    let vimrcFile = getcwd() . "/.nvimrc"

    if filereadable(expand(l:vimrcFile))
        execute ":source " . l:vimrcFile
        echom "Cargado archivo '" . l:vimrcFile . "'"
    endif
endfunction

" Borra los espacios de más al final de la línea en un archivo antes de guardar
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" No se cierra la ventana cuando se borra un buffer
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Restore cursor
function! ResCur()
    if line("'\"") <= line("$")
	silent! normal! g`"
	return 1
    endif
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return ' ! '
    endif
    return ''
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
