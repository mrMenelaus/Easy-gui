execute store result score #itt main_score if data storage gui:main container.ignore_slots[]
data modify storage gui:main array set from storage gui:main container.ignore_slots
data modify storage gui:main temp set from storage gui:main array[-1]
data remove storage gui:main save
function gui:help/inputs/loop with storage gui:main
scoreboard players set #ignore boolean 1