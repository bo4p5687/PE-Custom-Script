# Put files
* Put `Scripts` in `D:\RPG Maker\PE\Pkmn\PE 19.1\Plugins\Pokeathlon`
* Files in `Graphics`
```
File in folder Pokeathlon -> Put it in `Graphics\Pokeathlon`
File in folder Characters -> Put it in `Graphics\Characters`
And you need to put files of pokemon in `Graphics\Characters`
This is file you used graphics of script Following Pokemon (in same folder) but it needs same size and each frame is 64.
So, these files have size 256 x 256
```
* Files in Data
```
This is map's files. You can see video to know `How to add`
```

# Use script

### PBS files
There are pbs files to check stats of pokemon.

Attention: Don't move these files into PBS folder. Just keep it like I put.

You can find files in `Plugins\Pokeathlon\1 - PBS`.

Read `Guide.txt` to learn how to add.

### Check stats
You can see there are 2 examples.

### Aprijuice
You can create item in pbs file. Look like
> 640,JUICEBLENDER,Juice Blender,Juice Blenders,8,0,"...",2,0,6

Or call in event: `Pokeathlon.juice_blender`

### Buy aprijuice
You can set price to buy or edit event in file `4 - Buy juice.rb` of folder `Plugins\Pokeathlon\2 - Main\5 - Feed pkmn - Buy Juice`.

You can see `PRICE_APRIJUICE` and `MILDNESS_BUY`. Read comment lines (line has #).

Call: `Pokeathlon.buy_juice` or `Pokeathlon.buy_juice(arr, price, buynumber)`

Explain:
* arr (default: nil)

> It's array. Size is 5. This is number: maximum is 63 and minimum is 0.

> Stats order in this array: Power, Stamina, Skill, Jump and Speed.

* price (default: 0)

> Price of this aprijuice. You can set in multi-events with different numbers

* buynumber (default: 0)

> This is `mildness` stats. The bigger `mildness` is, the better stat is

### Stats Pokemon
This method calls like you call `pkmn.hp`. In these examples, I will use pkmn (class Pokemon).
1. Call stats
```
pkmn.athlon_max -> Array: speed, power, skill, stamina and jump. Define maximum stat pokemon can get. (each value is number)
pkmn.athlon_normal -> Array: speed, power, skill, stamina and jump. Define stat pokemon get before drinking aprijuice. (each value is number)
pkmn.athlon_normal_changed and pkmn.athlon_daily -> Use in script, change stats when pokemon drink aprijuice. You can leave it.
```
2. Other
```
pkmn.athlon_feed_juice -> Boolean. Check: pokemon drank aprijuice or not.
pkmn.athlon_medal -> Array: speed, power, skill, stamina and jump. Define medal pokemon got. (each value is boolean)
```

### Reset stats (Reset if pokemon drank aprijuice)
You can call `pokemon.reset_pokeathlon_ate_juice` or just put it in PC.

Explain:

pokemon in `pokemon.reset_pokeathlon_ate_juice` is class Pokemon.

You used it when you created pokemon in event. If you don't know, just leave it.

### Shop exchange
You can set items in file `2 - Item` of folder `Plugins\Pokeathlon\4 - Shop`.

Look at `items = [`. Below #, you can see `[ [...], [...] ]`. It's examples for you.

### Set Switch and Map
Look at examples in example maps.

1. Map (choose pokemon, feed pokemon, etc)

> In event 2 and 3, you can change graphics, just redraw it (it's easy, right?)

> In event 4, you can set map again but be careful position of player.

> In event 9, you can switch in condition and in `List of Event Commands:`

2. Map (play pokeathlon)

> Look at left up corner, you can see event, set switch and transfer player in this

> Players can change graphics with script. Just do like this.
```
In folder `Plugins\Pokeathlon\3 - Minigame\2 - Register player - Play`, look at `3 - Play (set pokemon)`
Read the first lines to learn.
```

### Create minigame
### Attention: you can leave it if you don't know how to create minigame and don't know Ruby code

#### Created minigame
You can use 2 variables `class Pokemon` and `species` of 12 pokemons. Create it when you call script.

Look like: `Minigame.new(pokemon, species)`

Now, after you finished minigame, this event returns 4 variables (here, you use `return` to return)

1. score

> It's array. Size is 4. Order is order you see in screen: from left to right.

> It's score of each event. When result scene shows, you can see it in right screen.

2. miss

> It's array. Size is 12. Order is order you see in screen: from left to right and from up to down. (Pokemon)

> It's `miss score`. You use it when you define `No-Miss Bonus` and `missed collecting the most points`.

3. scorespecial

> It's array. Size is 4. Order is order you see in screen: from left to right.

> It's score of each event. When result scene shows, you can see it in left screen. It's float or integer.

4. scoreindividual

> It's array. Size is 12. Order is order you see in screen: from left to right and from up to down. (Pokemon)

> It's `points leader`. It defines who is `the points leader`

#### Put it in event
In folder `Plugins\Pokeathlon\3 - Minigame\2 - Register player - Play`, look at `4 - Play.rb`

In `def event_start(name)`, you can see `arrpr << proc {...}`. Change `...` into your script.

Example:
`arrpr << proc { Pokeathlon.minigame_hurdle_dash(@store[:species], @store[:id]) }`

You can see 2 variables `@store[:species]` and `@store[:id]`. First is `class Pokemon` and second is `species`

#### Change text in result scene
You can see `arrre << ["Total Time: ", " Seconds", true, true]`

This array to define result in right screen.

If you set like example, you will get this string (ex: points is 12) -> "Total Time: 12.0 Seconds"

Explain:
1. "Total Time: " is text before 12
1. " Seconds" is text after 12
1. true (1) is it will change number (integer) into float or float has 1 number after point (.) - Look at 12 -> 12.0 or 12.3416161111111231124124123 -> 12.3 (default: you can set false or not)
1. true (2) is method arrange (default: you can set false or not). If you set and set it true, it will sort like 0, 1, 2, ..., 9,... and vice-versa
