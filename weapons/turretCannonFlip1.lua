dofile(path .. "/weapons/turretCannon2.lua")



Sprites = {}

Root =
{
    Name = "TurretCannon",
    Angle = 0,
    Pivot = { 0.01, -0.445 },
    PivotOffset = { 0, 0 },
    Sprite = "turretCannon-flip1",
    UserData = 0,
    ChildrenBehind = {

        {
            Name = "Basket",
            Pivot = { -0.01, 0.67 },
            Sprite = "turretCannon-basket"
        },
    }
}
