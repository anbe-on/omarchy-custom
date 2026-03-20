vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected up and down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected down and up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join the current line with the line below" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a screen" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to the next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to the previous match" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace selected text with line above" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("n", "Q", "<nop>", { desc = "No operation" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Go to next item in quickfix list" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Go to previous item in quickfix list" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Go to next item in location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Go to previous item in location list" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Search and replace word under cursor" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable" })

-- Vertical resizing mappings
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +5<CR>',
    { noremap = true, desc = "Increase vertical size by 5 lines" })
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -5<CR>',
    { noremap = true, desc = "Decrease vertical size by 5 lines" })

-- Horizontal resizing mappings
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', { noremap = true, desc = "Increase horizontal size by 2 lines" })
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', { noremap = true, desc = "Decrease horizontal size by 2 lines" })

--movewithin buffer
vim.api.nvim_set_keymap('n', '<A-x>', ':bnext<CR>', { noremap = true, silent = true, desc = "Move to the next buffer" })
vim.api.nvim_set_keymap('n', '<A-z>', ':bprev<CR>',
    { noremap = true, silent = true, desc = "Move to the previous buffer" })

--to open a new tab
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true, desc = "Open a new tab" })
vim.api.nvim_set_keymap('n', '<leader>rt', ':tabnew<CR>:ter<CR>i',
    { noremap = true, silent = true, desc = "Open a new tab with a terminal" })

--previous tab
vim.api.nvim_set_keymap('n', 'gb', ':tabprevious<CR>', { noremap = true, silent = true, desc = "Go to the previous tab" })

-- Move selected block to the right
vim.keymap.set("v", ">", ">gv", { desc = "Move selected block to the right" })

-- Move selected block to the left
vim.keymap.set("v", "<", "<gv", { desc = "Move selected block to the left" })
