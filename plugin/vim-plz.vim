function! CurrentFile() " {{{1
    let f = expand('%')
    return f
endfunction
" }}}

function! AffectedCurrent() " {{{1
    let f = CurrentFile()
    let t = QueryAffected([f])
    echom join(t)
    return t
endfunction
" }}}    

function! QueryAffected(...) " {{{1
    let t = join(a:000)
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

function! TestCurrentAffected() " {{{1
    let t = AffectedCurrent()
    let r = TestList(t)
    return r
endfunction

noremap <silent><buffer> <F9> :exec 'source '.bufname('%')<CR>
