Puts `Script` in `\Plugins\Pokemon Monitor Icons`

# How to use
#### Call
`MonitorIcons.show` and change with this method in event `Nurse`
```
count = $player.pokemon_count
for i in 1..count
  pbSet(6, i)
  pbSEPlay("Battle ball shake")
  pbWait(16)
end
```
* If you want to change coordinate of bitmap, call like this MonitorIcons.show(x', y')
> x', y' are numbers that have equation: x (real) = x (recent) + x'; y (real) = y (recent) + y'
* You can change zoom with this method -> MonitorIcons.show(x', y', zoom)
* If you want to change zoom (like zoom = 3) but you don't want to change x and y, just call MonitorIcons.show(0, 0, 3)
* It uses PE's icon.
#### Example
In event `Nurse`, you can try use this coordinate
> MonitorIcons.show(15, -65, 0.45)
