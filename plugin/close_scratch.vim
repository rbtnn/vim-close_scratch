
scriptencoding utf-8

let g:loaded_close_scratch = 1

if get(g:, 'close_scratch_define_commands', 1)
    command! -nargs=0 -bar -bang CloseScratch  :call close_scratch#exec(<q-bang>)
endif

