-- This is a script designed to save the game scripts created in this editor
local M = {}

local api

-- Library for saving table data in text form
local pprint = require "scripts.utils.pprint"

local save_path = "savesystem/"

local function save(client, args)
    local filename = args[2]
    if filename then
        local scenario = "t = "..pprint.pformat(game_data).."\nreturn t"
        local scenario_file = io.open(save_path..filename..".lua", "w")
        scenario_file:write(scenario)
        scenario_file:close()
        api.call_function("chat_message", "The scenario is saved in "..save_path..filename..".lua.", "system", true, client)
    else
        api.call_function("chat_message", "You did not enter a file name!", "error", true, client)
    end
end

function M.init(_api)
    api = _api
    api.register_command("/save", save)
end

return M