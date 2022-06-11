Put `Scripts` in `\Plugins\Mystery Gifs - BW Mode`

# How to use
Write code to get gift.

### Types of gift
There are 2 types of gift:
1. Custom
2. PE (raw)
You can use both.

#### Set in script
1. Just Custom: set `USE_PE` = false
1. Custom + PE: set `USE_PE` and `USE_CUSTOM` that are true
1. Just PE: set `USE_PE` = true and `USE_CUSTOM` = false

### Mode
There are two mode, `online` and `offline`. Choose one to use. Set mode with value: `ONLINE`

###### Online
Use web like normal
###### Offline
Use file that you created and put it in your game (root folder).

##### Name of files (default)
Online: `Mystery Gift.txt`

Offline: `Mystery Gift`

### Sequence (create file or create file and upload content)
##### 1. Custom (include: Custom + PE)
First, create custom gift in `0 - 2 - Set value.rb`. Read guide and examples to use.

Second, create event `MGBW.encrypt` -> Start game -> Touch this event -> Save

About `Custom + PE`, after `touch` or `start game`, you will go to debug then press `Manage Mystery Gifts`.

If you don't see custom gift, you can add it after pressing `Manage Mystery Gifts`.
> Call this script: `MGBW.push_gift(id)` - id is id of gift that you want to add

##### 2. PE
Do like normal, you can see Thundaga video to learn it.

All sequences have this action: create event `$Trainer.mystery_gift_unlocked = true` and touch it.

This action will unclock event.

# Get gifts
In example event, you can see these lines
> id = pbNextMysteryGiftID
> pbReceiveMysteryGift(id)

Change `id = pbNextMysteryGiftID` into `id = pbNextMysteryGiftID(true)`

### Note
I put some files and links when you want to test.
