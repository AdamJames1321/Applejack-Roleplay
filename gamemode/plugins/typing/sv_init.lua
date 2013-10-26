--[[
	~ Typing Plugin / SV ~
	~ Applejack ~
--]]

--[[
Changelog:
29/1/10: Updated to new plugin format.
]]

-- Include the shared file and add it to the client download list.
includecs("sh_init.lua");

-- A console command to tell all players that a player is typing.
concommand.Add("cider_typing_start", function(player, command, arguments)
	if (player:Alive() and !player:KnockedOut()) then
		player:SetNetworkedBool("cider_Typing", true);
	end
end);

-- A console command to tell all players that a player has finished typing.
concommand.Add("cider_typing_finish", function(player, command, arguments)
	if ( player:IsValid() ) then
		player:SetNetworkedBool("cider_Typing", false);
	end
end);