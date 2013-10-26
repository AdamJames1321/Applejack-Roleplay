--[[
Name: "sh_jobs.lua".
	~ Applejack ~
--]]
--[[
--defaults
-- If you put any entry to nil, like the citizen does, it will use the values below instead.
male_model_string = GM.Config["Male Citizen Models"]
female_model_string = GM.Config["Female Citizen Models"]
description_string = "N/A."
salary_int = 0
maxplayers_int = 0 --(0 = no limit)
access_string = nil
blacklistable_bool = false
canmake_table = {CATEGORY_VEHICLES,CATEGORY_CONTRABAND}
cantuse_table = {}
timelimit_table = {0,5} --{max job time, time before rejoin of job}
loadout_table = nil
ammo_table = nil
TEAM_GENERIC = cider.team.add("name", Color(255, 255, 255, 255), male_model_string, female_model_string,
	{gang = 0,acces="",leve=1, group = GROUP_GENERIC},description_string, salary_int, maxplayers_int, access_string, blacklistable_bool,
	canmake_table,cantuse_table,timelimit_table,loadout_table,ammo_table)
access:
b = boss - can demote members of the same level. Restricted to a gang if used on a gang member
d = demote members of lower level. Restricted to a gang if used on a gang member
g = can give/take ents to/from gang
D = underlings can vote to depose
M = All group-to-group transitions must go through this.
]]
--[[
	NOTE:
		THE ORDER IN WHICH TEAMS ARE IN HERE IS THE ORDER IN WHICH THEY APPEAR ON THE SCOREBOARD AND JOB MENU

	RATHER THAN PUTTING JOBS THAT REQUIRE PLUGINS IN THE PLUGIN FOLDER WHERE THEY MIGHT GET MISSED, PUT THEM HERE WITH IFS.
	This is so order may be maintained and all jobs be modified at once.
]]
cider.team.gangs = {}
if (GM or GAMEMODE):GetPlugin("officials") then
	local gangs = {}
	gangs[0] = {"The Officials","models/player/breen.mdl","Enough red tape to drown a continent"}
	gangs[1] = {"The Police","models/player/riot.mdl","Less talk, more action!"}
	GROUP_GENERAL 		= cider.team.addGroup("Jobs List","General group.","P")
TEAM_MAYOR 				= cider.team.add("Mayor", Color(0, 0, 255, 255), "models/player/breen.mdl", "models/player/mossman.mdl",
							{gang = 1, access = "e", level = 3, group = GROUP_GENERAL},"Runs the city and keeps it in shape.", 300, 1, nil, true,
							nil,{CATEGORY_WEAPONS,CATEGORY_ILLEGAL_GOODS,CATEGORY_ILLEGAL_WEAPONS,CATEGORY_POLICE_WEAPONS,CATEGORY_EXPLOSIVES}
						)
TEAM_FBICOMMANDER		= cider.team.add("F.B.I - Commander", Color(24,116,205), "models/player/swat.mdl", "models/player/swat.mdl",
							{gang = 1, access = "e", level = 1, group = GROUP_GENERAL}, "Commander of a squad from the Federal Bureau of Investigation", 500 /*salary*/, 1 /*max players*/, nil, true
						)							
