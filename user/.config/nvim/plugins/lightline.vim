let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\       'left': [
\           [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'filename' ], [ 'readonly' ]
\        ],
\       'right': [
\           ['lineinfo'], ['percent']
\       ]
\   },
\   'inactive': {
\       'left': [[ 'filename' ]],
\       'right': []
\   },
\   'component_function': {
\       'gitbranch': 'gitbranch#name'
\   },
\}
