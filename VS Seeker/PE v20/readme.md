Put files of `Script` in `\Plugins\VS Seeker`

# How to use

### Create item
Create item in file pbs `items.txt` like this
```
[VSSEEKER]
Name = VS Seeker
NamePlural = VS Seeker
Pocket = 8
Price = 0
FieldUse = Direct
Flags = KeyItem
Description = VS Seeker.
```

### Create event
Set event name with this form `Trainer(number)` or `Trainer(number)VS`
> `number` is basic thing of PE

Set comment with this form
```
VS Seeker
number
```
`number` is event’s number page which has script activate event `Trainer battle`

After battling, set `VSSeeker.reset_event` for resetting.

`Recommend`: Set it condition branch when player won.

### Set value
There are values in file `0 - Settings.rb` you can set it.

- `NOT_MAP`
> Put map id in []. When this map id is in [], player can't use VS SEEKER in this map

- `IN_CAVE`
> When `IN_CAVE = true`, player can use VS SEEKER in maps which is caves

- `INDOORS`
> When `INDOORS = true`, player can use VS SEEKER in maps which is indoor

- `STEPS`
> After walking `STEPS` steps, player can use VS SEEKER

- `ACCEPT_ID`, `REJECT_ID`
> Animation id, click `Database` then choose `Animation`. Just like animation `Grass rustle`.

- `EVOLVE`
> When `EVOLVE = true`, player re-match... And he can have new specie if old specie reaches level to evolve

- `ANNOUNCEMENT`
> When `ANNOUNCEMENT = true`, announcement will appear after using

- `ANIMATION`
```
Set animation when using VS SEEKER
It doesn't show animation when don't set
Put name of picture in `Graphics/Characters` in "" below in order
Example:
 There is "boy_vsseeker" in `Graphics/Characters`
 And change animation when using VS Seeker with first character. It means "Red" when starting.
 Put it in ANIMATION like this

ANIMATION = [
 "boy_vsseeker", # Player A
 ....

Just add in "", don't delete other line if you don't know what is it
```

- `DIFFICULT`
```
When `DIFFICULT = true`,
 + And when `INCREASE = true`, player has more pokemon (+1, +2, +3, +5). It depends AI of trainer.
 + Level of pokemon will be higher than level of pokemon, except reaching maximum level. It depends AI of trainer. (+10, +15, +20, +30)
```

- `INCREASE`
```
When `INCREASE = true`, trainer has more pokemon (+1).
Condition: base trainer has less than 6 (MAX_PARTY_SIZE = 6).
When `MAX_PARTY_SIZE` is higher than 6, party of opposite can higher.
```

- `CHANGE_FORM`
> When party size increases, new pokemon is rotom who has multiple form and you want to set random his form. Set `CHANGE_FORM = true`.

- `BAN`
> Add pokemon in `BAN`, when you doesn't want to add these pokemon in opposite trainer. Example: when you want to ban Arceus, set like this `BAN = [:ARCEUS]`

- `STORE`
> When you want to store party of opposite trainer in next time, set `STORE = true`.

- `ONLY_VS_SEEKER`
> When `ONLY_VS_SEEKER = true`, player can't battle trainer who is on edge when he isn't re-match
