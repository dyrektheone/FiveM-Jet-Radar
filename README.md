# FiveM-Jet-Radar

## About
This is a STANDLONE Jet Radar project with a lot of customization options. 

## Usage
There is nothing much to say. Look through the configs, read the documentation but basically it's the following. 
Get in a supported vehicle, fly above the "EnableAbove" config options and boom!

## How it works
So I used an interesting approach here, the LUA client sends the nearby vehicles regulalry but the NUI ONLY updates when the "scanner" made 1 turn, and is back at the very top.
Check the FiveM forum page, and the video, you'll understand it!

## Features
### Friendly vehicle system
The resource provides 4 client events
- **jet_radar:registerVehicleAsFriendly**    < ARGUMENT: vehicle | register it as friendly
- **jet_radar:removeVehicleAsFriendly**      < ARGUMENT: vehicle | remove from friendlies
- **jet_radar:clearFriendlyVehicles**        < NO ARGUMENTS      | clears the "friendlyVehicles" array back to empty
- **jet_radar:getFriendlyVehicles**          < NO ARGUMENTS      | returns the registered friendly vehicles
***Please note that these events are client-side! So for example if you trigger "jet_radar:getFriendlyVehicles" from a server-script it WON'T return anything.***

## FiveM Forum Page

## Video
The preview video can be found on the FiveM forum page.

## Screenshots
![image](https://github.com/DyrekKing/FiveM-Jet-Radar/assets/68273911/2290faad-3339-4d4e-836e-b82d8684bad5)

![image-2](https://github.com/DyrekKing/FiveM-Jet-Radar/assets/68273911/d69129d6-1b2f-49d7-bf5f-ecc765862803)

### The resource contains 2 configs. One for the visual options (config.js, the top screenshot) and one for the "logical" options (config.lua, the bottom screenshot)



![js](https://github.com/DyrekKing/FiveM-Jet-Radar/assets/68273911/72fb96b1-82ce-4ca1-958d-2ea8bdcd39e8)
![Képernyőkép 2023-08-02 112944](https://github.com/DyrekKing/FiveM-Jet-Radar/assets/68273911/ba29ce55-e623-4ff7-a679-207827b8a048)
