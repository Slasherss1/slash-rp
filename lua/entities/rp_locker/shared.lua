ENT.Type = 'anim'
ENT.Base = 'base_gmodentity'
ENT.PrintName = "Locker"
ENT.Spawnable = true
ENT.Editable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "Wep", {KeyName = "wep", Edit = {type = "Generic", title = "Valid CW 2.0 Weapon", order = 0}})
	self:NetworkVar("Int", 1, "Arr", {KeyName = "arr", Edit = {type = "Int", title = "Armor", order = 1, min = 0, max = 200}})

	if SERVER then
		self:SetWep("cw_ar15")
		self:SetArr(25)
	end
end