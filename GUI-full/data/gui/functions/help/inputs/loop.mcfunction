scoreboard players remove #itt main_score 1
$data modify storage gui:main container.save append from storage gui:main return[{Slot:$(temp)b}]
$data remove storage gui:main return[{Slot:$(temp)b}]
data remove storage gui:main array[-1]
data modify storage gui:main temp set from storage gui:main array[-1]
execute if score #itt main_score matches 1.. run function gui:help/inputs/loop with storage gui:main