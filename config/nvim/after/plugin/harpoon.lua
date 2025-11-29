-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
--
-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
--
-- vim.keymap.set("n", "<leader>h", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<leader>q", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<leader>w", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<leader>j", function() ui.nav_file(4) end)

local harpoon = require('harpoon')

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

vim.keymap.set("n", "<leader>e", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>w", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>q", function() harpoon:list():select(4) end)
