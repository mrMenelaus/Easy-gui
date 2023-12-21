# §e обновляем страницу
data modify storage gui:main container.config.page set value ""
execute if data storage gui:main {container:{config:{getter:1b}}} store result storage gui:main container.config.page int 1 run scoreboard players get @s page
execute store result storage gui:main container.config.id int 1 run scoreboard players get @s ID
execute if function gui:gui/refresh/context/check_load run function gui:gui/refresh/context/load/start
execute in overworld positioned 0 -64 0 run function gui:gui/refresh/mask
# §e сохраняем изменения
data modify storage gui:main container.EnderItems set from entity @s EnderItems
$data modify storage gui:main gui_cash.$(id) set from storage gui:main container