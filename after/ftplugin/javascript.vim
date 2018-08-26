" Vim filetype plugin file for NODERUN command
" Language:     JavaScript
" Maintainer:   Stephan Houben

if !exists('g:node_executable')
  let g:node_executable = 'node'
endif

if !exists('*NodeRun')
  function NodeRun()
    let filename = expand('%:p')
    let name = substitute(expand('%:t:r'), '-', '_', 'g')
    let command = "const " . name . " = require('" . escape(filename, ' \') . "');"
    let $NODE_REPL_MODE = "strict"
    return term_start([g:node_executable, "-e", command, "-i"], 
      \{"term_finish": "close", "term_name": g:node_executable . " " . name,
      \"term_kill": "term"})
  endfunction

  command NODERUN call NodeRun()
endif
