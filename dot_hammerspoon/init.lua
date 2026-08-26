hs.console.clearConsole()

-- The keymap layer is dead without this process, so don't rely on remembering to start it.
hs.autoLaunch(true)

keyremap = require("keyremap")

hs.ipc.cliInstall()

-- Reload on config change so edits take effect without touching the menubar.
configWatcher = hs.pathwatcher.new(hs.configdir, function(files)
  for _, file in ipairs(files) do
    if file:sub(-4) == ".lua" then return hs.reload() end
  end
end):start()

hs.alert.show("Hammerspoon loaded")
