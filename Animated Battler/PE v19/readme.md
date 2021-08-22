Puts scripts in 'Animated Battler.rar' in '\Plugins\Animated Battler'



# Change value

You can set wait frame or repeat frame



What is wait frame? -> One frame moves other frame after 'wait frame' frame.

What is repeat frame? -> After finishing all frames one times, it return again. Finish animated bitmap when finishing 'repeat frame' times.



Find in '0 - Set repeat.rb'

Set trainer:

  + wait frame in WaitT

  + repeat frame in Trainer

Set pokemon:

  + wait frame in WaitP

  + repeat frame in Pokemon

Set animated in battle

  + Animated -> If you set true, it will show animated

  + Speed -> Speed of this animated. After this times, graphic moves to other frame.

  + First -> Use when pokemon faint. If you set it true, pokemon that will show first frame faint (case: not animated)

  + Faint -> Set true and pokemon has animated when he faint.

  + Move -> Set true and pokemon has animated when he use moves.

  + SpeedMove -> Speed of this animated. After this times, graphic moves to other frame. (case: pokemon use moves)

If you want to animated in some features, add files in 'New features.rar' in '\Plugins\Animated Battler'

File must be add: '6 - New function.rb'

You can set wait frame in 'FRAME_PKMN' and read comments if you want to use 'CHECK_ONE_TIME'



Features, you don't need to add all, you can choose feature that you want to show animated bitmap

File name of each feature:

  7-1 -> Menu (Summary)

  7-2 -> Evolution

  7-3 -> Pokedex

  7-4 -> Animation when using HM

  7-5 -> Storage (mosaic bitmap)

  7-6 -> Egg Hatching

  7-7 -> Trading

  7-8 -> Mystery Gift

  7-9 -> Hall of Fame
