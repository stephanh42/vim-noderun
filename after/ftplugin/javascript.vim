" Vim filetype plugin file for NODERUN command
" Language:     JavaScript
" Maintainer:   Stephan Houben

if !exists('g:node_executable')
  let g:node_executable = 'node'
endif

if !exists('*NodeRun')
  function NodeRunExitCallback(buffer, exit_status)
    if a:exit_status == 0
       execute "bdelete" a:buffer
    endif
  endfunction

  function NodeRun()
    let filename = expand('%:p')
    let name = substitute(expand('%:t:r'), '-', '_', 'g')
    let command = "const " . name . " = require('" . escape(filename, ' \') . "');"
    let $NODE_REPL_MODE = "strict"
    let buffer = ""
    let buffer = term_start([g:node_executable, "-e", command, "-i"], 
      \{"term_name": g:node_executable . " " . name,
      \"exit_cb": {job, exit_status -> NodeRunExitCallback(buffer, exit_status)},
      \"term_kill": "term"})
    return buffer
  endfunction

  command NODERUN call NodeRun()
endif
