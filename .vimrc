se nocompatible

so  ~/.vim/plugins.vim
syntax enable

set backspace=indent,eol,start
let mapleader = ','
set number								"Activate line numbers"
let NERDTreeHijackNetrw = 0
set noerrorbells visualbell t_vb = 					"Turn of the bell noise"
set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u 							"Set our desired autocompletion matching.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4


"------------Visuals------------"
colorscheme atom-dark-256			"Set the visual theme"
set t_CO=256 					"Force 256 colors"

hi vertsplit guifg=bg guibg=bg			"Set the color for the split bar"

"------------Search-------------"
set hlsearch
set incsearch


"------------Split Management-------------"
set splitbelow 					"By default new splits go below"
set splitright					"By default new splits go right"
nmap <C-J> <C-W><C-J>				"Map control J to Control WJ"
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"------------Mappings-------------"

"Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal
nmap <Leader><Space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <Leader>1 :NERDTreeToggle<cr>

nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

"Fast search a tag"
nmap <Leader>f :tag<space>

"Close all buffers
nmap <Leader>cb :bufdo bd!<cr>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-"}'<cr>

"---------Laravel-Specific---------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>la :!php artisan
nmap <Leader><Leader>c :CrtlP<cr>app/Http/Controllers/
nmap <Leader><Leader>m :CrtlP<cr>app/Models/
nmap <Leader><Leader>v :CrtlP<cr>resources/views/


"-----------Ctrl-P----------------"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,results:15'




"-----------GReplace.vim----------"
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'


"----------Code Formatting-------"
let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_fixers_list = "-psr0"

nnoremap <silent><leader>l :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>l :call PhpCsFixerFixFile()<CR>

"--------Code Documentation-------"
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>


"-------------Macros--------------"

"-----------Auto-Commands---------"
"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd! 
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
	    call PhpInsertUse()
	        call feedkeys('a',  'n')
	endfunction
	autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
	autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
function! IPhpExpandClass()
	    call PhpExpandClass()
	        call feedkeys('a', 'n')
	endfunction
	autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
	autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>


"-------------Tips and Reminders--------------"
""" - Press 'zz' to instantly center the line where the cursor is located


