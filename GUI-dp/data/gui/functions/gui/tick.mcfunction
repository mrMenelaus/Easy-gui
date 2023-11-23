## GOOD
# маркер работает один тик!

# забираем тег у маркера
tag @s remove active

# используя id систему, исполняем команду от игроков 
scoreboard players operation temp main_score = @s id
execute as @a[distance=..8,predicate=gui:id] run function gui:gui/refresh/pre

# удаляем предметы, которые могли выпасть
execute if score #kill main_score matches 1 run function gui:gui/refresh/kill