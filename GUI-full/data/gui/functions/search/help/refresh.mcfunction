## обновляем страницу
data modify storage gui:main container.number set value ""
execute if score @s getter matches 1 store result storage gui:main container.number int 1 run scoreboard players get @s page
execute if function gui:gui/refresh/context/check run function gui:gui/refresh/context/load/start
# обновляем страницу
execute in overworld positioned 0 -64 0 run function gui:gui/refresh/mask
# сохраняем изменения
data modify storage gui:main container.EnderItems set from entity @s EnderItems
$data modify storage gui:main gui_cash.$(id) set from storage gui:main container