### Graphics
Use graphics in PE v19. Do like guide about graphics of v19

### Script
Puts `Scripts` into `\Plugins\Fame Checker`

You can choose add new item or call script to use

1. Add new item in items.txt like this:
```
[FAMECHECKER]
Name = Fame Checker
NamePlural = Fame Checker
Pocket = 8
Price = 0
Flags = KeyItem
FieldUse = Direct
Description = A device that enables you to recall what you've heard and seen about famous people.
```

2. Call: FameChecker.show

## How to use
### First
#### Add informations of famous in file `2 - Set value to store.rb`

2 code need to write when you want to add new famous:
+ Add: `FameChecker.list` (Famous)
+ Add: `FameChecker.infor` (Information was related this famous - You need to add 6, like FRLG)

Look at examples and write like that, you have to add all values and read carefully comments to add

### Second, after adding informations, set it true if you want to see

* Main information of `famous person` -> Call: FameChecker.seenList(`name`)

-> `name` is value that you added in `FameChecker.list(name, hash)`

* Minor information of `famous person` -> Call: FameChecker.seenInfor(`name`, `number`)

-> `name` is value that you added in `FameChecker.list(name, hash)`

-> `number` is order when you set `FameChecker.infor`, maximum is `5` and minimum is `0`

### Third
* You can change name of `famous person` into `your player`, do like it.

Call:
```
FameChecker.changeList(name, feature, "#{$player.name}")
```
-> `name` is value that you added in `FameChecker.list(name, hash)`

-> `feature` is `:name`, `:graphic`, `:order`, `:introduce` but in this case, you need to write `:name`

-> the third part is player's name. (It's examples. It's like `new_thing` in example below)

You can change informations of `famous person`.

Just like, in manga, Red met Giovanni in the first time, he is a miner (I think) but next time, he is Leader of team Rocket and Gym Leader.

* When you want to change minor informations in game, do like it.

Call:
```
FameChecker.changeInfor(name, feature, new_thing, position)
```
-> `name` is value that you added in `FameChecker.list(name, hash)`

-> `feature` is `:title`, `:graphic`, `:introduce` but in this case, you need to write `:name`

-> `new_thing` is content compatible with feature. When it isn't compatible, you will get error.

-> `position` is position of minor information, minimum is 0 and maximum is 5

## Attention
If you set wrong method or call wrong method, you will get error
