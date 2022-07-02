Put files in `Script` in `\Plugins\Type Quiz`

# How to use
There are 3 methods to call this script:
- `TypeQuiz.message`
> Using the quiz in `standard text message`, put in `conditional branch` and `handle` when the player `answers correctly` and `incorrectly`, respectively.

- `TypeQuiz.scene(X)` with `X` is the `number of total questions`
> It will return the `number of question answered correctly`.

- `TypeQuiz.custom(type1, type2, type3)`
```
type1, type2 and type3 are Symbol (For example: :NORMAL)
type1 is type of attacker
type2 and type3 are type of defender
```
> It will return `result` immediately.
