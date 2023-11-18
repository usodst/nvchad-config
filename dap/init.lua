local dap = require("dap")

-- ui
require("custom.dap.ui")

-- debuggers
local gdb = require("custom.dap.adapters.gdb")
local coreclr = require("custom.dap.adapters.coreclr")

dap.adapters.gdb = gdb.adapter
dap.adapters.coreclr = coreclr.adapter

dap.configurations.c = gdb.config
dap.configurations.cpp = gdb.config
dap.configurations.cs = coreclr.config
