Put `Script` above Main.

# How to use

In `def push_option`, you can add below this line
> m = ["ball","",12,""]

In array, it means: Name of sprite, bitmap (I used in folder Pictures\HGSSPauseMenu), number (marke this line), title (detail)

In the line:

@option.push(a,b,c,d,e,f,g,h,i,j,k,l,m)

just add them "a,b,c,d,e,f,g,h,i,j,k,l,m", this is the lines above.

After this line, this is the condition, it means: the feature can appear when the game starts or after an event, etc.

You can add like the example.

In `def position_option`, you can add your script which shows here. Just set line something like `elsif @option[@position][2] == 1`, 1 it means the number you add in `def push_option`.

Maximum: there are 12 features, if you want more, you need to edit this script.