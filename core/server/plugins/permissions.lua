local M = {}

local api

local default_group = "player"

local function set_permissions_group(client, group)
	local clients_data = api.get_data("clients_data")
	clients_data[client].permissions_group = group
end

function M.init(_api)
	api = _api
	api.register_function("set_permissions_group", set_permissions_group)
end

function M.on_player_registered(client)
	set_permissions_group(client, default_group)
end

return M