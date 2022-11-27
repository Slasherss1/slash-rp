AddCSLuaFile()

SWEP.Spawnable = true
SWEP.UseHands = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Primary.Sound = "slash/taser/discharge.wav"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.ViewModel = "models/csgo/weapons/c_csgo_taser.mdl"
SWEP.WorldModel = "models/csgo/weapons/w_eq_taser.mdl"

SWEP.PrintName = "Taser"
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Slot = 4

function SWEP:PrimaryAttack()
    self.Owner:EmitSound(self.Primary.Sound)
end