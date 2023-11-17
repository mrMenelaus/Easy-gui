## INPUT DATA
# folder 
# direction
# start
# lenght
$scoreboard players set #direction main_score $(direction)
$scoreboard players set #slot main_score $(start)
$scoreboard players set #itt main_score $(lenght)
$data modify storage gui:main temp set from storage gui:main $(folder)
execute store result score #this.lenght main_score if data storage gui:main temp[]
execute if score #this.lenght main_score < #itt main_score run return 1
execute if score #direction main_score matches 1 run function gui:hooks/slider/up
execute if score #direction main_score matches -1 run function gui:hooks/slider/down
$data modify storage gui:main $(folder) set from storage gui:main temp
function gui:hooks/slider/bh/loop
execute in overworld positioned 0 -64 0 run function gui:hooks/normalize
playsound block.amethyst_block.resonate master @s ~ ~ ~ 1 2