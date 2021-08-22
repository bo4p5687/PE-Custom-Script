Puts script in 'Script.rb' above Main



# Change value

You can set wait frame or repeat frame



What is wait frame? -> One frame moves other frame after 'wait frame' frame.

What is repeat frame? -> After finishing all frames one times, it return again. Finish animated bitmap when finishing 'repeat frame' times.



Find in 'module RepeatAnimate'



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
