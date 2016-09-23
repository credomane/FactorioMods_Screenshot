--------------------------------
-- MAIN WINDOW
--------------------------------
function getMainWindow(player)
    if (not player or not player.valid or not player.connected) then
        return nil
    end
    if (player.gui.center.ScreenshotConfig ~= nil) then
        return player.gui.center.ScreenshotConfig
    end
    return nil
end

function showMainWindow(player)
    if (not player or not player.valid or not player.connected) then
        return
    end
    if (not getMainWindow(player)) then
        player.gui.center.add({type = "frame", name = "ScreenshotConfig", caption = {"Screenshot_mainWindow"}, direction = "horizontal"})
        showMainPane(player)
    end
end

function hideMainWindow(player)
    local mainWindow = getMainWindow(player)
    if (mainWindow) then
        mainWindow.destroy()
    end
end


function showMainPane(player)
    local player_config = getConfig(player)

    if (not getMainWindow(player)) then
        showMainWindow(player)
    end
    local mainWindow = getMainWindow(player)
    local mainPane = mainWindow.add({type = "table", name = "mainPane", colspan = 1})
    
    local tbl = mainPane.add({type = "table", name = "table1", colspan = 3})
    tbl.add({type = "label", name = "label_res", caption = {"Screenshot_res"}})
    local resX = tbl.add({type = "textfield", name = "Screenshot_resX", text = player_config.resX})
    resX.style.minimal_width = 50
    resX.style.maximal_width = 50
    local resY = tbl.add({type = "textfield", name = "Screenshot_resY", text = player_config.resY})
    resY.style.minimal_width = 50
    resY.style.maximal_width = 50

    tbl.add({type = "label", name = "label_zoom", caption = {"Screenshot_zoom"}})
    local zoom = tbl.add({type = "textfield", name = "Screenshot_zoom", text = player_config.zoom})
    zoom.style.minimal_width = 50
    zoom.style.maximal_width = 50
    tbl.add({type = "label"})

    tbl.add({type = "checkbox", name = "Screenshot_antialias", state = player_config.antialias, caption = {"Screenshot_antialias"}})
    tbl.add({type = "label"})
    tbl.add({type = "label"})

    local tbl2 = mainPane.add({type = "table", name = "table2", colspan = 2})

    tbl2.add({type = "label", name = "label_prefix", caption = {"Screenshot_prefix"}})
    local prefix = tbl2.add({type = "textfield", name = "Screenshot_prefix", text = player_config.prefix})
    prefix.style.minimal_width = 150
    prefix.style.maximal_width = 150

    mainPane.add({type = "button", name = "Screenshot_closeButton", caption = {"Screenshot_closeButton"}})

end

function hideMainPane(player)
    local mainPane = getMainPane(player)
    if (mainPane) then
        mainPane.destroy()
    end
end
