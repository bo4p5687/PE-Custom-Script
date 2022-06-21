Take `graphics` in PE v19 and read `readme`.

Put `Script` in `\Plugins\Gender selection (style SM)`

# How to use
Put portrait of players in '\Pictures\GenderSelection', each picture has size `100px x 100px`

### Call script
Call: `GenderPickSelection.show`. Change this with event `choose gender`

#### Name of pictures:
Look at these values in files `1 - Script.rb`:
* `SET_NAME`
-> When `SET_NAME` is true, script will use name of bitmap in `NAME_OF_BITMAP`. (Quantity of names has to equal quantity of characters).

-> When `SET_NAME` is false, it will use name in file `metadata.txt`, first line.

##### Example in file `metadata.txt`:
`TrainerType = POKEMONTRAINER_Red` -> Name of bitmap need to set `POKEMONTRAINER_Red`

* `NAME_OF_BITMAP`

In this value, I set 8 images, you can add it if you use this.

If you set only 8 character, position of character is:
+ Top: A, C, E, G
+ Bottom: B, D, F, H
