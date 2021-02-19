if SERVER then
	AddCSLuaFile()
	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_mena.vmt")
end

function ROLE:PreInitialize()
	self.color = Color(255, 105, 105, 255)
	self.abbr = "mena" -- abbreviation
	
	--Score vars
	self.surviveBonus = 0.5 -- bonus multiplier for every survive while another player was killed
	self.scoreKillsMultiplier = 5 -- multiplier for kill of player of another team
	self.scoreTeamKillsMultiplier = -16 -- multiplier for teamkill
	
	--Prevent the Menace from gaining credits normally.
	self.preventFindCredits = true
	self.preventKillCredits = true
	self.preventTraitorAloneCredits = true
	
	self.defaultEquipment = SPECIAL_EQUIPMENT -- here you can set up your own default equipment
	self.defaultTeam = TEAM_TRAITOR
	
	self.conVarData = {
		pct = 0.17, -- necessary: percentage of getting this role selected (per player)
		maximum = 1, -- maximum amount of roles in a round
		minPlayers = 6, -- minimum amount of players until this role is able to get selected
		togglable = true, -- option to toggle a role for a client if possible (F1 menu)
		random = 30,
		traitorButton = 1, -- can use traitor buttons
		
		--Menace has no credits, but still has a shop
		credits = 0,
		creditsTraitorKill = 0,
		creditsTraitorDead = 0,
		shopFallback = SHOP_FALLBACK_TRAITOR
	}
end

function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_TRAITOR)
end
