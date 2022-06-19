# How to use
Put files of folder `Script` in `Plugins\Animation use item`

Put the images in `Graphics\Pictures\Use Animations`.
# Important
## Script `Animation Change form`
If you use script: Animation "change form". Read this line: Add for using `Animation Change form`. Do like guide.

Thanks!
## Items
Modify items in file `3 - Add animation (item).rb`

Find this command (ItemHandlers::UseOnPokemon) and add some lines for adding animation.

Example:

##### 0. TM/HM (special)

Find in Script editor

`ItemHandlers::UseFromBag.addIf(proc { |item| GameData::Item.get(item).is_machine? },`

Change `next 1 if pbMoveTutorChoose(move, nil, true, item_data.is_TR?)` into `next 1 if pbMoveTutorChoose(move, nil, true, item_data.is_TR?, item_data)`

##### 1. Evolution Stone (special)

Find in Script editor

`ItemHandlers::UseOnPokemon.addIf(proc { |item| GameData::Item.get(item).is_evolution_stone? },`

above `pbFadeOutInWithMusic {`

add
```
      scene.pbUseAnimations(item,pkmn)
      scene.endUseAnimations
```

##### 2. Item recover HP (`Potion`, `Max Potion`, etc) - (add new method)

Find something like

`ItemHandlers::UseOnPokemon.add(:POTION, proc { |item, qty, pkmn, scene|`

copy all in file `3 - Add animation (item).rb` and change line `next pbHPItem(pkmn, 20, scene)` into `next pbHPItem(item, pkmn, 20, scene)`

You do like it such as `SUPERPOTION`, `HYPERPOTION`, etc. All items use `pbHPItem`, just add item before pkmn

##### 3. Item heals status (`Awakening`, `Antidote`, etc) - (add new method)

Find something like

`ItemHandlers::UseOnPokemon.add(:AWAKENING, proc { |item, qty, pkmn, scene|`

copy all in file `3 - Add animation (item).rb` and...

Above `pkmn.healStatus` add `scene.pbUseAnimations(item, pkmn)` and...

Below something like `scene.pbDisplay(_INTL("{1} woke up.", pkmn.name))` add `scene.endUseAnimations`

You do like it such as `ANTIDOTE`, `BURNHEAL`, etc. All items use `heal_status`.
###### * Items (different - a little) *

`Max revive`

Find something like

`ItemHandlers::UseOnPokemon.add(:MAXREVIVE, proc { |item, qty, pkmn, scene|`

copy all in file `3 - Add animation (item).rb` and above `pkmn.healHP` add `scene.pbUseAnimations(item, pkmn)`

...and remember add `scene.endUseAnimations`

...below `scene.pbDisplay(_INTL("{1}'s HP was restored.",pkmn.name))`

Do this with item like `Max revive` (the items have `pkmn.heal_HP`)

##### 4. Item recover PP (`Ether`, `Max ether`, etc) - (add new method)

Find something like

`ItemHandlers::UseOnPokemon.add(:ETHER, proc { |item, qty, pkmn, scene|`

copy all in file `3 - Add animation (item).rb` and above `scene.pbDisplay(_INTL("PP was restored."))` add `scene.pbUseAnimations(item,pkmn)`

...and below `scene.pbDisplay(_INTL("PP was restored."))` add `scene.endUseAnimations`

You do like it such as `Elixir`, `Max elixir`, etc.

###### * Items (different - a little) *
`PP Up`

Find something like

`ItemHandlers::UseOnPokemon.add(:PPUP, proc { |item, qty, pkmn, scene|`

copy all in file `3 - Add animation (item).rb` and above `pkmn.moves[move].ppup += 1` add `scene.pbUseAnimations(item, pkmn)`

...below `scene.pbDisplay(_INTL("{1}'s PP increased.",movename))` add `scene.endUseAnimations`

##### 5. Other Items

You need to do like this tip:

copy all in file `3 - Add animation (item).rb` and...

Add `scene.pbUseAnimations(item, pkmn)` when you want to show animation

... and add `scene.endUseAnimations` when you want to remove scene...

# Remember  
Just add above this line `next true`
