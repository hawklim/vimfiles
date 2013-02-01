"--------------------------------------------------
" 基本配置
"--------------------------------------------------
set langmenu=zh_CN.UTF-8                        " 菜单语言
set fileencodings=utf-8,gbk,ucs-bom,cp936       " 支持的文件编码
set fileencoding=utf-8                          " 保存的编码格式
set history=256                                 " vim保存的历史记录数
set nocompatible                                " 不使用vi的键盘模式
set hidden                                      " 允许切换buffer时不保存当前buffer
set noerrorbells                                " 关闭出错时的提示声音
set t_vb=                                       " 使用屏幕闪烁代替bell
set novisualbell                                " 屏幕不要闪烁
set backspace=indent,eol,start                  " 退格键删除的字符
set ww=h,l,<,>,[,]                              " 设置whichwrap的值
set autochdir                                   " 切换当前目录为当前文件所在的目录
set guioptions-=T                               " 隐藏工具栏
set ruler                                       " 显示光标位置
set showcmd                                     " 显示未完成命令
set laststatus=2                                " 显示状态栏    
set nu                                          " 显示行号
set autoindent                                  " 换行自动缩进
set expandtab                                   " 不用空格代替制表符
set tabstop=4                                   " tab宽度
set softtabstop=4                               " 退格删除4个空格
set shiftwidth=4                                " 每层缩进空格数
set noshowmatch                                 " 高亮显示匹配的括号
set ignorecase                                  " 搜索时忽略大小写
set incsearch                                   " 搜索时搜索的内容全高亮，默认为首字母高亮
set fileformat=unix                             " 设置换行符类型
set tags=./tags;/                               " 从当前目录开始往上层递归查找ctags文件
set statusline=%F%m%r%h%w\ %=[%{&ff}]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ [%Y]\ [%l,%v]\ [%p%%]

let mapleader=","                               " 设置mapleader
let loaded_matchparen=0                         " 取消匹配括号高亮显示，伤眼
let &termencoding=&encoding                     " 用于屏幕显示的编码

syntax on                                       " 代码高亮

filetype off                                    " 关闭侦测文件类型
filetype plugin on                              " 启用针对不同文件类型的插件
filetype plugin indent on                       " 载入文件类型插件
filetype indent on                              " 为特定文件类型载入相关缩进文件

" 格式化代码，包括换行不补全注释符
autocmd BufNewFile,BufRead * set formatoptions=tcqMn


"--------------------------------------------------
" Linux与Windows下有差异的配置
"--------------------------------------------------
if has("win32")
    set nobackup                                " 不备份文件

    language message zh_CN.gbk                  " 提示信息编码为gbk

    autocmd GUIEnter * simalt ~x                " GVim最大化
else
    set backup                                  " 备份文件
    set bdir=~/vimbackup                        " 备份文件所在的路径

    language message zh_CN.utf-8                " 提示信息编码为utf-8

    autocmd GUIEnter * winsize 200 100          " GVim最大化
endif


"--------------------------------------------------
" 扩展功能
"--------------------------------------------------
map <Leader>md :e ++ff=unix %<CR>               " <leader>md显示windows换行符
map <Leader>ms :%s/<C-V><C-M>/g<CR>             " <Leader>ms除去windows换行符，需先显示
map <F5> :!php -q <C-R>%<CR>                    " 执行php代码

" 禁用邪恶的方向键
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"--------------------------------------------------
" 加载插件及配色
"--------------------------------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 快速的词间跳跃 {{{
    Bundle 'Lokaltog/vim-easymotion'
" }}}

" 代码提示 {{{
    Bundle 'Shougo/neocomplcache'

    let g:neocomplcache_enable_at_startup=1     " 启用neocomplcache

    " neocomplcache弹出框颜色设置
    hi Pmenu ctermbg=8  guifg=#333333 guibg=#cccccc
    hi PmenuSel ctermbg=1 guifg=#000000 guibg=#aec7e6
    hi PmenuSbar ctermbg=0 guibg=#666666
" }}}

" 快速生成代码段 {{{
    Bundle 'Shougo/neosnippet'

    " 快捷键
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
" }}}

" 在顶部显示所有buffer构成的标签页 {{{
    Bundle 'fholgado/minibufexpl.vim'

    " let g:miniBufExplorerMoreThanOne=1        " 让minibufexpl自动打开
    let g:miniBufExplMapWindowNavVim=1          " 可使用<C-h,j,k,l>切换到上下左右窗口
    let g:miniBufExplMapCTabSwitchBufs=1        " 可使用<C-tab>切换窗口
    let g:miniBufExplMapWindowNavArrows=1       " 可使用<C-箭头键切换到上下左右窗口
    let g:miniBufExplUseSingleClick=1           " 单击即可切换buffer
    let g:miniBufExplModSelTarget=1             " 让打开的buffer显示在正确的地方
" }}}

" 管理插件的插件 {{{
    Bundle 'gmarik/vundle'
" }}}

" 对齐 {{{
    Bundle 'godlygeek/tabular'
" }}}

" 括号、引号补全 {{{
    Bundle 'jiangmiao/auto-pairs'
" }}}

" 快速打开文件 {{{
    Bundle 'kien/ctrlp.vim'

    let g:ctrlp_working_path_mode=2             " 设置ctrlp工作目录
" }}}

" 快速在文件中的函数、方法、变量中跳转 {{{
    Bundle 'majutsushi/tagbar.git'

    " windows下制定ctags.exe路径
    if has("win32")
        let g:tagbar_ctags_bin='$VIMRUNTIME/ctags.exe'
    endif

    let g:tagbar_width=40                       " 宽度（字符宽度）
    let g:tagbar_sort=0                         " 按出现顺序排序
    let g:tagbar_singleclick=1                  " 单击展开
    let g:tagbar_iconchars=['+','-']            " 代表展开收缩的图标

    map <F7> :TagbarToggle<CR>                  " F7快捷键
" }}}

" 快速注释 {{{
    Bundle 'scrooloose/nerdcommenter'
" }}}

" 显示目录树 {{{
    Bundle 'scrooloose/nerdtree'

    let g:NERDTreeWinSize=31                    " 宽度
    let g:NERDTreeWinPos="right"                " 在右侧显示

    map <F8> :NERDTreeToggle<CR>                " F8快捷键
" }}}

" 错误提示 {{{
    Bundle 'scrooloose/syntastic'

    let g:syntastic_check_on_open=1             " 打开文件自动进行语法检查
    let g:syntastic_phpcs_disable=1             " 关闭PHP_CodeSniffer检查
" }}}

" PHP集成 {{{
    Bundle 'spf13/PIV'
" }}}

" molokai配色 {{{
    Bundle 'tomasr/molokai'

    let g:molokai_original=1                    " 使用molokai传统背景色
    color molokai                               " 设定配色
    hi statusline guifg=#575757 guibg=#f7f7f7   " 状态栏颜色
" }}}

" 括号、引号快速处理 {{{
    Bundle 'tpope/vim-surround'
" }}}

" 显示buffer列表 {{{
    Bundle 'bufexplorer.zip'
" }}}

" 查找功能 {{{
    Bundle 'grep.vim'
" }}}
