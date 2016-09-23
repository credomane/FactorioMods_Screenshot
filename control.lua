
--Include needed stdlib libs.
require "stdlib/core"
require "stdlib/game"
require "stdlib/gui/gui"
require "stdlib/string"

require "gui"
require "actions"

script.on_event("screenshot", function(event)
    doScreenshot(event, false)
end)

script.on_event("screenshot-alt", function(event)
    doScreenshot(event, true)
end)

script.on_event("screenshot-config", function(event)
    local player = game.players[event.player_index]
    if (not getMainWindow(player)) then
        showMainWindow(player)
    else
        hideMainWindow(player)
    end
end)

function getConfig(player)
    checkConfig(player)
    return global.config[getConfigName(player)]
end

function getConfigName(player)
    local player_config_name = tostring(player.index) .. "_" .. player.name
    return player_config_name
end

function checkConfig(player)
    local player_config_name = getConfigName(player)

    if global.config == nil then
        global.config = {}
    end

    if global.config[player_config_name] == nil then
        global.config[player_config_name] = {
            resX = 1920,
            resY = 1080,
            zoom = 1,
            antialias = false,
            prefix = "Screenshot_"
        }
    end
end

function doScreenshot(event, altinfo)
    local player = game.players[event.player_index]
    local player_config = getConfig(game.players[event.player_index])

    local filename = "Screenshot/" .. player_config.prefix .. game.tick .. ".png"

    game.take_screenshot({
        player = player,
        by_player = player,
        resolution = {player_config.resX , player_config.resY},
        zoom = player_config.zoom,
        show_entity_info = altinfo,
        anti_alias = player_config.antialias,
        path  = filename
    })

    if altinfo then
        player.print({"Screenshot_taken_alt", filename})
    else
        player.print({"Screenshot_taken", filename})
    end
end
