scoreboard players remove #itt main_score 1
$$(temp)
data remove storage gui:main marker.commands[0]
data modify storage gui:main temp set from storage gui:main marker.commands[0]
execute if score #itt main_score matches 1.. run function gui:help/st_fn/marker/loop with storage gui:main