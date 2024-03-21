function! FormatJson()
python3 << EOF
import vim
import json
from collections import OrderedDict
line_num = vim.current.window.cursor[0]
buff = vim.current.buffer
try:
    formatted = json.dumps(json.loads(vim.current.line, object_pairs_hook=OrderedDict), ensure_ascii=False, indent=2)
    for i, line in enumerate(formatted.split('\n')):
        buff.append(line, line_num+i)
    vim.command('normal dd')
except Exception as e:
    print(e)
EOF
endfunction

nnoremap <leader>j :call FormatJson()<CR>
vnoremap <leader>j :call FormatJson()<CR>
