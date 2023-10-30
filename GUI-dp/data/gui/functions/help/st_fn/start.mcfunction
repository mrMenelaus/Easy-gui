# входные данные
#
# storage,
# array массив комманд, которые выполнить.
$data modify storage gui:main temp_arr set from storage $(storage) $(array)
execute store result score #itt main_score if data storage gui:main temp_arr[]
execute if score #itt main_score matches 0 run return 1
data modify storage gui:main temp set from storage gui:main temp_arr[0]
function gui:help/st_fn/loop with storage gui:main
