--ConVar syncing
CreateConVar("ttt2_menace_seconds_per_credit", "60", {FCVAR_ARCHIVE, FCVAR_NOTFIY})
CreateConVar("ttt2_menace_show_next_item", "1", {FCVAR_ARCHIVE, FCVAR_NOTFIY})
CreateConVar("ttt2_menace_oops_pct", "0.0", {FCVAR_ARCHIVE, FCVAR_NOTFIY})
CreateConVar("ttt2_menace_oops_all", "", {FCVAR_ARCHIVE, FCVAR_NOTFIY})

hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicMenaceCVars", function(tbl)
	tbl[ROLE_MENACE] = tbl[ROLE_MENACE] or {}
	
	--# How many seconds per credit "spent" will the menace need to wait before receiving their next item?
	--  ttt2_menace_seconds_per_credit [0..n] (default: 60)
	table.insert(tbl[ROLE_MENACE], {
		cvar = "ttt2_menace_seconds_per_credit",
		slider = true,
		min = 5,
		max = 300,
		decimal = 0,
		desc = "ttt2_menace_seconds_per_credit (Def: 60)"
	})
	
	--# Should the menace be made aware of the next item that they will receive?
	--  ttt2_menace_show_next_item [0/1] (default: 1)
	table.insert(tbl[ROLE_MENACE], {
		cvar = "ttt2_menace_show_next_item",
		checkbox = true,
		desc = "ttt2_menace_show_next_item (Def: 1)"
	})
	
	--# The chance that the Menace will receive the same item over and over again until end of round.
	--  ttt2_menace_oops_pct [0.0..n.m] (default: 0.0)
	table.insert(tbl[ROLE_MENACE], {
		cvar = "ttt2_menace_oops_pct",
		slider = true,
		min = 0.0,
		max = 1.0,
		decimal = 2,
		desc = "ttt2_menace_oops_pct (Def: 0.0)"
	})
	
	--Note: ULX does not appear to support string convars. So we can't insert it into the table.
end)

hook.Add("TTT2SyncGlobals", "AddMenaceGlobals", function()
	SetGlobalInt("ttt2_menace_seconds_per_credit", GetConVar("ttt2_menace_seconds_per_credit"):GetInt())
	SetGlobalBool("ttt2_menace_show_next_item", GetConVar("ttt2_menace_show_next_item"):GetBool())
	SetGlobalFloat("ttt2_menace_oops_pct", GetConVar("ttt2_menace_oops_pct"):GetFloat())
	SetGlobalString("ttt2_menace_oops_all", GetConVar("ttt2_menace_oops_all"):GetString())
end)

cvars.AddChangeCallback("ttt2_menace_seconds_per_credit", function(name, old, new)
	SetGlobalInt("ttt2_menace_seconds_per_credit", tonumber(new))
end)
cvars.AddChangeCallback("ttt2_menace_show_next_item", function(name, old, new)
	SetGlobalBool("ttt2_menace_show_next_item", tobool(tonumber(new)))
end)
cvars.AddChangeCallback("ttt2_menace_oops_pct", function(name, old, new)
	SetGlobalFloat("ttt2_menace_oops_pct", tonumber(new))
end)
cvars.AddChangeCallback("ttt2_menace_oops_all", function(name, old, new)
	SetGlobalString("ttt2_menace_oops_all", tonumber(new))
end)
