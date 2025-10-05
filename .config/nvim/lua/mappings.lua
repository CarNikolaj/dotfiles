require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Zettelkasten keymaps (normal notes only)
map("n", "<leader>zf", "<cmd>lua require('telekasten').find_notes()<CR>", { desc = "Find notes" })
map("n", "<leader>zn", "<cmd>lua require('telekasten').new_templated_note()<CR>", { desc = "New note" })
map("n", "<leader>zt", "<cmd>lua require('telekasten').follow_link()<CR>", { desc = "Follow link" })
map("n", "<leader>zz", "<cmd>lua require('telekasten').panel()<CR>", { desc = "Telekasten panel" })

