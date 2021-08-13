let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\       'left': [
\           [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'filename' ]
\        ],
\       'right': [
\           [ 'readonly' ], ['lineinfo'], ['percent']
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
