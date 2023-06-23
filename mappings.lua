---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}
M.telescope = {
  plugin = true,
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
  },
}
M.nvimtree = {

  n = {
    -- toggle
    ["<A-e>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

-- more keybinds!

return M
