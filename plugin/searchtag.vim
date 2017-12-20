"参考:
"http://andrewradev.com/2011/06/08/vim-and-ctags/
"http://www.vim.org/scripts/script.php?script_id=3771
"差异点：同时搜索函数、类、常量等，匹配优化，生成tags命令

command! -nargs=1 F call s:FindInTaglist(<f-args>)
command! -nargs=? Fmake call s:TaglistMake(<f-args>)
command! -nargs=? Ffile call s:SearchAllFileNames(<f-args>)

function! FindInTaglistHere()
    call s:FindInTaglist(expand('<cword>'))
endfunction

function! s:TaglistMake(...)
    let cmd = 'ctags -R'
    if (a:0 == 1)
        let cmd = cmd.' --languages='.a:1
    endif
    echo '开始生成索引库......'
    call system(cmd)
    echohl WarningMsg | echo '生成完成 '.cmd | echohl None
endfunction

function! s:FindInTaglist(name)
    let tags = taglist('^'.a:name.'$')
    let tags = filter(tags, 'v:val["kind"] != "v"')

    if (empty(tags))
        echohl WarningMsg | echo '没有找到相关的定义' | echohl None
        return
    endif
    if (len(tags) == 1)
        if(tags[0].filename != buffer_name('%'))
            execute 'tabnew '.tags[0].filename
        endif
        let cmd = escape(strpart(tags[0].cmd, 2, strlen(tags[0].cmd) - 4), '*')
        execute '/'.cmd
        return
    endif

    "打开quickfix
    let quickfix = []
    for i in tags
        let pattern = escape(strpart(i.cmd, 2, strlen(i.cmd) - 4), '*')
        call add(quickfix, {'pattern' : pattern, 'filename' : i.filename, 'text' : i.kind})
    endfor

    call setqflist(quickfix)
    tabnew
    "tabdo cclose
    copen
    execute 'resize '.(len(quickfix) < 5 ? 5 : 10)
    cfirst
endfunction

function! ShowSearchFile()
    let fileName = getline('.')
   " execute 'edit '.fileName
    execute ':nohls\n'
endfunction

function! s:SearchAllFileNames(...)
        if buffer_name('%') != ''
                tabnew
        endif

        let cmd = 'find ./ -type f |grep -v ".//.svn/"'
        if a:0 == 1
                let cmd = cmd.' | grep '.a:1
        endif

        setlocal modifiable
        execute 'delete '.line('$')
        execute '0 read !'.cmd
        goto 1
        setlocal nobuflisted
        setlocal buftype=nofile
        setlocal nomodifiable
        setlocal cursorline
        setlocal statusline=\ [%L]\ Files
        map <buffer> <CR> :execute 'edit '.getline('.')<CR>
        map <buffer> o :execute 'edit '.getline('.')<CR>
        map <buffer> t :execute 'tabnew '.getline('.')<CR>
endfunction



