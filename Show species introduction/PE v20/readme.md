Put files of `Show species introduction` in `\Plugins\Show species introduction`

# How to use
Call: `show_image_pokemon(specie, gender, form, shiny, shadow, seen)`

### Explain
- specie is specie's number
- seen: when you set true, specie will show on pokedex `(default: true)`
- gender: you can set these numbers; `0 = male, 1 = female, 2 = genderless` `(default: 0)`
- form: set number of form such as 0, 1, 2, 3, etc `(default: 0)`
- shiny: when you set true, it will show shiny pokemon `(default: false)`
- shadow: when you set true, it will show shadow pokemon `(default: false)`

#### Examples
`show_image_pokemon(:CHIKORITA)` -> it will show Chikorita
`show_image_pokemon(:SHELLOS, 0, 1)` -> shows Shellos in East Sea form
