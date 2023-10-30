### РАБОТА С ДАННЫМИ ИГРОКА
# сохраняем эндерчест игрока
function gui:help/return_ender/save
# убираем всё чтобы не вернуть лишнего
function gui:help/return_ender/remove_all

### РАБОТА С ДАННЫМИ GUI
# сохраняем nbt(массив) из которого нужно подгрузить страницу
execute store result storage gui:main id int 1 run scoreboard players get @s ID 
function gui:search/help/set_folder with storage gui:main
data modify storage gui:main container.number set value ""
# сохраняем какой элемент массива использовать
scoreboard players operation @s boolean = out boolean
scoreboard players operation @s type = out type
scoreboard players operation @s save = out save
scoreboard players operation @s load = out load
# запускаем команды, которые хранятся в маркере
function gui:help/st_fn/start {"array":"marker.commands","storage":"gui:main"}


# обновляем страницу
execute in overworld positioned 0 -64 0 run function gui:search/help/refresh with storage gui:main