TEAM_FBI				= cider.team.add("F.B.I - Agent", Color(30,144,255), "models/player/gasmask.mdl", "models/player/gasmask.mdl",
							{gang = 1, access = "e", level = 1, group = GROUP_GENERAL}, "Agent of a squad from the Federal Bureau of Investigation", 400, 3, nil, true
						)


	TEAM_POLICECOMMANDER 	= cider.team.add("Police Commander", Color(24,116,205), "models/player/urban.mdl", "models/player/urban.mdl",
																						--"models/player/pz_comma.mdl", "models/player/pz_comma.mdl",
											{gang = 1, access = "de", level = 1, group = GROUP_GENERAL},"Controls the police and criminal justice.", 300, 1, nil, true,
											nil,{CATEGORY_ILLEGAL_GOODS,CATEGORY_EXPLOSIVES},{60,10},{"weapon_mad_p228","weapon_mad_mp5","cider_baton"},{{"ent_mad_ammo_9mm",824}}
							)
	TEAM_POLICEOFFICER 		= cider.team.add("Police Officer", Color(30,144,255), "models/player/riot.mdl", "models/player/riot.mdl",
																						--"models/player/pz_poli.mdl", "models/player/pz_poli.mdl",
											{gang = 1, access = "", level = 1, group = GROUP_GENERAL},"Maintains the city and arrests criminals.", 250, 6, nil, true,
											nil,{CATEGORY_ILLEGAL_GOODS,CATEGORY_ILLEGAL_WEAPONS,CATEGORY_EXPLOSIVES},nil,{"weapon_mad_p228","cider_baton"},{{"ent_mad_ammo_9mm",824}}
							)
	TEAM_QUARTERMASTER		= cider.team.add("Quartermaster", Color(0,178,238),{"models/player/Hostage/Hostage_02.mdl","models/player/Hostage/Hostage_03.mdl"},{"models/player/Hostage/Hostage_02.mdl","models/player/Hostage/Hostage_03.mdl"},
											{gang = 0, access = "", level = 1, group = GROUP_GENERAL},"Supplies the police with their needs", 200,1,nil,true,
											{CATEGORY_VEHICLES,CATEGORY_CONTRABAND,CATEGORY_WEAPONS,CATEGORY_POLICE_WEAPONS,CATEGORY_AMMO},{CATEGORY_ILLEGAL_GOODS,CATEGORY_ILLEGAL_WEAPONS}
							)
	TEAM_SECRETARY			= cider.team.add("Secretary",Color(0,191,255),{"models/player/Hostage/Hostage_01.mdl","models/player/Hostage/Hostage_04.mdl"},{"models/player/Hostage/Hostage_01.mdl","models/player/Hostage/Hostage_04.mdl"},
											{gang = 0, access = "", level = 1, group = GROUP_GENERAL},"Maintains public relations and does misc jobs",200,2,nil,nil,
											nil,{CATEGORY_ILLEGAL_GOODS,CATEGORY_ILLEGAL_WEAPONS}
							)
							
table.insert(cider.team.gangs,gangs)
end

--citizens
local gangs = {}
gangs[0] = {"The Civilians","models/player/Group01/male_07.mdl","Keep me out of this!"}

						--[[
TEAM_BUILDER 			= cider.team.add("Builder",Color(90,230,20,255),"models/player/barney.mdl","models/player/barney.mdl",
										{gang = 0, access = "", level = 2, group = GROUP_CIVILIANS},"Builds props for $150 per prop, non-refundable. 15 Minutes of usage max, 15 props max.",50,2,"pE",true,
										nil,nil,{15,15}
						)
						--]]
TEAM_GUNDEALER 		= cider.team.add("Gun Dealer", Color(205,92,102), "models/player/monk.mdl", "models/player/alyx.mdl",
										{gang = 0, access = "", level = 1, group = GROUP_GENERAL},"Deals weapons to the city's inhabitants.", 100, 2, nil, true,
										{CATEGORY_VEHICLES,CATEGORY_CONTRABAND,CATEGORY_WEAPONS,CATEGORY_AMMO,CATEGORY_ILLEGAL_WEAPONS},nil
						)
if (GM or GAMEMODE):GetPlugin("hunger") then
TEAM_CHEF 				= cider.team.add("Chef", Color(255, 125, 200, 255), "models/player/group02/male_02.mdl", "models/player/group02/female_07.mdl",
										{gang = 0, access = "", level = 1, group = GROUP_GENERAL},"Deals food to the city's inhabitants.", 150, 2, nil, true,
										{CATEGORY_VEHICLES,CATEGORY_CONTRABAND,CATEGORY_FOOD,CATEGORY_ALCOHOL,CATEGORY_DRINKS}
						)
