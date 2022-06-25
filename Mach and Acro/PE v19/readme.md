#  How to use:

Insert Script

Put files in `Mach and acro bike.rar` in `\Plugins\Mach and acro bike`

#  How To Use (Acro Bike):
- Edit the AcroBikeFileName Setting to what your Acro Bike Graphics would be
- ADD THE GRAPHICS INTO THE CHARACTERS FOLDER
- ADD THE ITEM "ACROBIKE" (The internal name must be ACROBIKE at the very least)

#  How To Use (Mach Bike):
- ADD THE ITEM "MACHBIKE" (The internal name must be MACHBIKE at the veryleast)

#  How to create Acro Bike Rails:
- Go into the Tileset Editor (through DEBUG mode or Essentials)
- Find your desired Acro Bike Rails and set their Terrain Tag to (18 for Up/Down Rails) or (19 for Left/Right Rails)
- Go into RMXP's tileset editor and set the passages (4dir) of the rails to what it would normally be to pass (EG: Rails left and right need the left and right passages open but the top and bottom closed)

#  How to create Acro Bike Stepping Stones:
- Go into the Tileset Editor (through DEBUG mode or Essentials)
- Find your desired Acro Bike Stepping Stones and set their Terrain Tag to 20
- Go into RMXP's tileset editor and set the passages of the stepping stones to impassable (the script will allow you to move on them while hopping)

#  How to create Mach Bike Slopes:
- Go into the Tileset Editor (through DEBUG mode or Essentials)
- Find your desired Mach Bike Slopes and set their Terrain Tag to 21
- Go into RMXP's tileset editor and set the passages of the slope to passable

You can change terrain tag's number in file `Mach and Acro bike.rb`

When you use `pokemon following` of Golipod, copy this def and puts it below the script Following...
```
alias ab_surf pbSurf
def pbSurf
  tag = $game_map.terrain_tag($game_player.x,$game_player.y)
  return false if tag.acrobike
  return ab_surf
end
```
