## §e РАБОТА С ДАННЫМИ ИГРОКА
# §e сохраняем эндерчест игрока
function gui:help/return_ender/save
# §e убираем всё чтобы не вернуть лишнего
function gui:help/return_ender/remove_all
##§e РАБОТА С ДАННЫМИ GUI
# §e сохраняем nbt из которого нужно подгрузить страницу
data modify storage gui:main marker set from entity @e[type=marker,tag=active,predicate=gui:marker,limit=1] data
data modify storage gui:main container.config set from storage gui:main marker.config
data modify storage gui:main container.on_change set from storage gui:main marker.else.on_change
data modify storage gui:main container.on_close set from storage gui:main marker.else.on_close
data modify storage gui:main container.components set from storage gui:main marker.else.components
data modify storage gui:main actions set from storage gui:main marker.else.on_open
scoreboard players set @s page 0
# §e запускаем команды, которые хранятся в маркере
function gui:help/st_fn/start
# §e обновляем страницу
execute in overworld positioned 0 -64 0 run function gui:search/help/refresh with storage gui:main
