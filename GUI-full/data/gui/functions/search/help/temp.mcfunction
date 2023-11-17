## GOOD
### РАБОТА С ДАННЫМИ ИГРОКА
# сохраняем эндерчест игрока
function gui:help/return_ender/save
# убираем всё чтобы не вернуть лишнего
function gui:help/return_ender/remove_all
### РАБОТА С ДАННЫМИ GUI
# сохраняем nbt(массив) из которого нужно подгрузить страницу
execute store result storage gui:main id int 1 run scoreboard players get @s ID 
function gui:search/help/set_container with storage gui:main
data modify storage gui:main marker set from entity @e[type=marker,tag=active,predicate=gui:marker,limit=1] data.config
data remove storage gui:main container.save
data remove storage gui:main container.components
data remove storage gui:main container.history
data remove storage gui:main container.sliders
data modify storage gui:main container.folder set from storage gui:main marker.folder 
data modify storage gui:main container.ignore_slots set from storage gui:main marker.ignore_slots 
scoreboard players set @s page 0
execute store result score @s getter run data get storage gui:main marker.getter
execute store result score @s type run data get storage gui:main marker.type
execute store result score @s components run data get storage gui:main marker.components
execute store result score @s context run data get storage gui:main marker.context
execute store result score @s context+ run data get storage gui:main marker.context+
# запускаем команды, которые хранятся в маркере
function gui:help/st_fn/marker/start
# обновляем страницу
execute in overworld positioned 0 -64 0 run function gui:search/help/refresh with storage gui:main
