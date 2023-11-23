## INPUT DATA
# folder 
# direction
# start
# lenght
$scoreboard players set #itt main_score $(value)
$scoreboard players set #begin main_score $(begin)
$data modify storage gui:main temp set from storage gui:main container.sliders.$(folder)
execute store result score #this.lenght main_score if data storage gui:main temp[]
execute if score #this.lenght main_score < #itt main_score run return 1
function gui:hooks/slider/up
$data modify storage gui:main container.sliders.$(folder) set from storage gui:main temp

function gui:hooks/slider/bh/loop
execute in overworld positioned 0 -64 0 run function gui:hooks/normalize
playsound block.amethyst_block.resonate master @s ~ ~ ~ 1 2