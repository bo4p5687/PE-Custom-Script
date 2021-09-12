Put `Graphics` in `Graphics\Pictures\Trainer Card BW`

Put `Scripts` in `Plugins\Trainer card - BW`

# How to use

You can add new region leader but you need to do:

1. Look at file `0 - Set trainer.rb`

> You can see `SET` and you need to read comment line (line has #) to add right form.

> You can see there are 8 lines. It's 8 leaders. So, if you has new region (here, it's 2 regions), you need to add 8 lines -> You have 16 lines

2. Look at file graphics

* File in folder `TrainerCard`

Look at these files:
1. `badges`
1. `leaderfaces`
1. `trainerbadges`

You can see their name is `name number`.

Example: `badges 0` -> It's badges you use in first region. So, the second is `badges 1`. The other is same.

* File in folder `Trainers`

It's files that you set in file `0 - Set trainer.rb`. You can add new or using same name. You can use multi frames (like example) or only one frame.
