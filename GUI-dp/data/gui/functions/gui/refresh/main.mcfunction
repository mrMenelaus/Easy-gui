# возвращаем предметы игроку
data modify storage gui:main return set from storage gui:main container.EnderItems
data remove storage gui:main return[{tag:{null:1b}}]
# Soon
#data modify storage gui:main container.save set from storage gui:main return
#execute if data storage gui:main container.ignore_slots[] run function gui:help/inputs/start 
execute if data storage gui:main return[] run function gui:gui/refresh/return
# обрабатываем кнопки если предмет был у игрока
execute if score #button main_score matches 1.. run function gui:gui/refresh/buttons with storage gui:main container
# загружаем страницу после всех изменений
function gui:gui/refresh/mask with storage gui:main container
