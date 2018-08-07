# vim-noderun

Simple plugin to run a Javascript file under Node.
Needs Vim 8.1 or higher (terminal support).

## Usage

Defines a new command NODERUN.
 
    :NODERUN<CR>

starts node in a terminal window and require-s the current file.

Configure the node executable with
 
    let g:node_executable = '/path/to/node'

## License

MIT License. See LICENSE.
