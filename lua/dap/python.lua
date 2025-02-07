local dap = require('dap')
dap.adapters.python = {
    type = 'executable';
    command = '/usr/bin/python3';
    args = { '-m', 'debugpy.adapter' };
}
