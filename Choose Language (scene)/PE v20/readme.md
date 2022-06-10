Put `Graphics` in `Graphics\Pictures\Choose Language`

Put `Script` in `Plugins\Choose language`

# How to use
### Set language
There are 2 methods
1. Set in `module Settings` of `Script Editor`
1. Set in file `1 - Set.rb`

##### 1. Set in `module Settings` of `Script Editor`
Delete `#` to use
```
  LANGUAGES = [
  #  ["English", "english.dat"],
  #  ["Deutsch", "deutsch.dat"]
  ]
```
##### 2. Set in file `1 - Set.rb`
You can see these lines, delete `=begin` and `=end` to use
```
module Settings
  LANGUAGES = [
   ["English", "english.dat"],
   ["Việt Nam", "vietnam.dat"]
  ]
end
```

### Change title
In file `1 - Set.rb`, you can see `TITLE = ["Language", "Ngôn ngữ"]`.
1. "Language" is title of "English"
1. "Ngôn ngữ" is title of "Việt Nam"

### Change subtitle
You can see in this line `["English", "english.dat"]`
>"English" is subtitle.

More example, you can see this line `["Việt Nam", "vietnam.dat"]`
> "Việt Nam" is subtitle.

### Add graphics (ensign)
Name of ensign is name of subtitle. You can add it and put it in `Graphics\Pictures\Choose Language`.