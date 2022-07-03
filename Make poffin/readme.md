# Instruction

There are script and graphics.

Graphics: Put the both in `Graphics\Pictures`

Script: Put these script above `Main` (PE `v.18-`) or in `\Plugins\Make poffin` (PE `v.19+`)

After that, play `new game` for using this.

#### Make poffin
Call: `FeaturesPoffin.play # -> for playing`

#### Before you play, you can set rule for this. (These rules need to `call above` `FeaturesPoffin.play`)
Call:

- `setRulesPoffin("notSame")`
> Player cant use the same berry. If it's same, you must get Foul poffin -> +2 random 3 condition

- `setRulesPoffin("quantity",number)`
> Change number into `0`, `1`, `2`, `3`. If you set the different number, you will get error. The quantity of players is `1`, `2`, `3`, `4`. If you dont call it, you will play alone

#### Next, you can set the skill of player
Call:

- `setRulesPoffin("newbie")`
> Skill level: newbie

- `setRulesPoffin("oldbie")`
> Skill level: oldbie, players played it many times

- `setRulesPoffin("expert")`
> Skill level: expert, you knew it

#### If you play in `multiple mode`, one of 3 lines above, it will set 100% playes who is `quality` like in () such as `newbie`, `oldbie`, `expert`.
But, if you want in your game, there are `newbie`, `oldbie` and `expert`.
You need to set number after that, it is percentage of player.
If you set wrong, you will get error.

* The distance in mode 3 players between 1 and 2 playes is 30. It's like

- `<= 30%` is 1 player

- from `> 30%` to `<= 60%` is 2 players

- from `> 60%` to `100` is 3 players

`For example`:

- `setRulesPoffin("newbie", 30)`

- `setRulesPoffin("oldbie", 30)`

- `setRulesPoffin("expert", 30)`

The other example: `2 experts`, `1 newbie`

- `setRulesPoffin("newbie", 20)`

- `setRulesPoffin("expert", 55)`

The other example: in mode `3 players, 1 newbie, 1 oldbie` (The distance is 50 for 1 player)

- `setRulesPoffin("newbie", 25)`

- `setRulesPoffin("oldbie", 35)`

### If you dont set rule skill for player, it will be newbie.

#### Set berry
You can set berry for expert who use it in `module BerryPoffin` and look at `BerryExpert`. Add like the example or you can change it.

You can change the number each flavor in `module FlavorPoffin`.

In this module, you can see `Flavor_Multiple_Mode` -> Use when you play `multiple mode` and `Flavor_Alone_Mode` -> Use when you play alone.

Moreover, you must to add the name the berry or change the `sheen` number condition in `Smoothness` (in `module FlavorPoffin`, of course).

#### Modify graphics
In file `2 - Init.rb` of folder `2 - Play poffin`, you can find some numbers: `RadiusCore`, `LimitScale`
> You need to change if you change the size of bottle.

The lines below `LimitScale` is the time when you finish.

##### Attention
If you want to change it, you need to change the AI too. Maybe, I set AI not good but you need to read the script and rewrite it if you want to change

And, the value `MaxPoffin = [true, 999]`
> It sets the limit, read the comments.

#### Poffin case
In `1 - Set variable - position.rb` of `3 - Poffin case`, it's the position when you click it. If you rewrite, you need to change it too.

You can call in event like: `FeaturesPoffin.eat`

If you want to use it like item, read in file `1 - Set variable - position.rb` of folder `3 - Poffin case`
