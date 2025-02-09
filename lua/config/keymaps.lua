-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function evaluate_block()
  vim.cmd("MoltenEvaluateOperator")
  vim.defer_fn(function()
    vim.api.nvim_feedkeys("io", "n", false)
  end, 100)
end

vim.keymap.set("n", "<leader>mi", "<cmd>MoltenInit<cr>", { silent = true, desc = "Initialize" })
vim.keymap.set("n", "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", { silent = true, desc = "Evaluate line" })
vim.keymap.set("n", "<leader>mr", "<cmd>MoltenReevaluateCell<cr>", { silent = true, desc = "Re-evaluate cell" })
vim.keymap.set("n", "<leader>me", evaluate_block, { silent = true, desc = "Evaluate code block" })
vim.keymap.set("n", "<leader>mm", "<cmd>MoltenImagePopup<cr>", { silent = true, desc = "Open image in previewer" })
vim.keymap.set("n", "<leader>md", "<cmd>MoltenDelete<cr>", { silent = true, desc = "Delete cell" })
vim.keymap.set("n", "<leader>mh", "<cmd>MoltenHideOutput<cr>", { silent = true, desc = "Hide output" })
vim.keymap.set("n", "<leader>mo", function()
  vim.cmd("noautocmd MoltenEnterOutput")
end, { silent = true, desc = "Show/Enter output" })
vim.keymap.set(
  "v",
  "<leader>me",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "Evaluate visual selection" }
)
