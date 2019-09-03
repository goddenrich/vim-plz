function! CurrentFile() " {{{1
    let f = expand('%')
    echom f
    return f
endfunction
" }}}

function! CurrentDir() " {{{1
    let d = expand('%:h')
    echom d
    return d
endfunction
" }}}

function! QueryAffected(files) " {{{1
    let t = join(a:files)
    let cmd = "plz query affectedtargets " . t
    let l = systemlist(cmd)
    return l
endfunction
" }}}    

function! QueryAffectedCurrent() " {{{1
    let f = CurrentFile()
    let t = QueryAffected([f])
    return t
endfunction
" }}}    

function! BuildList(targetlist) " {{{1
    let t = join(a:targetlist)
    let r = systemlist('plz build ' . t)
    for i in r
        echom i
    endfor
    return r
endfunction
" }}}

function! BuildAffectedCurrent() " {{{1
    let t = QueryAffectedCurrent()
    let r = BuildList(t)
    return r
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
    let t = QueryAffectedCurrent()
    let r = TestList(t)
    return r
endfunction
" }}}

function! CoverList(targetlist) " {{{1
    let t = join(a:targetlist)
    let r = systemlist('plz cover ' . t)
    for i in r
        echom i
    endfor
    return r
endfunction
" }}}

function! CoverAffectedCurrent() " {{{1
    let t = QueryAffectedCurrent()
    let r = CoverList(t)
    return r
endfunction
" }}}

function! Run(target) " {{{1
    let r = systemlist('plz run ' . target)
    for i in r
        echom i
    endfor
    return r
endfunction
" }}}

noremap <silent><buffer> <F9> :exec 'source '.bufname('%')<CR>
