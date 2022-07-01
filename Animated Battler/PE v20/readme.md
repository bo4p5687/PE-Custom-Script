Put `files` of `Animated Battler` in `\Plugins\Animated Battler`

# How to use

### Change value
You can set `wait frame` and `repeat frame`

What is `wait frame`?
> One frame moves other frame after `wait frame` frame. (`wait frame` is a `number`)

What is `repeat frame`?
> After finishing all frames once, it will do it again. Animated bitmap will stop after `repeat frame` times. (`repeat frame` is a `number`)

Look at `0 - Set repeat.rb`, you can set frames with these values:

##### Trainer:
- `wait frame` is `WAIT_TRAINER`
- `repeat frame` is `TRAINER`

##### Pokemon:
- `wait frame` is `WAIT_POKEMON`
- `repeat frame` is `POKEMON`

##### Animated in battle
- `ANIMATED`
> Set true when you want to show animated

- `SPEED`
> It's `speed` of animated battlers. After `speed` times, graphic will show next frame.

- `FAINTED_FIRST`
> Using when pokemon `fainted`. When it's true, pokemon that will show first frame fainted (`Condition`: `Animated` is `false`)

- `FAINTED`
> When it's true, pokemon has animated when he fainted.

- `MOVES`
> When it's true, pokemon has animated when he uses moves.

- `SPEED_MOVE`
> It's `speed` of animated battlers, it's in condition: Pokemon use moves. After these times, graphic will show next frame.

##### More features
When you want animated in some features such as after evolution screen, after hatching screen, etc.
Then you need to read lines below. When not, you need to `delete` file `6 - ...` and files has name which `starts with number 7`

`2 values` need to set when you use other features, there are `FRAME_PKMN` and `CHECK_ONE_TIME`

- `FRAME_PKMN`
> It's `speed` of pokemon in these features.

- `CHECK_ONE_TIME`
> Just shows animated once when it's true and vice versa.

You can choose feature which you want to show. Content of each feature with start name of these files:

-`7-1 - ...`
> Menu (Summary)

-`7-2 - ...`
> Evolution

-`7-3 - ...`
> Pokedex

-`7-4 - ...`
> Animation when using HM

-`7-5 - ...`
> Storage (mosaic bitmap)

-`7-6 - ...`
> Egg Hatching

-`7-7 - ...`
> Trading

-`7-8 - ...`
> Mystery Gift

-`7-9 - ...`
> Hall of Fame
