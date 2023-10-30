scoreboard players remove #itt main_score 1
$data remove storage gui:main output[$(temp)]
data remove storage gui:main input[-1]
data modify storage gui:main temp set from storage gui:main input[-1]
execute if score #itt main_score matches 1.. run function gui:help/st_op/loop with storage gui:main