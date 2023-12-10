if vim.loop.os_uname().sysname == "Linux" then
  local handle = io.popen("gdbus call --session"
  .. " --dest=org.freedesktop.portal.Desktop"
  .. " --object-path=/org/freedesktop/portal/desktop"
  .. " --method=org.freedesktop.portal.Settings.Read"
  .. " org.freedesktop.appearance color-scheme")
  local xdg_pref = string.match(handle:read('*a'), ' %d')
  if xdg_pref == " 0" or xdg_pref == "2" then
    vim.o.background = "light"
  end
  handle:close()
end

function set_theme()
  if vim.o.background == "dark" then
    vim.cmd("colorscheme nightfox")
    return
  end
  vim.cmd("colorscheme dawnfox")
end

set_theme()

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = {"background"},
  callback = set_theme,
})

