-- Dual-role keys without Karabiner's DriverKit extension.
--
-- Layer 1 (hidutil, HID level, no permissions): caps_lock -> F18, escape -> F19, tab -> F17.
--   Applied at login by ~/Library/LaunchAgents/com.mackenziestewart.keyremap.plist,
--   and re-applied here on enable / keyboard attach (hidutil mappings are per-device
--   and are lost when a device reconnects or the machine reboots).
-- Layer 2 (this file, CGEventTap, Accessibility permission only):
--   F18 held -> ctrl flag on following keys, F18 tapped alone -> escape
--   F19 held -> hyper (cmd+alt+ctrl+shift) flag on following keys
--   F17 held -> alt flag on following keys, F17 tapped alone -> tab
--
-- Known limit vs Karabiner: flags are injected onto *key* events only, so
-- ctrl+click / ctrl+drag and "hold ctrl with no key" do not work.

local M = { enabled = false }

-- Auto-disable while this keyboard is attached; it does the remapping in firmware.
local DESK_KEYBOARD = "Moonlander Mark I"

-- Longer than this and a lone press is treated as a hold, emitting nothing.
local TAP_TIMEOUT = 0.2

local HID = {
  caps_lock = 0x700000039,
  escape    = 0x700000029,
  tab       = 0x70000002B,
  f17       = 0x70000006C,
  f18       = 0x70000006D,
  f19       = 0x70000006E,
}

local function keyMapping(pairs_)
  local entries = {}
  for _, p in ipairs(pairs_) do
    table.insert(entries, string.format(
      '{"HIDKeyboardModifierMappingSrc":0x%X,"HIDKeyboardModifierMappingDst":0x%X}', p[1], p[2]))
  end
  return string.format('{"UserKeyMapping":[%s]}', table.concat(entries, ","))
end

local MAPPING = keyMapping({
  { HID.caps_lock, HID.f18 },
  { HID.escape, HID.f19 },
  { HID.tab, HID.f17 },
})
local CLEARED = keyMapping({})

local function hidutil(json)
  hs.task.new("/usr/bin/hidutil", nil, { "property", "--set", json }):start()
end

local ROLES = {
  [hs.keycodes.map.f18] = { mods = { "ctrl" }, tap = "escape" },
  [hs.keycodes.map.f19] = { mods = { "cmd", "alt", "ctrl", "shift" } },
  [hs.keycodes.map.f17] = { mods = { "alt" }, tap = "tab" },
}

local held = {}
local types = hs.eventtap.event.types

local function modifierNames(flags)
  local names = {}
  for name, on in pairs(flags) do
    if on then table.insert(names, name) end
  end
  return names
end

-- Send the tapped key with whatever real modifiers were down at press time, so
-- shift-tab and cmd-tab still work.
local function sendTap(key, mods)
  hs.eventtap.event.newKeyEvent(mods, key, true):post()
  hs.eventtap.event.newKeyEvent(mods, key, false):post()
end

local function onKey(e)
  local code = e:getKeyCode()
  local role = ROLES[code]

  if role then
    if e:getType() == types.keyDown then
      local mods = modifierNames(e:getFlags())
      -- Chording role keys: holding caps and tapping tab should send ctrl-tab,
      -- and caps must not then emit escape on release.
      for heldCode, heldRole in pairs(ROLES) do
        if held[heldCode] then
          held[heldCode].used = true
          for _, mod in ipairs(heldRole.mods) do table.insert(mods, mod) end
        end
      end
      -- Auto-repeat re-fires keyDown; keep the original press time.
      held[code] = held[code] or {
        at = hs.timer.secondsSinceEpoch(),
        used = false,
        mods = mods,
      }
    else
      local press = held[code]
      held[code] = nil
      if press and not press.used and role.tap
        and hs.timer.secondsSinceEpoch() - press.at < TAP_TIMEOUT then
        sendTap(role.tap, press.mods)
      end
    end
    return true
  end

  local flags, injected = e:getFlags(), false
  for heldCode, heldRole in pairs(ROLES) do
    if held[heldCode] then
      held[heldCode].used = true
      for _, mod in ipairs(heldRole.mods) do flags[mod] = true end
      injected = true
    end
  end
  if injected then e:setFlags(flags) end
  return false
end

local tap = hs.eventtap.new({ types.keyDown, types.keyUp }, onKey)

local menu = hs.menubar.new()

local function render()
  if not menu then return end
  menu:setTitle(M.enabled and "⌃⎋" or "○")
  menu:setTooltip(M.enabled and "caps=ctrl/esc, esc=hyper" or "key remap off")
  menu:setMenu({
    { title = M.enabled and "Disable remap" or "Enable remap", fn = function() M.toggle() end },
    { title = "-" },
    { title = "Reassert tap (after skhd restart)", fn = function() M.reassert() end },
    { title = "Reload Hammerspoon", fn = function() hs.reload() end },
  })
end

function M.enable()
  hidutil(MAPPING)
  held = {}
  tap:start()
  M.enabled = true
  render()
end

function M.disable()
  tap:stop()
  held = {}
  hidutil(CLEARED)
  M.enabled = false
  render()
end

function M.toggle()
  if M.enabled then M.disable() else M.enable() end
end

-- Event taps are head-inserted, so the most recently started tap sees events
-- first. skhd only sees injected hyper flags if this tap is upstream of it —
-- restarting skhd puts skhd ahead, so restart this tap afterwards.
function M.reassert()
  if not M.enabled then return end
  tap:stop()
  tap:start()
end

local function deskKeyboardAttached()
  for _, device in ipairs(hs.usb.attachedDevices() or {}) do
    if device.productName == DESK_KEYBOARD then return true end
  end
  return false
end

-- The launchd agent applies the mapping unconditionally, so it can strand the
-- remapped keys as dead F17-F19 while the tap is off. Undo that if it happens.
M.reconciler = hs.timer.doEvery(30, function()
  if M.enabled then return end
  hs.task.new("/usr/bin/hidutil", function(_, stdout)
    if not M.enabled and stdout:find("HIDKeyboardModifierMappingSrc", 1, true) then
      hidutil(CLEARED)
    end
  end, { "property", "--get", "UserKeyMapping" }):start()
end)

M.usbWatcher = hs.usb.watcher.new(function(event)
  if event.productName == DESK_KEYBOARD then
    if event.eventType == "added" then M.disable() else M.enable() end
  elseif event.eventType == "added" and M.enabled then
    hs.timer.doAfter(1, function() if M.enabled then hidutil(MAPPING) end end)
  end
end):start()

if deskKeyboardAttached() then
  M.disable()
else
  M.enable()
end

return M
