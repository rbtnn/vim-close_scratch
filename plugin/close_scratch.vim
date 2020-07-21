
scriptencoding utf-8

let g:loaded_close_scratch = 1

if get(g:, 'close_scratch_define_commands', 1)
    command! -nargs=0 -bar -bang CloseScratch  :call close_scratch#exec(<q-bang>)
endif

if get(g:, 'close_scratch_define_augroup', 0)
    augroup close_scratch
        autocmd!
        autocmd FileType   * :nnoremap <buffer><nowait>q      :<C-u>call close_scratch#exec('')<cr>
    augroup END
endif
