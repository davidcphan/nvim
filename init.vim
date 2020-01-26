call plug#begin('~/.config/nvim/bundle')
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" basics
 filetype plugin indent on
 syntax on
 set number
 set incsearch
 set ignorecase
 set smartcase
 set nohlsearch
 set tabstop=4
 set softtabstop=0
 set shiftwidth=4
 set expandtab
 set nobackup
 set nowritebackup
 set noswapfile
 set nowrap
"
" " preferences
" inoremap jk <ESC>
" let mapleader = "\<Space>"
" set pastetoggle=<F2>
" " j/k will move virtual lines (lines that wrap)
" noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
" noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" " Stay in visual mode when indenting. You will never have to run gv after
" " performing an indentation.
" vnoremap < <gv
" vnoremap > >gv
" " Make Y yank everything from the cursor to the end of the line. This makes
" Y
" " act more like C or D because by default, Y yanks the current line (i.e.
" the
" " same as yy).
" noremap Y y$
" " navigate split screens easily
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>
" " change spacing for language specific
" autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
"
" " plugin settings
" Theme
syntax enable
colorscheme gruvbox 
let g:airline_theme='deus'

"---------NERDTree----------"
" " How can I close vim if the only window left open is a NERDTree?
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
" b:NERDTree.isTabTree()) | q | endif
" " toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeChDirMode=2
" let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$',
" '__pycache__', 'node_modules']
" let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
" let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
"----------------------------"

highlight Pmenu ctermbg=8 guibg=#004D99 
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#1f82cd

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" coc config
let g:coc_global_extensions = [
 \ 'coc-snippets',
 \ 'coc-pairs',
 \ 'coc-tsserver',
 \ 'coc-prettier', 
 \ 'coc-json', 
 \ ]

"if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
                  \ coc#refresh()
                  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

                  function! s:check_back_space() abort
                    let col = col('.') - 1
                      return !col || getline('.')[col - 1]  =~# '\s'
                      endfunction

                      " Use <c-space> to trigger completion.
                      inoremap <silent><expr> <c-space> coc#refresh()

                      " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
                      " Coc only does snippet and additional edit on confirm.
                      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
                      " Or use `complete_info` if your vim support it, like:
                      " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

                      " Use `[g` and `]g` to navigate diagnostics
                      nmap <silent> [g <Plug>(coc-diagnostic-prev)
                      nmap <silent> ]g <Plug>(coc-diagnostic-next)

                      " Remap keys for gotos
                      nmap <silent> gd <Plug>(coc-definition)
                      nmap <silent> gy <Plug>(coc-type-definition)
                      nmap <silent> gi <Plug>(coc-implementation)
                      nmap <silent> gr <Plug>(coc-references)

                      " Use K to show documentation in preview window
                      nnoremap <silent> K :call <SID>show_documentation()<CR>

                      function! s:show_documentation()
                        if (index(['vim','help'], &filetype) >= 0)
                            execute 'h '.expand('<cword>')
                              else
                                  call CocAction('doHover')
                                    endif
                                    endfunction

                                    " Highlight symbol under cursor on CursorHold
                                    autocmd CursorHold * silent call CocActionAsync('highlight')

                                    " Remap for rename current word
                                    nmap <leader>rn <Plug>(coc-rename)

                                    " Remap for format selected region
                                    xmap <leader>f  <Plug>(coc-format-selected)
                                    nmap <leader>f  <Plug>(coc-format-selected)

                                    augroup mygroup
                                      autocmd!
                                        " Setup formatexpr specified filetype(s).
                                          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
                                            " Update signature help on jump placeholder
                                              autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
                                              augroup end

                                              " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
                                              xmap <leader>a  <Plug>(coc-codeaction-selected)
                                              nmap <leader>a  <Plug>(coc-codeaction-selected)

                                              " Remap for do codeAction of current line
                                              nmap <leader>ac  <Plug>(coc-codeaction)
                                              " Fix autofix problem of current line
                                              nmap <leader>qf  <Plug>(coc-fix-current)

                                              " Create mappings for function text object, requires document symbols feature of languageserver.
                                              xmap if <Plug>(coc-funcobj-i)
                                              xmap af <Plug>(coc-funcobj-a)
                                              omap if <Plug>(coc-funcobj-i)
                                              omap af <Plug>(coc-funcobj-a)

                                              " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
                                              nmap <silent> <TAB> <Plug>(coc-range-select)
                                              xmap <silent> <TAB> <Plug>(coc-range-select)

                                              " Use `:Format` to format current buffer
                                              command! -nargs=0 Format :call CocAction('format')

                                              " Use `:Fold` to fold current buffer
                                              command! -nargs=? Fold :call     CocAction('fold', <f-args>)

                                              " use `:OR` for organize import of current buffer
                                              command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

                                              " Add status line support, for integration with other plugin, checkout `:h coc-status`
                                              set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

                                              " Using CocList
                                              " Show all diagnostics
                                              nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
                                              " Manage extensions
                                              nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
                                              " Show commands
                                              nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
                                              " Find symbol of current document
                                              nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
                                              " Search workspace symbols
                                              nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
                                              " Do default action for next item.
                                              nnoremap <silent> <space>j  :<C-u>CocNext<CR>
                                              " Do default action for previous item.
                                              nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
                                              " Resume latest coc list
                                              nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
