hook.Add("DoPlayerDeath", "prone.ExitOnDeath", function(ply)
	if ply:IsProne() then
		prone.Exit(ply)
	end
end)

hook.Add("PlayerSpawn", "prone.ExitOnDeath", function(ply)
	if ply:IsProne() then
		prone.Exit(ply)
	end
end)

if prone.Config.FallDamageMultiplier ~= 1 then
	local velDeath = 200

	hook.Add("GetFallDamage", "prone.FallDamage", function(ply, speed)
		if ply:IsProne() and ply:GetInfoNum("cl_dmg_nofall", 0) == 0 then
			if speed < velDeath then return 0 end
			--copied from sandbox_modded but tweaked to fit in
			return math.pow(0.05 * (speed - velDeath), 1.75) * prone.Config.FallDamageMultiplier
		end
	end)
end