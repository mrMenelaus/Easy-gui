# §e возвращаем предметы игроку
data modify storage gui:main return set from storage gui:main container.EnderItems
data remove storage gui:main return[{tag:{null:1b}}]
execute if data storage gui:main container.config.ignore_slots[] run function gui:help/inputs/start 
execute if data storage gui:main return[] run function gui:gui/refresh/return
# §e обрабатываем кнопки если предмет был у игрока
execute if score #button main_score matches 1 run function gui:gui/refresh/buttons
execute if data storage gui:main container.on_change[] run function gui:gui/refresh/on_change
data modify storage gui:main container.config.page set value ""
execute if data storage gui:main {container:{config:{getter:1b}}} store result storage gui:main container.config.page int 1 run scoreboard players get @s page
# §e загружаем страницу после всех изменений
function gui:gui/refresh/mask
