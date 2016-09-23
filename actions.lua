
function actions_resX(event)
    local player_config = getConfig(game.players[event.player_index])

    if string.is_empty(event.text) then
        return
    end

    player_config.resX = math.ceil(event.text)
end

function actions_resY(event)
    local player_config = getConfig(game.players[event.player_index])

    if string.is_empty(event.text) then
        return
    end

    player_config.resY = math.ceil(event.text)
end

function actions_zoom(event)
    local player_config = getConfig(game.players[event.player_index])

    if string.is_empty(event.text) then
        return
    end

    player_config.zoom = event.text
end

function actions_antialias(event)
    local player_config = getConfig(game.players[event.player_index])

    player_config.antialias = event.state
end

function actions_prefix(event)
    local player_config = getConfig(game.players[event.player_index])

    if string.is_empty(event.text) then
        return
    end

    player_config.prefix = event.text
end

function registerAllHandlers()
    Gui.on_click("Screenshot_closeButton", function(event)
        local player = game.players[event.player_index]
        if getMainWindow(player) then
            hideMainWindow(player)
        end
    end)

    Gui.on_checked_state_changed("Screenshot_antialias", actions_antialias)

    Gui.on_text_changed("Screenshot_resX", actions_resX)
    Gui.on_text_changed("Screenshot_resY", actions_resY)
    Gui.on_text_changed("Screenshot_zoom", actions_zoom)
    Gui.on_text_changed("Screenshot_prefix", actions_prefix)

end

--Go ahead and register them now. There is no harm in it.
registerAllHandlers()
