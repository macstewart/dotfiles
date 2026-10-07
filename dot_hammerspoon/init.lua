hs.console.clearConsole()

-- The keymap layer is dead without this process, so don't rely on remembering to start it.
hs.autoLaunch(true)

keyremap = require("keyremap")

hs.ipc.cliInstall()

-- Task docs link here via `pane: hammerspoon://flow-jump?owner=...` (claude-flow).
hs.urlevent.bind("flow-jump", function(_, params)
  hs.task.new(os.getenv("HOME") .. "/.claude/skills/conductor/bin/flow-jump", nil, { params.owner or "" }):start()
end)

-- Reload on config change so edits take effect without touching the menubar.
configWatcher = hs.pathwatcher.new(hs.configdir, function(files)
  for _, file in ipairs(files) do
    if file:sub(-4) == ".lua" then return hs.reload() end
  end
end):start()

hs.alert.show("Hammerspoon loaded")
