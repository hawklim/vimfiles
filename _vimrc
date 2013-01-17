set langmenu=zh_CN.UTF-8						"菜单语言
set fileencodings=utf-8,gbk,ucs-bom,cp936		"支持的文件编码
set fileencoding=utf-8							"保存的编码格式


"提示信息的编码，windows下为gbk，linux下为utf-8
if has("win32")
	language message zh_CN.gbk
else
	language message zh_CN.utf-8
endif
let &termencoding=&encoding						"用于屏幕显示的编码

set fileformat=dos		"设置换行符类型
let mapleader=","		"设置mapleader

map <Leader>md :e ++ff=unix %<CR>		"<leader>md显示windows换行符
map <Leader>ms :%s/<C-V><C-M>/g<CR>		"<Leader>ms除去windows换行符，需先显示

set nocompatible					"不使用vi的键盘模式
set hidden							"允许切换buffer时不保存当前buffer
set noerrorbells					"关闭出错时的提示声音
set t_vb=							"使用屏幕闪烁代替bell
set novisualbell					"屏幕不要闪烁
set backspace=indent,eol,start		"退格键删除的字符
set ww=h,l,<,>,[,]					"设置whichwrap的值

set autochdir				"切换当前目录为当前文件所在的目录
set guioptions-=T			"隐藏工具栏
set statusline=%F%m%r%h%w\ %=[%{&ff}]\%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ [%Y]\ [%l,%v]\ [%p%%]
set laststatus=2
syntax on					"代码高亮
colorscheme molokai			"配色
set nu						"显示行号
set autoindent				"换行自动缩进
set noexpandtab				"不用空格代替制表符
set tabstop=4				"tab宽度
set softtabstop=4			"统一缩进为4
set shiftwidth=4			"同上
set noshowmatch				"高亮显示匹配的括号
let loaded_matchparen=0		"取消匹配括号高亮显示，伤眼

set ignorecase		"搜索时忽略大小写
set incsearch		"搜索时搜索的内容全高亮，默认为首字母高亮

"windows下不备份文件，linux下备份文件
if has("win32")
	set nobackup				"不备份文件	
else
	set backup					"备份文件
	set bdir=~/vimbackup		"备份文件所在的路径
endif

"在当前目录查找tags文件，若当前目录无tags文件，则在上一层目录查找。
"若上一层目录仍无tags文件，则再往更上一层目录查找，直至找到tags文件
set tags=./tags;/

filetyp on						"侦测文件类型
filetype plugin indent on		"载入文件类型插件
filetype indent on				"为特定文件类型载入相关缩进文件

"设置80字符对齐线
"将对齐线设置在第81个字符的位置
set cc=81
"分别设置对齐线在终端和GUI下的颜色
hi ColorColumn ctermbg=lightgrey guibg=#444444

"gvim最大化
if has("win32")
autocmd GUIEnter * simalt ~x
else
autocmd GUIEnter * winsize 200 100	"打开一个文件时无效，未弄清两数字代表的含义
endif

"执行php代码
map <F5> :!php -q <C-R>%<CR>

"将php手册融入vim，按K即可查看函数说明
autocmd BufNewFile,Bufread *.php set keywordprg="help"

"编辑习惯
"映射 <C-A> ggVG
map <C-A> ggVG
map! <C-A> <Esc>ggVG
"映射复制、粘贴、剪切
map <C-C> "+y
map <C-V> "+gP
map <C-X> "+x

"启用pathogen
"管理插件的插件
call pathogen#infect()

"neocomplcache
let g:neocomplcache_enable_at_startup=1		"启用neocomplcache

"nerdtree
"显示目录树
let g:NERDTreeWinSize=31		"宽度
let g:NERDTreeWinPos="right"	"在右侧显示
map <F8> :NERDTreeToggle<CR>	"F8快捷键

"tagbar
"显示变量和函数列表的插件
"autocmd VimEnter * nested :TagbarOpen				"默认自动打开tabbar
"windows下制定ctags.exe路径
if has("win32")
	let g:tagbar_ctags_bin='$VIMRUNTIME/ctags.exe'		"ctags.exe路径
endif
let g:tagbar_width=40								"宽度（字符宽度）
let g:tagbar_sort=0									"按出现顺序排序
let g:tagbar_singleclick=1							"单击展开
let g:tagbar_iconchars=['+','-']					"代表展开收缩的图标
map <F7> :TagbarToggle<CR>							"F7快捷键

"vim-session
let g:session_autoload="yes"
let g:session_autosave="yes"

"格式化代码，包括换行不补全注释符，放前面貌似会被其它插件的配置覆盖
autocmd BufNewFile,BufRead * set formatoptions=tcqMn
