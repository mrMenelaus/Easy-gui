# входные данные
#
# storage,
# array массив комманд, которые выполнить.
execute store result score #itt main_score if data storage gui:main marker.commands[]
execute if score #itt main_score matches 0 run return 1
data modify storage gui:main temp set from storage gui:main marker.commands[0]
function gui:help/st_fn/marker/loop with storage gui:main
