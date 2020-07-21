
function! close_scratch#exec(q_bang) abort
    if close_scratch#is_target_buffer()
        call s:close(a:q_bang)
    else
        call s:errormsg('It is not finished terminal, quickfix, preview, scratch or help window.')
    endif
endfunction

function! close_scratch#is_target_buffer() abort
    let bnr = bufnr('%')
    if 0 <= index(term_list(), bnr)
        if term_getstatus(bnr) == 'finished'
            return v:true
        else
            return v:false
        endif
    elseif 0 <= index(['quickfix', 'help', 'nofile'], &buftype)
        return v:true
    elseif &previewwindow
        return v:true
    elseif !&modified && empty(bufname())
        return v:true
    else
        return v:false
    endif
endfunction

function! s:errormsg(msg) abort
    echohl ErrorMsg
    echo a:msg
    echohl None
endfunction

function! s:close(q_bang) abort
    if a:q_bang == '!'
        if (1 == winnr('$')) && (1 == tabpagenr('$'))
            quit!
        else
            close!
        endif
    else
        if (1 == winnr('$')) && (1 == tabpagenr('$'))
            quit
        else
            close
        endif
    endif
endfunction

