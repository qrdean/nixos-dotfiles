local dap = require('dap')
local dapui = require('dapui')
--
dapui.setup()
--
dap.adapters.godot = {
  type = "server",
  host = "127.0.0.1",
  port = 6006,
}
--
dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    projectDir = "${workspaceFolder}",
    launch_scene = true,
  }
}

vim.keymap.set('n', '<leader>zb', dap.toggle_breakpoint)

vim.keymap.set('n', '<space>?', function()
  require('dapui').eval(nil, { enter = true })
end)

vim.keymap.set('n', '<F1>', dap.continue)
vim.keymap.set('n', '<F2>', dap.step_into)
vim.keymap.set('n', '<F3>', dap.step_over)
vim.keymap.set('n', '<F4>', dap.step_out)
vim.keymap.set('n', '<F5>', dap.step_back)
vim.keymap.set('n', '<F10>', dap.restart)

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

dap.listeners.before.event_terminated.dapui_config =function()
  dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- dap.listeners.after.event_initialized["dapui_config"]=function()
--   dapui.open()
-- end
--
-- dap.listeners.after.event_terminated["dapui_config"]=function()
--   dapui.close()
-- end
--
-- dap.listeners.after.event_exited["dapui_config"]=function()
--   dapui.close()
-- end
--
