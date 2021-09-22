Puts 'KleinBitmap.dll' in main folder



# Choose file

Choose one of 2 files, 'Stat Down - Up Animation (2 animations).rb' or 'Stat Down - Up Animation (8 animations).rb', for using

Puts `Graphics.rar` in `\Graphics\Pictures\Stats Animation`

# Addition

If you use 'Stat Down - Up Animation (8 animations).rb', you must change some lines.



In BattleHandlers_Abilities, change...

	battle.pbCommonAnimation("StatUp",target)

...into...

	battle.pbCommonAnimationStat("StatUp","Attack",target)

In Battler_StatStages, change...

	@battle.pbCommonAnimation("StatUp",self) if showAnim

...into...

	@battle.pbCommonAnimationStat("StatUp",PBStats.getName(stat),self) if showAnim



Note: You must change two times this lines in this script.



In the same script (Battler_StatStages), change...

	@battle.pbCommonAnimation("StatDown",self) if showAnim

...into...

	@battle.pbCommonAnimationStat("StatDown",PBStats.getName(stat),self) if showAnim



Note: You must change two times this lines too in this script.



In Move_Effects_000-07Fscript, change...

	@battle.pbCommonAnimation("StatDown",user)

...into...

	@battle.pbCommonAnimationStat("StatDown","Attack",user)

...and in same def, change...

	@battle.pbCommonAnimation("StatUp",user)

...into...

	@battle.pbCommonAnimationStat("StatUp","Attack",user)



There are the lines in PE v.18(raw), if you add some abilities which use pbCommonAnimation("StatUp",...), you need to change it, like the lines above.
