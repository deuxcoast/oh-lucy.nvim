local M = {}

local function check_config(config)
  -- TODO: write error handling for config check
  local err
  return not err
end

function M.setup(config)
  if check_config(config) then
    vim.tbl_deep_extend("force", M.config, config or {})
  else
    vim.notify("requiem: Errors found while loading user config. Falling back to default config.",
      vim.log.levels.ERROR)
  end
end

function M.load(theme)
  theme = theme or M.config.background[vim.o.background] or M.config.theme
  M._CURRENT_THEME = theme

  vim.cmd.highlight("clear")
  vim.g.colors_name = "deux_colors"
  vim.o.termguicolors = true

  local colors = require("requiem")
end
