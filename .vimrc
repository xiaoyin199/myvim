" 设置使用ctags
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
							
" ---------------------------------------------------------------------------vim基础配置,快捷键配置----------------------------------------------------------------------------
" 基础配置
" 设置编码
language messages zh_CN.utf-8
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
" 不让vim发出讨厌的滴滴声 
set noerrorbells 
" 开启语法高亮显示
syntax on
" 默认启用行号
set nu
" 高亮显示查找结果
set hlsearch
" 高亮显示当前行
set cul
" 高亮显示当前列
" set cuc
" 高亮显示匹配的括号 
"set showmatch 
" 总是显示状态行 
set laststatus=2
" 右下角显示，命令快捷键
set showcmd
" 空格代替tab
set expandtab
" 继承前一行的缩进方式，特别适用于多行注释
set autoindent
" 制表符为4 
set tabstop=4 
" 统一缩进为4
set softtabstop=4 
set shiftwidth=4

" 快捷键
" 自定义查找tags函数
map <F3> :call FindInTaglistHere()<CR>
" 自定义关闭
map q :q<CR>
" 自定义强制关闭
map ,q :q!<CR>
" 自定义保存
map w :w<CR>
" 自定义保存退出
map ,w :wq<CR>
" 向右切换标签
nnoremap K gt
" 向左切换标签
nnoremap J gT
" phpdoc插件，生成注释
map <F12> :call PhpDocSingle()<CR> 
" svn更新代码
map <F8> :!svn up<CR><CR>
" quickfix插件，改造成跳转函数的查询快捷键
" 查询结果向下选择
map ,j :cn<CR>
" 查询结果向上选择
map ,k :cp<CR>
"---------------------------------------------------------------------------vim基础配置,快捷键配置----------------------------------------------------------------------------

" 启动pathogen插件管理器
execute pathogen#infect()
filetype plugin on

" tagbar插件配置
" 设置tagbar的窗口宽度
let g:tagbar_width=30
"设置tagbar的窗口显示的位置,为左边
"let g:tagbar_left=1
"设置tagbar的窗口显示的位置,为右边
let g:tagbar_right=2
"映射tagbar的快捷键
map <F2> :TagbarToggle<CR>
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0
"打开文件自动 打开tagbar
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.php,*.json call tagbar#autoopen()

" NERDTree目录树配置
" 定义快捷键
map <F1> :NERDTreeToggle<CR>
" 定位当前打开文件的位置
map <F4> :NERDTreeFind<CR>
" 是关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" 打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree


" YouCompleteMe插件配置
let g:ycm_server_python_interpreter='/usr/bin/python'
" 配置文件
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" 支持php
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" 开启关键字语法检测
let g:ycm_seed_identifiers_with_syntax = 1
" 自动触发补全
let g:ycm_auto_trigger = 1
" 关闭加载.ycm_extra_conf.py提示
" let g:ycm_confirm_extra_conf=0
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
  
" NERD_commenter插件配置，注释代码用
let mapleader = ','

" EasyMotion光标快速定位插件
let g:EasyMotion_leader_key = '.'
