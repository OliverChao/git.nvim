local M = {}

local function config_keymap(mode, lhs, rhs, options)
  if lhs == nil or lhs == "" then
    return
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function config_keymaps()
  local cfg = require("git.config").config

  local options = {
    noremap = true,
    silent = true,
    expr = false,
  }
  config_keymap("n", cfg.keymaps.blame, "<CMD>lua require('git.blame').blame()<CR>", options)
end

local function config_commands()
  vim.api.nvim_create_user_command("GitBlame", 'lua require("git.blame").blame()<CR>', {
    bang = true,
    nargs = "*",
  })
end

function M.setup(cfg)
  require("git.config").setup(cfg)

  config_keymaps()
  config_commands()
end

return M
