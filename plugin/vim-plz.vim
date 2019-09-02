function! CurrentFile() " {{{1
    let f = expand('%')
    echom f
    return f
endfunction
" }}}

function! QueryAffectedCurrent() " {{{1
    let f = CurrentFile()
    let t = QueryAffected([f])
    return t
endfunction
" }}}    

function! QueryAffected(files) " {{{1
    let t = join(a:files)
    let cmd = "plz query affectedtargets " . t
    let l = systemlist(cmd)
    echom join(l)
    return l
endfunction
" }}}    

function! TestList(targetlist) " {{{1
    let t = join(a:targetlist)
    let r = systemlist('plz test ' . t)
    for i in r
        echom i
    endfor
    return r
endfunction
" }}}

function! TestAffectedCurrent() " {{{1
    let t = QueryCurrentAffected()
    let r = TestList(t)
    return r
endfunction
" }}}

noremap <silent><buffer> <F9> :exec 'source '.bufname('%')<CR>
