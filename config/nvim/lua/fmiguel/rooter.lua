-- Files indicating root directory.
local root_names = {
  ".git",
  ".hg",
  ".bzr",
  ".svn",
  "Makefile",
  "Cargo.toml",
  "Cargo.lock",
  "package.json",
  "go.mod",
}

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

function set_root()
  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then return end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then return end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
end

vim.api.nvim_create_autocmd('BufEnter', { callback = set_root })

