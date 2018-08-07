" Vim filetype plugin file for NODERUN command
" Language:     JavaScript
" Maintainer:   Stephan Houben

if !exists('*NodeRun')
  function NodeRun()
    let filename = expand('%:p')
    let name = substitute(expand('%:t:r'), '-', '_', 'g')
    let command = "const " . name . " = require('" . escape(filename, ' \') . "');"
    return term_start(["node", "-e", command, "-i"], {"term_finish": "close"})
  endfunction

  command NODERUN call NodeRun()
endif
