scoreboard players remove #itt main_score 1
$$(temp)
data remove storage gui:main temp_arr[0]
data modify storage gui:main temp set from storage gui:main temp_arr[0]
execute if score #itt main_score matches 1.. run function gui:help/st_fn/loop with storage gui:main