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

local function set_population(client, args)
    local p = api.call_function("get_selected_province", client)
    local count = tonumber(args[2])

    if p and not game_data.provinces[p].w then
        if count then
            game_data.provinces[p].p = count
            api.call_function("chat_message", "Province "..p.." population: "..count, "system")
        else
            api.call_function("chat_message", "Bad argument. /setpopulation [count]", "error", true, client)
        end
    else
        api.call_function("chat_message", "Please, select province", "error", true, client)
    end
end

function M.init(_api)
    api = _api
    api.register_command("/setyear", set_year)
    api.register_command("/setpopulation", set_population)
end

return M