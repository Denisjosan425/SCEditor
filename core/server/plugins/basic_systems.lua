local M = {}

local api

local function set_year(client, args)
    local year = tonumber(args[2])
    if year then
        game_data.year = year
        api.call_function("chat_message", "Year changed to "..year, "system", true, client)
    else
        api.call_function("chat_message", "Bad argument. /setyear [year]", "error", true, client)
    end
end

function M.init(_api)
    api = _api
    api.register_command("/setyear", set_year)
end

return M