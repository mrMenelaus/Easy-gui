## INPUT DATA
# folder 
# start
# lenght
$scoreboard players set #slot main_score $(start)
$scoreboard players set #lenght main_score $(lenght)
$data modify storage gui:main temp set from storage gui:main $(folder)
$data modify storage gui:main container.sliders.$(folder) set from storage gui:main temp
execute store result score #this.lenght main_score if data storage gui:main temp[]
execute if score #this.lenght main_score > #lenght main_score run scoreboard players operation #this.lenght main_score = #lenght main_score
scoreboard players operation #itt main_score = #this.lenght main_score
function gui:hooks/slider/bv/loop
execute in overworld positioned 0 -64 0 run function gui:hooks/normalize