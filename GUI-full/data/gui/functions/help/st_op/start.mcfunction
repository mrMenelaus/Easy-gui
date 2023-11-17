# входные данные
#
# storage,
# array1 массив из которого вычесть,
# array2 массив который вычесть.
#
# выходные данные
# 
# main otput
data remove storage gui:main output
execute if score @s components matches 1 run data modify block ~ ~ ~ Items append from storage gui:main container.components[]
data modify storage gui:main input set from storage gui:main container.EnderItems
execute store result score #itt main_score if data storage gui:main input[]
data modify storage gui:main temp set from storage gui:main input[-1]
execute if score #itt main_score matches 1.. run function gui:help/st_op/loop with storage gui:main
data modify storage gui:main output set from block ~ ~ ~ Items
data remove block ~ ~ ~ Items