""""""""""""""""""""
""" vim 기본 설정 시작 """

syntax on " 문법에 따라 단어에 색 추가
set number " 좌측에 줄 번호 표시
" set relativenumber " 줄 번호 상대적으로 표시
set hlsearch " / 를 눌러서 검색하면 검색 결과 밑에 밑줄로 표시
set ignorecase " 검색할 때 대소문자 구분 안 함
set tabstop=2 " 문서에 있는 탭 문자를 2 칸으로 표시
set softtabstop=2 " 탭 문자를 입력하면 2 칸으로 표시
set shiftwidth=2 " << >> 로 이동할 때 2 칸씩 이동
set expandtab " 탭 문자 입력하면 스페이스바 입력
autocmd FileType make setlocal noexpandtab " Makefile 의 경우 탭 문자 그대로 입력

""" vim 기본 설정 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" Key Settings 시작 """

" Leader키를 \ 에서 , 로 변경
let mapleader = ","
" 노말모드에서 autoindent 기능 토글
nnoremap <F2> :set invpaste paste?<CR>
" 입력모드에서 autoindent 기능 토글
set pastetoggle=<F2>
" 노말모드에서 이전 버퍼로 이동
nnoremap <leader>q :bp<CR>
" 노말모드에서 다음 버퍼로 이동
nnoremap <leader>w :bn<CR>
" 위 아래 방향으로 창 크기 3 증가
nnoremap <silent> <Leader>= :exe "resize +3"<CR>
" 위 아래 방향으로 창 크기 3 감소
nnoremap <silent> <Leader>- :exe "resize -3"<CR>
" 오른쪽 왼쪽 방향으로 창 크기 8 증가
nnoremap <silent> <Leader>] :exe "vertical resize +8"<CR>
" 오른쪽 왼쪽 방향으로 창 크기 8 감소
nnoremap <silent> <Leader>[ :exe "vertical resize -8"<CR>

""" Key Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" Vundle Settings 시작 """

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-airline 하단 상태 표시줄
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" jellybeans 테마
Plugin 'nanotech/jellybeans.vim'

" NERDTree 파일 탐색기
Plugin 'The-NERD-Tree'

" vim-multiple-cursors 같은 단어 다중선택 지원
Plugin 'terryma/vim-multiple-cursors'

" vim-smooth-scroll Ctrl + D / U / F / B 로 화면 이동시 부드럽게 이동
Plugin 'terryma/vim-smooth-scroll'

" 괄호 자동완성
Plugin 'Raimondi/delimitMate'

" 코드 자동완성, 스니팻
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" 문법 체크 플러그인
Plugin 'Syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'

" vim 의 git wrapper
Plugin 'tpope/vim-fugitive'

" git 으로 관리하는 파일의 변경된 부분을 줄번호 왼쪽에 표시
Plugin 'airblade/vim-gitgutter'

" vim 파일탐색
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" Vundle Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" vim-airlines Settings 시작 """

let g:airline#extensions#tabline#enabled = 1 " 버퍼 리스트 항상 켜기
let g:airline_theme='hybrid' " 특정 색 말고 vim 에 설정되어 있는 colorscheme 을 따라감
set laststatus=2 " 하단 상태바 항상 켜기

""" vim-airlines Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" jellybeans (colorscheme) Settings 시작 """

color jellybeans

""" jellybeans (colorscheme) Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" NERDTree Settings 시작 """

" NERDTree 버퍼가 열릴 때 vim 의 파일 위치 설정
autocmd BufEnter * lcd %:p:h

" 파일 열지 않고 그냥 vim 실행하면 자동으로 NERDTree 실행
autocmd VimEnter * if !argc() | NERDTree | endif

" NERDTree 단축키
nmap <leader>nt :NERDTreeToggle<cr>

" NERDTree 에서 줄 번호 표시
let NERDTreeShowLineNumbers=1

" NERDTree 를 오른쪽에 띄움
let g:NERDTreeWinPos = "right"

""" NERDTree Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" vim-multiple-cursors Settings 시작 """

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>' " 다음 단어 선택
let g:multi_cursor_prev_key='<C-p>' " 이전 단어로 이동
let g:multi_cursor_skip_key='<C-x>' " 현재 선택되어 있는 단어 스킵
let g:multi_cursor_quit_key='<Esc>' " 다중 선택 취소

""" vim-multiple-cursors Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" vim-smooth-scroll Settings 시작 """
" Ctrl + D : 화면 아래로 반 페이지 정도 이동
" Ctrl + U : 화면 위로 반 페이지 정도 이동
" Ctrl + F : 화면 아래로 한 페이지 정도 이동
" Ctrl + B : 화면 위로 한 페이지 정도 이동

noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 3)<CR>

""" vim-smooth-scroll Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" delimitMate Settings 시작 """

let delimitMate_expand_cr=1

""" delimitMate Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" ultisnips Settings 시작 """

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

""" ultisnips Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" syntastic Settings 시작 """

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" syntastic Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" ctrlp Settings 시작 """

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
\ }

""" ctrlp Settings 끝 """
""""""""""""""""""""

""""""""""""""""""""
""" vim-fugitive Settings 시작 """

let g:airline_powerline_fonts = 1

""" vim-fugitive Settings 끝 """
""""""""""""""""""""
