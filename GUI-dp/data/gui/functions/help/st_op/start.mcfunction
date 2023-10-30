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
$data modify storage gui:main output set from storage $(storage) $(array1)
data modify storage gui:main output1 set from storage gui:main output
$data modify storage gui:main input set from storage $(storage) $(array2)
data modify storage gui:main input1 set from storage gui:main input
#tellraw @a {"nbt":"input","storage": "main"}
execute store result score #itt main_score if data storage gui:main input[]
data modify storage gui:main temp set from storage gui:main input[-1]
execute unless score #itt main_score matches 0 run function gui:help/st_op/loop with storage gui:main