"--------------------------------------------------
" 基本配置
"--------------------------------------------------
set langmenu=zh_CN.UTF-8                            " 菜单语言
set fileencodings=utf-8,gbk,ucs-bom,cp936           " 支持的文件编码
set fileencoding=utf-8                              " 保存的编码格式
set vb t_vb=                                        " 关闭出错时的提示声音及屏幕闪烁
set t_Co=256                                        " 配色方案使用256色
set history=256                                     " vim保存的历史记录数
set bdir=~/vimfiles/backup                          " 备份文件目录
set nocompatible                                    " 不使用vi的键盘模式
set hidden                                          " 允许切换buffer时不保存当前buffer
set backspace=indent,eol,start                      " 退格键删除的字符
set ww=h,l,<,>,[,]                                  " 设置whichwrap的值
set autochdir                                       " 切换当前目录为当前文件所在的目录
set ruler                                           " 显示光标位置
set showcmd                                         " 显示未完成命令
set laststatus=2                                    " 显示状态栏
set nu                                              " 显示行号
set fillchars+=vert:\                               " 分割栏使用空格符号
set autoindent                                      " 换行自动缩进
set noexpandtab                                     " 不用空格代替制表符
set tabstop=4                                       " tab宽度
set softtabstop=4                                   " 退格删除4个空格
set shiftwidth=4                                    " 每层缩进空格数
set noshowmatch                                     " 不匹配对应括号
set ignorecase                                      " 搜索时忽略大小写
set incsearch                                       " 搜索时搜索的内容全高亮，默认为首字母高亮
set fileformat=unix                                 " 设置换行符类型
set tags=./tags;/                                   " 从当前目录开始往上层递归查找ctags文件
set wildmenu                                        " 命令行自动完成操作
set backup                                          " 备份文件

let mapleader=","                                   " 设置mapleader
let loaded_matchparen=0                             " 取消匹配括号高亮显示，伤眼
let &termencoding=&encoding                         " 用于屏幕显示的编码

syntax enable                                       " 代码高亮

filetype off                                        " 关闭侦测文件类型

language message zh_CN.utf-8                        " 提示信息编码为utf-8

"--------------------------------------------------
" 快捷键相关
"--------------------------------------------------
map <Leader>md :e ++ff=unix %<CR>                   " <leader>md显示windows换行符
map <Leader>ms :%s/<C-V><C-M>/g<CR>                 " <Leader>ms除去windows换行符，需先显示
map <F5> :!php -q <C-R>%<CR>                        " 执行php代码

" 禁用邪恶的方向键
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"--------------------------------------------------
" 加载插件及配色
"
" 注意：
" 1、载入配色需在hi之前，否则hi无效
"--------------------------------------------------
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc('~/vimfiles/bundle/')

" 管理插件的插件 {{{
    Bundle 'gmarik/vundle'
" }}}

" molokai配色 {{{
    Bundle 'tomasr/molokai'
    let g:molokai_original=1                      " 传统molokai背景色，深灰非黑
    color molokai

    " 终端下使用
    " let g:rehash256=1
" }}}

" VIM状态栏 {{{
    Bundle 'Lokaltog/powerline'

    set rtp+=~/vimfiles/bundle/powerline/powerline/bindings/vim/
" }}}

" 代码提示 {{{
    Bundle 'Shougo/neocomplcache'

    let g:neocomplcache_enable_at_startup=1         " 启用neocomplcache
" }}}

" 快速生成代码段 {{{
    Bundle 'Shougo/neosnippet'

    " 自定义 snippets目录
    let g:neosnippet#snippets_directory='~/vimfiles/snippets'

    " 使用tab键展开snippets及在占位符间跳跃
    imap <expr><TAB> neosnippet#expandable_or_jumpable()
        \ ? "\<Plug>(neosnippet_expand_or_jump)"
        \ : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable()
        \ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
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

    let g:tagbar_width=40                           " 宽度（字符宽度）
    let g:tagbar_sort=0                             " 按出现顺序排序
    let g:tagbar_singleclick=1                      " 单击展开
    let g:tagbar_iconchars=['+','-']                " 代表展开收缩的图标

    map <Leader>tb :TagbarToggle<CR>                      " F7快捷键
" }}}

" ZenCoding （Emmet） {{{
    Bundle 'mattn/zencoding-vim'

    let g:user_zen_settings={
    \   'lang': 'zh-CN',
    \   'html': {
    \       'empty_element_suffix': '>',
    \   },
    \   'php': {
    \       'extends' : 'html',
    \   },
    \}
" }}}

" 搜索 {{{
    Bundle 'mileszs/ack.vim'
" }}}

" 快速注释 {{{
    Bundle 'scrooloose/nerdcommenter'

    let g:NERDSpaceDelims=1                         " 注释符与注释内容间保留一个空格
" }}}

" 显示目录树 {{{
    Bundle 'scrooloose/nerdtree'

    let g:NERDTreeWinSize=31                      " 宽度
    let g:NERDTreeWinPos="right"                  " 在右侧显示
    let NERDTreeShowBookmarks=1                   " 默认显示所有标签
    let NERDTreeShowHidden=1                      " 默认显示隐藏文件

    map <Leader>nt :NERDTreeToggle<CR>            " 快捷键
" }}}

" 显示buffer列表 {{{
    Bundle 'bufexplorer.zip'

    let g:bufExplorerShowNoName=1                   " 显示NoName的buffer
    let g:bufExplorerSortBy='number'                " 按序号排列buffer
    let g:bufExplorerSplitBelow=1
    let g:bufExplorerSplitRight=1
" }}}

" 关闭buffer而保留windows {{{
    " Bundle 'bufkill.vim'
" }}}

filetype plugin indent on                           " 必须位于bundle之后

"--------------------------------------------------
" autocmd
"--------------------------------------------------
" autocmd BufWritePre * :%s/\s\+$//e                " 保存buffer时删除行末空格

" 格式化代码，包括换行不补全注释符
autocmd BufNewFile,BufRead * set formatoptions=tcqMn

" markdown文件设置
autocmd BufNew,BufNewFile,BufRead *.md,*.markdown setlocal ft=markdown

" 不同文件类型采用不同的缩进
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype markdown setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype vim setlocal ts=4 sts=4 sw=4 expandtab
" 必须位于bundle之后才生效，可能与某个bundle冲突
autocmd Filetype snippet setlocal ts=4 sts=4 sw=4 noexpandtab
