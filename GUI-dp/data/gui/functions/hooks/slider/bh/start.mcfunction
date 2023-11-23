## INPUT DATA
# мы хотим поместить слайдер на страницу, создать кнопки для слайда, мы можем принимать параметры длины, начала, папки, конца
$data modify storage gui:main temp set from storage gui:main $(folder)
$data modify storage gui:main container.sliders.$(folder) set from storage gui:main temp
$scoreboard players set #lenght main_score $(lenght)
$scoreboard players set #begin main_score $(begin)
$data modify storage gui:main untemp set value [{Slot:$(start)b,id:"barrier",Count:1b,tag:{CustomModelData:2,display:{Name:'{"text":"Назад","color":"aqua","italic":false}'},commands:["function gui:hooks/slider/hsd {folder:$(folder),value:$(lenght),begin:$(begin)}"]}},{Slot:$(end)b,id:"barrier",Count:1b,tag:{CustomModelData:3,commands:["function gui:hooks/slider/hsu {folder:$(folder),value:$(lenght),begin:$(begin)}"],display:{Name:'{"text":"Вперёд","color":"aqua","italic":false}'}}}] 
data modify storage gui:main container.components append from storage gui:main untemp[]


execute store result score #itt main_score if data storage gui:main temp[]
scoreboard players operation #itt main_score < #lenght main_score
function gui:hooks/slider/bh/loop
execute in overworld positioned 0 -64 0 run function gui:hooks/normalize