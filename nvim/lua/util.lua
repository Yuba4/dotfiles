local M = {}

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition across plugin config files.
---@param repo string
---@return string
function M.gh(repo) return 'https://github.com/' .. repo end

return M
