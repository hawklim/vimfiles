"--------------------------------------------------
" 基本配置
"--------------------------------------------------
set langmenu=zh_CN.UTF-8                            " 菜单语言
set fileencodings=utf-8,gbk,ucs-bom,cp936           " 支持的文件编码
set fileencoding=utf-8                              " 保存的编码格式
" set t_Co=256                                      " 配色方案使用256色
set history=256                                     " vim保存的历史记录数
set nocompatible                                    " 不使用vi的键盘模式
set hidden                                          " 允许切换buffer时不保存当前buffer
set backspace=indent,eol,start                      " 退格键删除的字符
set ww=h,l,<,>,[,]                                  " 设置whichwrap的值
set autochdir                                       " 切换当前目录为当前文件所在的目录
set guioptions-=T                                   " 隐藏工具栏
set ruler                                           " 显示光标位置
set showcmd                                         " 显示未完成命令
set laststatus=2                                    " 显示状态栏
set nu                                              " 显示行号
set autoindent                                      " 换行自动缩进
set noexpandtab                                     " 不用空格代替制表符
set tabstop=4                                       " tab宽度
set softtabstop=4                                   " 退格删除4个空格
set shiftwidth=4                                    " 每层缩进空格数
set noshowmatch                                     " 不匹配对应括号
set ignorecase                                      " 搜索时忽略大小写
set incsearch                                       " 搜索时搜索的内容全高亮，默认为首字母高亮
set nowrapscan                                      " 搜索到文件末后不返回文件头
set fileformat=unix                                 " 设置换行符类型
set tags=./tags;/                                   " 从当前目录开始往上层递归查找ctags文件
set statusline=%F%m%r%h%w\ %=[%{&ff}]\ %{\"[\".(&fenc==\"\"?&enc:&fenc)
    \.((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ [%Y]\ [%l,%v]\ [%p%%]
set wildmenu                                        " 命令行自动完成操作
set backup                                          " 备份文件

let mapleader=","                                   " 设置mapleader
let loaded_matchparen=0                             " 取消匹配括号高亮显示，伤眼
let &termencoding=&encoding                         " 用于屏幕显示的编码

syntax enable                                       " 代码高亮

filetype off                                        " 关闭侦测文件类型

" 格式化代码，包括换行不补全注释符
autocmd BufNewFile,BufRead * set formatoptions=tcqMn

" 不同文件类型采用不同的缩进
" autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
" autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
" autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
" autocmd Filetype vim setlocal ts=4 sts=4 sw=4 expandtab

"--------------------------------------------------
" Linux与Windows下有差异的配置
"--------------------------------------------------
if has("win32")
    set bdir=$VIM/vimfiles/backup                   " 备份文件所在的路径

    language message zh_CN.gbk                      " 提示信息编码为gbk

    autocmd GUIEnter * simalt ~x                    " GVim最大化
else
    set bdir=~/vimfiles/backup

    language message zh_CN.utf-8                    " 提示信息编码为utf-8

    autocmd GUIEnter * winsize 300 100              " GVim最大化
endif

"--------------------------------------------------
" 扩展功能
"--------------------------------------------------
map <Leader>md :e ++ff=unix %<CR>                   " <leader>md显示windows换行符
map <Leader>ms :%s/<C-V><C-M>/g<CR>                 " <Leader>ms除去windows换行符，需先显示
map <F5> :!php -q <C-R>%<CR>                        " 执行php代码

" 禁用邪恶的方向键
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" autocmd BufWritePre * :%s/\s\+$//e                " 保存buffer时删除行末空格

"--------------------------------------------------
" 加载插件及配色
"
" 注意：
" 1、载入配色需在hi之前，否则hi无效
"--------------------------------------------------
if has("win32")
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
else
    set rtp+=~/vimfiles/bundle/vundle/
    call vundle#rc('~/vimfiles/bundle/')
endif

" 管理插件的插件 {{{
    Bundle 'gmarik/vundle'
" }}}

" molokai配色 {{{
    Bundle 'tomasr/molokai'
    let g:molokai_original = 1                      " 传统molokai背景色，深灰非黑
    color molokai

    " 终端下使用
    " let g:rehash256 = 1
    " set background=dark
" }}}

" 代码提示 {{{
    Bundle 'Shougo/neocomplcache'

    let g:neocomplcache_enable_at_startup=1         " 启用neocomplcache
" }}}

" 快速生成代码段 {{{
    Bundle 'Shougo/neosnippet'

    " 自定义 snippets目录
    if has("win32")
        let g:neosnippet#snippets_directory='$VIM/vimfiles/snippets'
    else
        let g:neosnippet#snippets_directory='~/vimfiles/snippets'
    endif

    " 使用tab键展开snippets及在占位符间跳跃
    imap <expr><TAB> neosnippet#expandable_or_jumpable()
        \ ? "\<Plug>(neosnippet_expand_or_jump)"
        \ : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable()
        \ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " 控制snippets中占位符的显示
    " if has('conceal')判断编译Vim时是否加入conceal选项
    " if has('conceal')
        " set conceallevel=2 concealcursor=nvi
    " endif
" }}}

" 自动判断使用tab还是空格缩进 {{{
    Bundle 'ciaranm/detectindent'

    let g:detectindent_preferred_expandtab = 0      " 默认不将tab转换成空格
    let g:detectindent_preferred_indent = 4         " 默认的缩进位数
    let g:detectindent_max_lines_to_analyse = 1024  " 分析行数

    autocmd BufReadPost * :DetectIndent
" }}}

" 对齐 {{{
    Bundle 'godlygeek/tabular'
" }}}

" 括号补全 {{{
    Bundle 'jiangmiao/auto-pairs'
" }}}

" 快速打开文件 {{{
    Bundle 'kien/ctrlp.vim'

    let g:ctrlp_working_path_mode=2                 " 设置ctrlp工作目录
" }}}

" 快速在文件中的函数、方法、变量中跳转 {{{
    Bundle 'majutsushi/tagbar.git'

    " windows下制定ctags.exe路径
    if has("win32")
        let g:tagbar_ctags_bin='$VIM/vimfiles/bundle/ctags.exe/ctags.exe'
    endif

    let g:tagbar_width=40                           " 宽度（字符宽度）
    let g:tagbar_sort=0                             " 按出现顺序排序
    let g:tagbar_singleclick=1                      " 单击展开
    let g:tagbar_iconchars=['+','-']                " 代表展开收缩的图标

    map <F7> :TagbarToggle<CR>                      " F7快捷键
" }}}

" 快速注释 {{{
    Bundle 'scrooloose/nerdcommenter'

    let g:NERDSpaceDelims=1                         " 注释符与注释内容间保留一个空格
" }}}

" 显示目录树 {{{
    Bundle 'scrooloose/nerdtree'

    let g:NERDTreeWinSize=31                        " 宽度
    let g:NERDTreeWinPos="right"                    " 在右侧显示

    map <F8> :NERDTreeToggle<CR>                    " F8快捷键
" }}}

" 显示buffer列表 {{{
    Bundle 'bufexplorer.zip'

    let g:bufExplorerShowNoName=1                   " 显示NoName的buffer
    let g:bufExplorerSortBy='number'                " 按序号排列buffer
    let g:bufExplorerSplitBelow=1
    let g:bufExplorerSplitRight=1
" }}}

" 查找功能 {{{
    Bundle 'grep.vim'
" }}}

if has("win32")
" ctags.exe {{{
    Bundle 'ctags.exe'
" }}}
endif

filetype plugin indent on                           " 必须位于Bundle之后
