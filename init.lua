local get_tabs_folder = ya.sync(function(state)
  local ret = {}
  for i = 1, #cx.tabs do
    local tab = cx.tabs[i]
    table.insert(ret, tostring(tab.current.cwd))
  end
  return ret
end)

local select = function(paths)
  local command, filename = nil, os.tmpname()
  if ya.target_family() == "windows" then
    command = 'fzf --preview "dir /B /A \"{}\"" < ' .. filename
  else
    command = 'fzf --preview "ls --color=always -1A \"{}\" 2>/dev/null" < ' .. filename
  end
  local f = io.open(filename, "w")
  if not f then
    return
  end
  for _, path in ipairs(paths) do
    f:write(string.format("%s\n", path))
  end
  f:close()
  local permit = ya.hide()
  local handle = io.popen(command, "r")
  if handle then
    local selected = handle:read("*a"):gsub("[\r\n]+$", "")
    handle:close()
    for i, path in pairs(paths) do
      if selected == path then
        ya.manager_emit("tab_switch", { i - 1 })
      end
    end
  end
  permit:drop()
  os.remove(filename)
end

return {
  entry = function(self, args)
    select(get_tabs_folder())
  end
}
