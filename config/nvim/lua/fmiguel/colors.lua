if vim.loop.os_uname().sysname == "Linux" then
  local handle = io.popen("gdbus call --session"
  .. " --dest=org.freedesktop.portal.Desktop"
  .. " --object-path=/org/freedesktop/portal/desktop"
  .. " --method=org.freedesktop.portal.Settings.Read"
  .. " org.freedesktop.appearance color-scheme")
  if string.match(handle:read('*a'), ' %d') == " 1" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
  handle:close()
end

function set_theme()
  if vim.o.background == "dark" then
    vim.cmd("colorscheme carbonfox")
    return
  end
  vim.cmd("colorscheme dawnfox")
end

set_theme()

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = {"background"},
  callback = set_theme,
})

