set clipboard=unnamed

"set rtp+=/usr/local/opt/fzf
"nnoremap <SPACE> <Nop>
"let mapleader=" "
"set number
"set nowrap
"set ru
"syntax enable
"
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
"
"nmap <Leader>f :GFiles<CR>
"nmap <Leader>F :Files<CR>
"nmap <Leader>t :Rg<CR>
"
":vnoremap <LEADER>s d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>
"
"nmap <Leader>h :Copilot<CR>
"
"set nobackup
"set nowritebackup
"
"" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
"" delays and poor user experience
"set updatetime=300
"
"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate
"" NOTE: There's always complete item selected by default, you may want to enable
"" no select by `"suggest.noselect": true` in your configuration file
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config
"
"" Make <CR> to accept selected completion item or notify coc.nvim to format
"" <C-g>u breaks current undo, please make your own choice
"
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

