
function! close_scratch#exec(q_bang) abort
    let bnr = bufnr('%')
    if 0 <= index(term_list(), bnr)
        if term_getstatus(bnr) == 'finished'
            call s:close(a:q_bang)
        else
            call s:errormsg('It has not yet finished.')
        endif
    elseif 0 <= index(['quickfix', 'help', 'nofile'], &buftype)
        call s:close(a:q_bang)
    elseif &previewwindow
        call s:close(a:q_bang)
    else
        call s:errormsg('It is not finished terminal, quickfix, preview, scratch or help window.')
    endif
endfunction

function! s:errormsg(msg) abort
    echohl ErrorMsg
    echo a:msg
    echohl None
endfunction

function! s:close(q_bang) abort
    if a:q_bang == '!'
        close!
    else
        close
    endif
endfunction

