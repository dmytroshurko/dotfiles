" General configuration
set nocompatible                    " use Vim settings, rather then Vi settings
set backspace=indent,eol,start      " allow backspacing over indention, line breaks and insertion start
set showcmd                         " show incomplete commands at the bottom
set hidden                          " allows having hidden buffers

" User Interface
set laststatus=2                    " show status line
set wildmenu                        " display command line's tab complete options as a menu
set number                          " enable line numbers
set relativenumber                  " show line number on the current line and relative numbers on all other lines
set noerrorbells visualbell t_vb=   " disable beeping and window flashing
set mouse=a                         " enable mouse for scrolling and resizing
set background=dark                 " use colors that suit a dark background
set shortmess+=I                    " disable the default Vim startup message

" Indentation
filetype plugin indent on           " smart auto indentation
set autoindent                      " enable auto indenting
set softtabstop=4                   " indent by 4 spaces when hitting tab
set shiftwidth=4                    " indent by 4 spaces when auto-indenting
set tabstop=4                       " show existing tab with 4 spaces width
set expandtab                       " on pressing tab, insert 4 spaces

" Search
set incsearch                       " find the next match as we type the search
set ignorecase                      " ignore case when searching
set smartcase                       " but make it case sensitive if you type a capital

" Text rendering
syntax on                           " enable syntax highlighting

" Unbind keys
nmap Q <Nop>

" Automatically set/unset Vim's paste mode when you paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Plugins

" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vimwiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.template_path = '~/vimwiki/templates/'
let wiki.template_default = 'template'
let wiki.template_ext = '.tpl'
let wiki.custom_wiki2html = 'vimwiki_markdown'
let wiki.path_html = '~/vimwiki/vimwiki_html'
let wiki.html_filename_parameterization = 1                     " for integration with the vimwiki_markdown gem
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp',
                            \ 'c': 'c', 'bash': 'bash',
                            \ 'json': 'json', 'vim': 'vim'}
let wiki.list_margin = 0
let g:vimwiki_list = [wiki]

let g:vimwiki_hl_headers = 1
let g:vimwiki_global_ext = 0
