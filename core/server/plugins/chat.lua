local M = {}

local api

local chat_message = function(text, type, just_for_host, client)
	types = {
		error = "#F52323",
		system = "#FEE721",
		default = "#E4E4E4"
	}
	local c = types[type] or types.default
	api.call_function("chat_function", "<color="..c..">[SCEdit]"..text.."</color>", just_for_host, client)
end

local function attribute_message(text,client)
	local client_name = api.get_data("clients_data")[client].name
	local message = "<color=#C6C6C6>:[<color=#F1F0F0>"..client_name.."</color>][<color=F1F0F0>SCEDIT</color>]:</color> "..text
	return message
end

function M.init(_api)
	api = _api
	api.register_function("chat_message", chat_message)
	api.register_function("attribute_message", attribute_message)
end

return M