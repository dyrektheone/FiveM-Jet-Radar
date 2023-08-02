Config = {}
Config.RadarOptions = {}
Config.RadarDetectOptions = {}

-------------------------------------------------------------------------------------------------------------------------------------------------------------

Config.RadarOptions.DetectClasses = {15,16}                 -- the radar will only detect vehicles in this class. it's "helicopters" and "planes" by default | https://docs.fivem.net/natives/?_0x29439776AAA00A62 for more info
Config.RadarOptions.SupportedVehicles = {                   -- the radar will only enable if the player is in one of these vehicles
    "hydra",
    "lazer"
}  
Config.RadarOptions.EnableAbove = 20.0                      -- if the player is in a supported vehicle, the radar will only engage above this height (Z axis)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

Config.RadarDetectOptions.HorizontalLimit = 1000.0          -- the radar will detect targets maximum from this distance | using the horizontal axis (X,Y)
Config.RadarDetectOptions.VerticalLimit   = 200.0           -- the radar will detect targets maximum from this distance | using the vertical axis (Z)
Config.RadarDetectOptions.TargetAltitude  = 0.0             -- the radar will only detect targets that are above this height (Z axis)

-------------------------------------------------------------------------------------------------------------------------------------------------------------