end
TEAM_DOCTOR 			= cider.team.add("Doctor", Color(125, 225, 150, 255), "models/player/kleiner.mdl", "models/player/kleiner.mdl",
										{gang = 0, access = "", level = 1, group = GROUP_GENERAL},"Deals medical supplies to the city's inhabitants.", 150, 2, nil, true,
										{CATEGORY_VEHICLES,CATEGORY_CONTRABAND,CATEGORY_DRUGS}
						)
TEAM_CITIZEN 			= cider.team.add("Citizen", Color(25, 150, 25, 255), nil, nil,
										{gang = 0, access = "M", level = 1, group = GROUP_GENERAL},"A regular Citizen living in the city.", 200, nil, nil, nil, nil,{CATEGORY_ILLEGAL_GOODS,CATEGORY_ILLEGAL_WEAPONS,CATEGORY_EXPLOSIVES,CATEGORY_POLICE_WEAPONS}
						)
table.insert(cider.team.gangs,gangs)
-----------------------------
--	Dissidents
-----------------------------
TEAM_ALCAPONE		= cider.team.add("The Boss", Color(150, 25, 25, 255),"models/humans/mafia/male_08.mdl","models/humans/mafia/male_02.mdl",
										{gang = 0, access = "bdgeD", level = 1, group = GROUP_GENERAL},"Leader of the Mafia",250,1,nil,true
						)
TEAM_CAPONE			= cider.team.add("Mafia", Color(220,50,50,255), "models/humans/mafia/male_08.mdl","models/humans/mafia/male_04.mdl",
										{gang = 0, access = "", level = 1, group = GROUP_GENERAL},"A member of the mafia",225,5,nil,true
						)
gangs[1] = {"The Capones", "models/player/guerilla.mdl","Lean, mean, red machines!"}

TEAM_BLACKMARKETDEALER 	= cider.team.add("Black Market Dealer", Color(125, 125, 125, 255), "models/player/phoenix.mdl","models/player/phoenix.mdl",
										{gang = 0, access = "", level = 1, group = GROUP_GENERAL},"Deals illegal goods.", 100, 2, nil, true,
										{CATEGORY_VEHICLES,CATEGORY_EXPLOSIVES,CATEGORY_CONTRABAND,CATEGORY_POLICE_WEAPONS,CATEGORY_ILLEGAL_GOODS,CATEGORY_ILLEGAL_WEAPONS,CATEGORY_AMMO},nil,{10,10}
						)
local rebelsf,rebelsm = {	"models/player/Group03/Female_01.mdl",
							"models/player/Group03/Female_02.mdl",
							"models/player/Group03/Female_03.mdl",
							"models/player/Group03/Female_04.mdl",
							"models/player/Group03/Female_06.mdl",
							"models/player/Group03/Female_07.mdl"
						},
						{	"models/player/Group03/Male_01.mdl",
							"models/player/Group03/Male_02.mdl",
							"models/player/Group03/Male_03.mdl",
							"models/player/Group03/Male_04.mdl",
							"models/player/Group03/Male_05.mdl",
							"models/player/Group03/Male_06.mdl",
							"models/player/Group03/Male_07.mdl",
							"models/player/Group03/Male_08.mdl",
							"models/player/Group03/Male_09.mdl"
						}
TEAM_REBELLEAD			= cider.team.add("Rebel Leader", Color(48,48,48), rebelsm,rebelsf,
										{gang = 0, access = "", level = 1, group = GROUP_GENERAL},
										"Leader of the Rebel group. He takes part in every rebel-related actions.",75,1, nil, true
					)

TEAM_REBEL			= cider.team.add("Rebel", Color(48,48,48), rebelsm,rebelsf,
										{gang = 0, access = "", level = 1, group = GROUP_GENERAL},
										"Small group of dissidents, they mostly hate the Government and raid for any better Mayor.",75,5, nil, true
					)
					
table.insert(cider.team.gangs,gangs)
--default REQUIRED
TEAM_DEFAULT = TEAM_CITIZEN