-- fort wars device file

ConstructEffect = nil
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = ""
Scale = 1
SelectionWidth = 80
SelectionHeight = 40
SelectionOffset = { 0.0, -40.5 }
Mass = 500.0
HitPoints = 350.0
DestroyProjectile = nil
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
DrawBracket = false
DrawBehindTerrain = true
NoReclaim = false
TeamOwned = true
BlockPenetration = true
ClaimsStructure = true

--dofile("effects/device_smoke.lua")
--SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
	{
		Name = "engine-base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/devices/engine/engine2.png" }, mipmap = true, }, },
		},
	},
    
}

Root =
{
	Name = "engine",
	Angle = 0,
	Pivot = { 0, -0.55 },
	PivotOffset = { 0, 0 },
	Sprite = "engine-base",
    Scale = 1,
    UserData = 0,

	ChildrenInFront =
	{
	},
}
