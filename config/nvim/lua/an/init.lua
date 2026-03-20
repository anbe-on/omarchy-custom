-- load modules
require("an.lazy")
require("an.remap")
require("an.set")
-- require("an.lsp")

-- Wrap + Linebreak
vim.cmd [[
    command! -nargs=* WL lua vim.cmd('set wrap | set linebreak')
    command! -nargs=* Wl lua vim.cmd('set nowrap | set nolinebreak')
]]

-- Print Time and date
function Insert_current_date()
  local current_date = os.date("%A, %Y/%m/%d %H:%M:%S")
  vim.fn.append(vim.fn.line('.'), current_date)
end
vim.cmd([[command! Date lua Insert_current_date()]])

-- Paste from clipboard + Vertical Diff
vim.keymap.set("n", "<leader>dvs", function() DiffClipboard() end, { noremap = true, silent = true, desc = "Diff with clipboard" })
function DiffClipboard()
    -- Open a vertical split
    vim.cmd("vsplit")
    -- Move to the new buffer
    vim.cmd("wincmd l")
    -- Set buffer as [No Name] to allow pasting
    vim.cmd("enew")
    -- Paste from system clipboard (Windows + Bash uses `+` register)
    vim.cmd("normal! \"+p")
    -- Enable diff mode in both buffers
    vim.cmd("wincmd h | diffthis")
    vim.cmd("wincmd l | diffthis")
end

-- Tab Jump, map <leader>1 to <leader>9 to jump to tabs
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, function()
    -- vim.fn.tabpagenr('$') gets the total count of open tabs
    if i <= vim.fn.tabpagenr('$') then
      vim.cmd('tabnext ' .. i)
    else
      vim.notify("Tab " .. i .. " does not exist", vim.log.levels.WARN)
    end
  end, { desc = 'Go to Tab ' .. i })
end
