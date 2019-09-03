# vim-plz
a vim plugin for the please build system

## Functionality

Currently not much going on... still in early development

To do actions on the targets that are affected by the file currently in your buffer:

    :call TestAffectedCurrent()
    :call BuildAffectedCurrent()
    :call CoverAffectedCurrent()

These can be mapped eg.

    nnoremap <leader>pt :call TestAffectedCurrent()<CR>
    nnoremap <leader>pt :call BuildAffectedCurrent()<CR>
    nnoremap <leader>pt :call CoverAffectedCurrent()<CR>
