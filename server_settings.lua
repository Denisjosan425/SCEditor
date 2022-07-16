local t = {
	server_info = {
		type = "server_info",
		data = {
			--Server name
			name = "Cold Path Scenario Editor",
			--Will be automatically changed
			players = 1,
			--Will be automatically filled
			server_ip = "",
			--Port through which the server will be available
			server_port = 2222,
			--Will be automatically changed
			size = 10
		}
	},
	--[[ This is the first number of the game version.
	Example: game version is 5.3, server version is 5, because
	client-server compatibility is determined by this number.
	Do not touch in order to allow players to join. Update the server.--]]
	SERVER_VERSION = 17,
	-- Maximum amount of time per turn. Seconds
	time_to_turn = 90000,
	verify_uuid = true,
	plugin = {
		welcome = [[CScenarios Tool v1.0 by Verden Brammts#6960
		help: /h]],
		difficulty = "standard"
	}
}
return t