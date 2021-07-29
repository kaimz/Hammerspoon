--
-- zk@20191212
--
appmod = {"cmd", "ctrl"}

hs.fnutils.each(applist, function(item)
    hs.hotkey.bind(appmod, item.shortcut, item.appname, function() activateApp(item.appname) end)
end)

applist = {
    {shortcut = 'c', appname = 'Google Chrome'},
    {shortcut = 'e', appname = 'Microsoft Excel'},
    {shortcut = 'f', appname = 'Finder'},
    {shortcut = 'i', appname = 'Amazon Chime'},
    {shortcut = 'j', appname = 'IntelliJ IDEA'},
    {shortcut = 'm', appname = 'NeteaseMusic'},
    {shortcut = 'o', appname = 'Microsoft Outlook'},
    {shortcut = 'p', appname = 'Microsoft PowerPoint'},
    {shortcut = 'r', appname = 'Firefox'},
    {shortcut = 't', appname = 'iTerm2'},
    {shortcut = 'w', appname = 'Microsoft Word'},
    {shortcut = 'x', appname = 'WeChat'},
}

function activateApp(appname)
    launchOrCycleFocus(appname)()
    local app = hs.application.find(appname)
    if app then
        app:activate()
        hs.timer.doAfter(0.1, highlightActiveWin)
        app:unhide()
    end
end

-- Needed to enable cycling of application windows
lastToggledApplication = ''

function launchOrCycleFocus(applicationName)
  return function()
    local nextWindow = nil
    local targetWindow = nil
    local focusedWindow          = hs.window.focusedWindow()
    local lastToggledApplication = focusedWindow and focusedWindow:application():name()

    if not focusedWindow then return nil end
    if lastToggledApplication == applicationName then
      nextWindow = getNextWindow(applicationName, focusedWindow)
      -- Becoming main means
      -- * gain focus (although docs say differently?)
      -- * next call to launchOrFocus will focus the main window <- important
      -- * when fetching allWindows() from an application mainWindow will be the first one
      --
      -- If we have two applications, each with multiple windows
      -- i.e:
      --
      -- Google Chrome: {window1} {window2}
      -- Firefox:       {window1} {window2} {window3}
      --
      -- and we want to move between Google Chrome {window2} and Firefox {window3}
      -- when pressing the hotkeys for those applications, then using becomeMain
      -- we cycle until those windows (i.e press hotkey twice for Chrome) have focus
      -- and then the launchOrFocus will trigger that specific window.
      nextWindow:becomeMain()
      nextWindow:focus()
    else
      hs.application.launchOrFocus(applicationName)
    end

    if nextWindow then
      targetWindow = nextWindow
    else
      targetWindow = hs.window.focusedWindow()
    end

    if not targetWindow then
      return nil
    end
  end
end

local function getNextWindow(windows, window)
  if type(windows) == "string" then
    windows = hs.application.find(windows):allWindows()
  end

  windows = hs.fnutils.filter(windows, hs.window.isStandard)
  windows = hs.fnutils.filter(windows, hs.window.isVisible)

  -- need to sort by ID, since the default order of the window
  -- isn't usable when we change the mainWindow
  -- since mainWindow is always the first of the windows
  -- hence we would always get the window succeeding mainWindow
  table.sort(windows, function(w1, w2)
    return w1:id() > w2:id()
  end)

  lastIndex = hs.fnutils.indexOf(windows, window)
  if not lastIndex then return window end

  return windows[getNextIndex(windows, lastIndex)]
end

-- Fetch next index but cycle back when at the end
--
-- > getNextIndex({1,2,3}, 3)
-- 1
-- > getNextIndex({1}, 1)
-- 1
-- @return int
local function getNextIndex(table, currentIndex)
  nextIndex = currentIndex + 1
  if nextIndex > #table then
    nextIndex = 1
  end

  return nextIndex
end
