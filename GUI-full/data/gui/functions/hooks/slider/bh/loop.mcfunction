scoreboard players remove #itt main_score 1
execute store result storage gui:main temp[0].Slot byte 1 run scoreboard players get #slot main_score
data modify storage gui:main container.components append from storage gui:main temp[0]
data remove storage gui:main temp[0]
scoreboard players add #slot main_score 1
execute if score #itt main_score matches 1.. run function gui:hooks/slider/bh/loop

