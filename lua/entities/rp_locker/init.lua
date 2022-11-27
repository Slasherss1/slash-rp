AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include("shared.lua")
 
function ENT:Initialize()
 
	self:SetModel( "models/props_c17/Lockers001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	self:SetUseType(SIMPLE_USE)
 
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end

	function self:Use(activator, caller)
		local usage = 0
		if activator:IsPlayer() and activator:Alive() then
			-- Healing
			if not (activator:Health() == activator:GetMaxHealth()) then
				activator:SetHealth(math.Clamp(activator:Health()+25,0,activator:GetMaxHealth()))
				usage = 1
			end
			-- Armor
			if not (activator:Armor() == self:GetArr()) then
				activator:SetArmor(self:GetArr())
				usage = 1
			end
			-- Ammo and weapon
			if not activator.AmmoGiveDelay or CurTime() > activator.AmmoGiveDelay then
				if true then
					wep = activator:GetActiveWeapon()
					
					if IsValid(wep) then
						if wep.CW20Weapon then
							ammo = activator:GetAmmoCount(wep.Primary.Ammo)
							
							if ammo < wep.Primary.ClipSize_Orig * 12 then
								-- check the amount of ammo that should be handed to the player
								amountToGive = math.Clamp(wep.Primary.ClipSize_Orig, 0, wep.Primary.ClipSize_Orig * 12)
								
								-- if it's greater than 0, give it to the player
								if amountToGive > 0 then
									activator:SetAmmo(math.Clamp(ammo + amountToGive, 0, wep.Primary.ClipSize_Orig * 12), wep.Primary.Ammo)
									usage = 1
								end
							end
						else
							activator:Give(self:GetWep())
						end
					end
				end
				activator.AmmoGiveDelay = CurTime() + 0.4
			end
		end
		if not (usage == 0) then
			activator:EmitSound("items/ammo_pickup.wav", 60, 100)
		end
	end
end

function ENT:SetDefaults()
	self:SetWep("cw_ar15")
	self:SetArr(25)
end