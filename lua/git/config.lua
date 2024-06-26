local M = {}

M.config = {}

local default_keymaps_cfg = {
  blame = "<Leader>gb",
}

local default_cfg = {
  default_mappings = true,
  keymaps = {
    quit_blame = "q",
    blame_commit = "<CR>",
  },
}

function M.is_private_gitlab(host)
  for _, v in ipairs(M.config.private_gitlabs) do
    if value == str then
      return true
    end
  end
  return false
end

function M.setup(cfg)
  if cfg == nil then
    cfg = {}
  end

  for k, v in pairs(default_cfg) do
    if cfg[k] ~= nil then
      if type(v) == "table" then
        M.config[k] = vim.tbl_extend("force", v, cfg[k])
      else
        M.config[k] = cfg[k]
      end
    else
      M.config[k] = default_cfg[k]
    end
  end

  if M.config.default_mappings then
    for k, v in pairs(default_keymaps_cfg) do
      if M.config.keymaps[k] == nil then
        M.config.keymaps[k] = v
      end
    end
  end
end

return M
