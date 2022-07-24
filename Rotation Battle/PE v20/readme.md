Put `Scripts` in `\Plugins\Rotation battle`

# How to use
Before you set battle, you need to call: `setBattleRule("rotationBattle")`

This script uses keys `O` and `P` on keyboard. You can edit in file `6 - 1 - Fight menu.rb`. Look at these lines:
1. Input.triggerex?(:O)
1. Input.triggerex?(:P)

You can modify position of pokemon in file `6 - 0 - Battle scene.rb`. Look at this def `def set_position_of_pokemon_rotate(onlyone = -1, showarr = false)`

You can see `# Player` and `# Opponent`. The lines below is position of pokemons.

### Some values you can use to edit this script
In `class Battle`, there are:
1. rotate_player ->  position of player's main pokemon
1. rotate_opponent -> position of opponent's main pokemon

You can know this value @battle.something. So, you can check or edit like these forms:
1. @battle.rotate_player
1. @battle.rotate_opponent

`$rotation` -> Trigger to use this script, you can use it to check condition or whatever

In file `0 - Set rule.rb`, value `BLACK` means:
> When `BLACK = true`, pokemon who has color black is inactive.
