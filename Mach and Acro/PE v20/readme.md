## How to use:
Puts files in `Mach and acro bike` to `\Plugins\Mach and acro bike`

#### Character changes outfit
Look at file `1 - Mach and Acro bike.rb`, there are `ACRO_BIKE = [...]` and `MACH_BIKE = [...]`.

Each line is one character, this array's order is like trainer's order in `PBS`.

Put image which has name that you set in `Graphics\Characters`.

You can read `first lines` in file `1 - Mach and Acro bike.rb` to add graphics.

#### Set terrain tag and passage (4 dir)
Look at file `1 - Mach and Acro bike.rb` and you can see these lines.
```
GameData::TerrainTag.register({
  :id            => :acro_bike_up_down,
  :id_number     => 18,
	:acro_bike_U_D => true,
	:acro_bike     => true
})

GameData::TerrainTag.register({
  :id            => :acro_bike_left_right,
  :id_number     => 19,
	:acro_bike_L_R => true,
	:acro_bike     => true
})

GameData::TerrainTag.register({
  :id            => :acro_bike_hop,
  :id_number     => 20,
	:acro_bike_hop => true
})

GameData::TerrainTag.register({
  :id        => :mach_bike,
  :id_number => 21,
	:mach_bike => true
})
```

Change `id_number` if you want. This is terrain tag's number.

Set `passage` like this guide or like you want:

###### `Acro bike rails`
Go into RMXP's tileset editor and set the passages (4dir) of the rails to what it would normally be to pass (EG: Rails left and right need the left and right passages open but the top and bottom closed)

###### `Acro bike Stepping Stones`
Go into RMXP's tileset editor and set the passages of the stepping stones to impassable (the script will allow you to move on them while hopping)

###### `Mach bike`
Go into RMXP's tileset editor and set the passages of the slope to passable

#### New features
Now, you can set rails like bridge in PE.

Look at file `1 - Mach and Acro bike.rb`. You can see this line `def self.rail_like_bridge = true`

When you set `def self.rail_like_bridge = true`, you can use this feature and vice versa.

Then, set `priority` and set event `pbBridgeOff` and `pbBridgeOn` like event bridge.

`Attention`

When player use acro bike, he can jump over tiles which are beside. So, you make use of basic things in RMXP.

`Thanks for reading!`
