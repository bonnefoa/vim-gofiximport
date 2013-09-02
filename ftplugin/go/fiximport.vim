"
" fiximport.vim: Vim command to resolve import on Go files with gofiximport.
"
" This filetype plugin add a new commands for go buffers:
"
"   :FixImport
"
"       Add unambiguous imports and remove unused imports from go file
"
" Install fix import with 'go get github.com/bonnefoa/gofiximport'
" $GOPATH/bin should be in PATH
"
" To fix import on save, add this in your vimrc
" autocmd FileType go autocmd BufWritePre <buffer> FixImport

if exists("b:did_ftplugin_go_fiximport")
    finish
endif

if !executable("gofiximport")
    finish
end

command! -buffer FixImport call s:GoFixImport()

function! s:GoFixImport()
    let view = winsaveview()
    silent execute '%!gofiximport -file' expand('%')
    if v:shell_error
        let format_error = join(getline(line("'["), line("']")), "\n")
        undo
        echo format_error
        echohl Error | echomsg "fiximport returned error" | echohl None
    endif
    call winrestview(view)
endfunction

let b:did_ftplugin_go_fiximport = 1

" vim:ts=4:sw=4:et
